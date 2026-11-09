# Review of AbelianSchemesAndArithmeticModuli (pull request #849 at a007331)

**Verdict:** needs changes

Incremental re-review of 39 changed lines since e77dd51. The previous finding is repaired, and the new EquivariantIntersectionTheory citations in A3.6 (5) resolve and are mathematically sound. The one finding is the push gate's `statement-hygiene` rule, which fails on this head on a `Suggested.lean` line the diff does not touch; no acceptance while the gate fails. It is P3: nothing blocks. File references are to `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md` and `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/Suggested.lean`.

## R01 (P3) — The gate's `statement-hygiene` rule fails on `tateModule_rank`, which concludes `Nonempty (… ≃ₗ …)`

**Location.** `Suggested.lean:266–269`: `theorem tateModule_rank … : Nonempty (tateModule A ℓ ≃ₗ[ℤ_[ℓ]] (Fin (2 * g) → ℤ_[ℓ]))`.

**Claim.** The gate rule (`scratch/gate.md`; my own run printed the same line) refuses a theorem that concludes `Nonempty (A ≃ B)` unless its name is `nonempty_*`. This theorem has no canonical map to state as `IsIso`. Naming the isomorphism as data would be sorry'd data, so that repair is not available either.

**Witness.** Gate output: `statement-hygiene: line 268: P3 theorem tateModule_rank concludes Nonempty (tateModule A ℓ ≃ₗ[ℤ_[ℓ]] (Fin (2 * g) → ℤ_[ℓ]))`. The pinned Tau Ceti splits the same fact into `free_of_natCard`, `finite_of_natCard` and `finrank_eq_of_natCard` (`TauCeti/Algebra/Module/Torsion/TateModule.lean:637, 642, 647`).

**Repair.** Keep the name and the docstring ("free of rank `2g`"), and replace the conclusion by

```lean
    Module.Free ℤ_[ℓ] (tateModule A ℓ) ∧ Module.Finite ℤ_[ℓ] (tateModule A ℓ) ∧
      Module.finrank ℤ_[ℓ] (tateModule A ℓ) = 2 * g := by
  sorry
```

The `Module.Finite` conjunct is needed. At `g = 0` an infinite free module also has `finrank = 0`. The README (`README.md:1848, 1854`) already describes this form, so it needs no change. Tested on a scratch copy:

- It elaborates with exactly the file's 21 `sorry` warnings.
- `#check` shows the three conjuncts with all binders kept.
- In the same file I proved that `Module.Free R M ∧ Module.Finite R M ∧ Module.finrank R M = n ↔ Nonempty (M ≃ₗ[R] (Fin n → R))` holds for every module over a nontrivial commutative ring, using `Module.finBasisOfFinrankEq`, `Module.Free.of_equiv`, `Module.Finite.equiv` and `LinearEquiv.finrank_eq`. The new statement therefore means exactly what the old one did.
- The gate's text checks on that copy print `statement-hygiene=0`.

## Previous findings

- R01 — repaired: `README.md:950` now reads "Over a field and for `n ≠ 0` the statement has no content: `A[n]` is a finite `K`-scheme, the spectrum of a semilocal ring, so `Pic(A[n])` is trivial."

## Verified sound

**Scope of this round.** I read every line of the change set (`changes.md`: 28 insertions and 11 deletions, all in `README.md`) together with what it cites or what cites it:

- the Scope bullet at `README.md:177–181`;
- the new supplier table at `README.md:561–566`;
- A3.6 in full (`README.md:1546–1642`), A3.3 (the torsor `q`, `README.md:1481–1505`) and A3.13's use of A3.6 (5) (`README.md:1786–1787`);
- the Layer A3 dependencies (`README.md:1820–1824`);
- the A1.7 paragraph and its Checks (`README.md:932–962`).

On the supplier side I read:

- EquivariantIntersectionTheory at its open head ca06895: Conventions, supplier contracts, Layer 1 and the consumers section;
- SchemeAndStackFoundations §§1.13, 1.21 and 1.22 on main.

`Suggested.lean` and `metadata.toml` are byte-identical to e77dd51 (`git diff --quiet` succeeds).

**Principles.** The new text plans nothing that EquivariantIntersectionTheory already plans: it cites §§1.1 and 1.4 by name and uses them. It adds no shortcut: (5) is stated for every finite locally free `H ⊆ K(L)` over every base. I found no copied passage, algorithm, `set_option`, `lemma`, process word or pull-request number.

**Gate.** My run on this head printed

```text
gate AbelianSchemesAndArithmeticModuli: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=1 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

The worker's gate also records `build=0`. The single failure is R01.

- `git diff --stat origin/main...HEAD` outside the folder is empty. The long list of files under "Files changed outside the folder" in `changes.md` comes from the merge of main into the branch, not from changes of the pull request's own.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 9.5 s. Its only output is 21 `declaration uses 'sorry'` warnings (lines 103–415). `scratch/signatures.md` gives the elaborated types of all 29 declarations; they are unchanged since e77dd51. Its one lead is that `IsRosatiPositive` drops `[StarModule ℝ E]`. This is harmless: the body `IsSelfAdjoint s ∧ ∀ x ≠ 0, 0 < t (s * x * star x)` (`Suggested.lean:362–363`) uses no scalar–star compatibility, and `rosatiPositiveSquareRoot` keeps the binder.

**Direction check.** The run printed exactly

```text
depcheck: 236 roadmaps, 2264 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line.

The new supplier EquivariantIntersectionTheory, an open new-roadmap pull request by another author, is not in `ORDER.txt`, so the check does not place it. Its own suppliers are all on main: SchemeAndStackFoundations, AlgebraicVectorBundles, SchubertGeometry and StableReduction (verified in the content checkout). It cites nothing from this roadmap: its Downstream consumers section reads "No roadmap on main cites this one", and the word "abelian" does not occur in its README. So it is placed before this roadmap (order line 41) without an upward edge or a cycle. The pull request's merge-order paragraph lists it before this roadmap.

**Citations resolved this round.**

| Citation | Where resolved | What it says |
|---|---|---|
| EquivariantIntersectionTheory §1.1 | README at open head ca06895, line 267 (§1.1), line 275 (constructions), line 50 (Convention 1) | linearization `φ : a^*L ≅ pr₂^*L` with cocycle and unit conditions; tensor, dual, trivial object, pullback along equivariant maps, base change `S′ → S`, forgetful map to `LineBundleClass`; `G` flat of finite presentation over a scheme `S`, acting through SchemeAndStackFoundations §1.13 |
| EquivariantIntersectionTheory §1.4 | same head, line 331 (§1.4), line 336 | `Pic [X/G] ≅ Pic^G(X)`, through `QCoh.presentationEquiv` for `actionQuotient G X`: quasi-coherent modules on `[X/G]` are modules on `X` with descent data along the `G`-torsor `X → [X/G]`, "and invertible ones are the linearised invertible sheaves". This is the groupoid-level identification that A3.6 (5) uses. |
| SchemeAndStackFoundations §1.13 | main, `README.md:2418` | `Action G X := ModObj G X`, `GroupSpace.ofGroupScheme`, `Action.free_iff_mono` |
| SchemeAndStackFoundations §1.21 | main, `README.md:2951–2966` | `actionQuotient G X = [X/G]`, `actionQuotient.torsorEquiv`, `.torsor`, `.desc`, and the sheafified quotient as the sheaf of isomorphism classes |
| SchemeAndStackFoundations §1.22 | main, `README.md:2989` | `Stacks.QCoh`, `QCoh.presentationEquiv`, `QCoh.ofSpaceEquiv` |
| Tau Ceti `TateModule` rank API | `TauCeti/Algebra/Module/Torsion/TateModule.lean:625, 637, 642, 647` | `nonempty_linearEquiv_of_natCard`, `free_of_natCard`, `finite_of_natCard`, `finrank_eq_of_natCard` (used for R01) |

The resolver's leads (`scratch/citations.md`) are the same 1 + 38 as at e77dd51. The previous review accounted for them as this roadmap's own `Suggested.lean` declarations and as supplier labels resolved at 21a8758. None of them falls in the changed lines.

**Ownership.** I searched for `G`-linearized invertible sheaves by object: on main, with `grep` over `TauCetiRoadmap/*/README.md` and `Completed/*/README.md`, and at the open heads with `roadmaps grep 'lineari[sz]'`.

- EquivariantIntersectionTheory §1.1 is the only general owner.
- SchubertGeometry S3 on main builds only the `G/B⁻` case. EquivariantIntersectionTheory's boundary table says so.
- GroupSchemesOverABase at its head defers to EquivariantIntersectionTheory 1.1.
- AlgebraicModuliForArithmeticGeometry at its head has no linearized-sheaf target. Its only "linearization" hits are `infinitesimalStabilizer_linearization`.
- SchemeAndStackFoundations on main has only `Γ`-linearizations for a finite constant group: the norm bundle `⊗_γ γ^*L` in §1.17 (`README.md:2663`) and `EquivariantModules` in §2.23.

So the repair moves A3.6 (5)'s descent to the single owner. The overlap report lists no dropped id and no revision-only id.

**Seeded source sample.** None of the thirteen sampled targets lies in the changed passages, and none cites or depends on them. The new text adds no source locator. In A3.6 the locators Faltings–Chai I.5 introduction p. 25, Faltings–Chai I.1.6 p. 4 and Milne 2022 Theorem 13.3(a) p. 25 were only reflowed, word for word unchanged. Their earlier verdicts stand.

**Adversarial calculations.** New rows for the changed statements first, with computed values. They are followed by every row of the review at e77dd51 for statements the diff leaves untouched, each marked as carried. The field-base row of A1.7 is replaced by the new row below.

| Statement | Instances tried | Values on the two sides | Result | Change |
|---|---|---|---|---|
| A3.6 (5), trivial subgroup | `H = 0`, any rigidified `L` | splittings of `𝔾_m → 0`: `1`; linearizations for the trivial group: `1` (the identity, EquivariantIntersectionTheory 1.1 first Check); pairs `(M, α : M ≅ L)` with `q = id`: `1` up to isomorphism | `1 = 1 = 1` | none |
| A3.6 (5), trivial bundle | `E/k̄`, `char k ≠ 2`, `L = O_E`, `H = E[2]` | `K(O) = E`, `e_O = 1`, `G(O) = 𝔾_m × E`; splittings `= Hom(E[2], 𝔾_m)`: `4`; linearizations of `O_E` = characters of `H`: `4`; pairs: `M ∈ ker([2]^*) ∩ Pic⁰ = E^∨[2] = E[2]^D` (A3.5): `4` | `4 = 4 = 4` | none |
| A3.6 (5), nonisotropic `H` | `L = O(2·0)`, `H = E[2]` | `e_L = e_2` is nondegenerate, so a lift commuting with all others does not exist: `0` splittings; descent would need `deg [2]^*M = 4 deg M = 2`: `0` pairs | `0 = 0`; isotropy is necessary | none |
| A3.6 (5), isotropic order two | `L = O(2·0)`, `H = ⟨P⟩`, `P ∈ E[2] ∖ 0` | `e(P,P) = 1`; lifts `u` with `u² = c ∈ k̄^×` rescale to `u² = 1`: `±u`, `2` splittings; pairs: `deg M = 1`, `M = O(Q′)`, `q^*M = O(R + (R+P)) ≅ O(2·0)` iff `2R = P`: `4` solutions `R`, `2` images `Q′ = q(R)` | `2 = 2`; "isotropy alone does not choose the descent" | none |
| A3.6 (5), infinitesimal `H` | ordinary `E/k̄`, `char p`, `H = μ_p ⊂ E[p]`, `L = O_E` | splittings `Hom(μ_p, 𝔾_m) = ℤ/p`: `p`; pairs: `ker q^∨ = (μ_p)^D = ℤ/p` (A3.5): `p`; geometric points of `H`: `1`, so a pointwise linearization would give `1 ≠ p` | `p = p`; the flat finitely presented group scheme of EquivariantIntersectionTheory 1.1 is the right notion | none |
| A3.6 (5), direction of the linearization | EquivariantIntersectionTheory 1.1's `φ : a^*L ≅ pr₂^*L`, `a(h, x) = x + h`; the README's law `(x, ψ)(y, χ) = (x + y, ψ ∘ t_x^*χ)` | fibre at `h`: `φ_h : t_h^*L ≅ L`, the same direction as `ψ`; the cocycle `(μ × 1)^*φ = p₂₃^*φ ∘ (1 × a)^*φ` reads `φ_{g+h} = φ_h ∘ t_h^*φ_g`, that is `s(g+h) = s(h)s(g)`; for commutative `H`, `s(g)s(h) = s(h+g) = s(g+h)`, so anti-homomorphic and homomorphic sections agree, and `φ_0 = id ↔ s(0) = 1` | "exactly the `H`-linearizations" holds with no sign or inverse | none |
| A3.6 (5), supplier hypotheses | `H ⊆ K(L)` finite locally free, translation action | finite locally free means flat with a finite and finitely presented module, so the algebra is finitely presented and EquivariantIntersectionTheory Convention 1 holds; the action `H × A → A` is `i ⊗ 1` followed by addition, a `ModObj` through `GroupSpace.ofGroupScheme` (§1.13) | admitted | none |
| A3.6 (5), `[A/H] ≅ A/H` | free action, A3.3 | `h + a = a ⇒ h = 0`, so `(a, pr₂)` is a monomorphism (`Action.free_iff_mono`); objects of `[A/H]` have no nontrivial automorphisms, so `[A/H]` is its sheaf of isomorphism classes (§1.21), the fppf sheaf quotient that A3.3 represents by `B`; inverse `T → B ↦ A ×_B T`; `H = 0` gives EquivariantIntersectionTheory's Check `[X/1] = X` | the step is a deduction from the cited suppliers | none |
| A3.6 (5), groupoid fibre | equivalence `Φ : Pic(A/H) → Pic^H(A)` with `F ∘ Φ = q^*` | `(M, α)` ↦ transport of the canonical linearization of `q^*M` along `α`; essential surjectivity gives surjectivity; full faithfulness gives `β : M₁ ≅ M₂` with `q^*β = α₂⁻¹α₁`, hence injectivity; the rigidification of `M` is `e^*α` composed with that of `L` | bijection of linearizations of `L` with pairs up to isomorphism | none |
| A3.13 use of (5) | `A[2]` level subgroup, `A/A[2] ≅ A` by `[2]` | same descent statement through the new supplier; on `E` with `H = E[2]`, `L = O_E` the count `4` above matches `E^∨[2]` | consumer unaffected | none |
| A1.7 field Check (repaired) | `n = 2`; `n = −1`; `n = 0` | `E[2]` finite of rank `4` over `K`, `Spec` of an Artinian ring, `Pic = 0`; `A[−1] = A[1] = Spec K`, `Pic = 0`; `n = 0` now excluded (`A[0] = E`, `Pic(E) ⊇ E(K) ≠ 0`) | Check true as stated | previous R01 closed |
| Scope bullet and supplier table | EquivariantIntersectionTheory lines 50, 267–276, 331–337 | constructions listed (tensor, dual, pullback, base change) are those of §1.1; "invertible sheaves on `[X/G]` are the `G`-linearized invertible sheaves" is §1.4's clause; quotient stack of SchemeAndStackFoundations §1.21 | paraphrase faithful | none |
| `tateModule_rank` repair (R01) | `g = 0`; `g = 1`; infinite free module | `g = 0`: new form forces `M = 0`, as `Nonempty (M ≃ Fin 0 → ℤ_ℓ)` does; without `Module.Finite`, `⊕_ℕ ℤ_ℓ` has `finrank = 0` and would pass; `g = 1`: rank `2` on both sides; equivalence proved in the scratch file | repair equivalent to the original | R01 |
| A1.7 / `torsionRestriction`, degenerate `n` | `n = 0`; `n = 1`; `n = −1` | `mulBy 0 = 𝟙 ^ 0 = 1 = e ∘ π`; pullback of `e ∘ π` along `e` is `{(a, s) : π(a) = s} ≅ A`, `m = c`, exponents `2·0² = 0`, `0² = 0`, `0`: all three clauses read `m ^ 0 = 1`; `n = ±1`: `A[±1] = S` through `e`, `m = e^*c = 1` by the rigidification, `1 ^ 2 = 1 ^ 1 = 1 ^ (−1) = 1` | true, vacuous at `n = 0` exactly as `README.md:933` says | carried from the review at e77dd51 |
| A1.7, elliptic symmetric case | `E/S`, `L = O(0)` rigidified, `n = 2` | A1.5: `[2]^*c = c^{3} (c')^{1}` with `c' = c`, so `[2]^*c = c⁴`; restriction to `E[2]`: `M⁴ = 1`; Lean clauses `M⁸ = 1` and (symmetric) `M⁴ = 1` | both hold; `M^{n²}` is the sharp exponent, `2n²` holds a fortiori | carried from the review at e77dd51 |
| A1.7, antisymmetric case | `E/S` with a section `a`, `L = O([a] − [0])` rigidified at `0`, `n = 2` | `[−1]^*L = O([−a] − [0]) = L^{-1}` in `Pic⁰`, so `c' = c⁻¹`; A1.5: `[2]^*c = c³ (c⁻¹)¹ = c²`; on `E[2]`: `M² = 1`; Lean clause `m ^ n = M² = 1` and `M⁸ = 1` | holds | carried from the review at e77dd51 |
| A1.7, the three exponents from A1.5 | general `n`, `M = c|_{A[n]}`, `M′ = c′|_{A[n]}` | `n(n+1)/2 + n(n−1)/2 = n²`, `n(n+1)/2 − n(n−1)/2 = n`; from `M^{n(n+1)/2} M′^{n(n−1)/2} = 1` and its image under `[−1]^*` (which fixes `e`, so `[−1]^*L` is rigidified and `[−1]^*[−1]^*c = c`): product `(MM′)^{n²} = 1`, quotient `(M/M′)^{n} = 1`, hence `M^{2n²} = (MM′)^{n²} ((M/M′)^{n})^{n} = 1`; `M′ = M` gives `M^{n²} = 1` from the first identity; `M′ = M^{-1}` gives `M^{n} = 1` | the third Check's arithmetic is exact; no division by two in `Pic` | carried from the review at e77dd51 |
| A1.7, rigidification necessary | `L = π^*N`, `N ∈ Pic(S)` with `N² ≠ 1`, `n = 1` | `A[1] = S`, `M = e^*π^*N = N`, `M^{2·1} = N² ≠ 1` | excluded by the `RigidifiedLineBundle` binder; the second Check is a correct negative control | carried from the review at e77dd51 |
| A1.7, torsion multisection | `T ⊆ A[n]` closed | `L|_T = (L|_{A[n]})|_T`, and restriction is a group homomorphism `Pic(A[n]) → Pic(T)`, so the same exponents | the README's multisection clause follows from the Lean statement | carried from the review at e77dd51 |
| A1.7 against Xie–Yuan 4.1(1) | symmetric and antisymmetric `L`, every `m` | A1.5's exponents sum to `m²` and differ by `m`, matching `[m]^*L ≃ m²L` and `mL` | the roadmap and the source agree | carried from the review at e77dd51 |
| A4.CR.7.2 site label | the cited supplier passage | the supplier's line 690 defines the base-compatible fppf crystalline site over PD thickenings with `δ` and `γ` extending to `J + IO_T`, under Zariski, étale or fppf covers; the README consumes exactly that site | citation resolves | carried from the review at e77dd51 |
| Plain-text labels (A0 Examples, A1.3a Check, A2.2, A2.10, A5.8, A6.4, A6.26, A6.27) | each changed line | the mathematics of each line is unchanged by the edit; every backticked name on those lines is now a Mathlib or Tau Ceti declaration or a formula | convention `README.md:310–311` satisfied | carried from the review at e77dd51 |
| A0.1 carrier, Checks | identity `S → S`; `𝔾_m`; `(ℤ/2)_S`; `μ_p/𝔽_p`; constant `S₃` | identity: dimension 0, `[p]` iso of rank 1; `𝔾_m` not proper; `(ℤ/2)` has 2 fibre components; `μ_p` has tangent vector `1+ε ≠ 1` but a single geometric point, not smooth; `S₃` point group has `(12)(23) ≠ (23)(12)` | each wrong model excluded by one field of the structure | carried from the review at e77dd51 |
| A0.1 points API | `T = Spec k[ε]`, `G = μ_p` in char `p` | `(1+ε)^p = 1 + pε + … = 1`, so `1+ε` is a `T`-point; geometric points: only `1` | scheme points retained | carried from the review at e77dd51 |
| A0.2 field adapters | `E`; zero variety `Spec K` | `dim 1 ↦ 1`, `dim 0 ↦ 0`; `(ℤ/2)_K` excluded by connectedness | boundaries agree | carried from the review at e77dd51 |
| A0.3 Picard inputs | `E` and `ℙ¹` over `k̄` | `H⁰(O) = k` for both; `Pic⁰(E) = E^∨`, `Pic⁰(ℙ¹) = 0`, `Pic(ℙ¹) = ℤ` | the identity-component clause is substantive | carried from the review at e77dd51 |
| A1.1 products and dimension | `E × E`; empty product; base with components of dimension 1 and 2 | `1 + 1 = 2`; `Σ∅ = 0`; dimension function takes values `1, 2` | passes | carried from the review at e77dd51 |
| A1.2 rigidity (1),(2) | `[2]`; translation `t_a`, `a ≠ 0`; `S₃` | `[2](x+y) = 2x+2y`; `t_a(0) = a ≠ 0` excluded; `S₃` fails connectedness | hypotheses exclude wrong models | carried from the review at e77dd51 |
| A1.2 (3),(4) | `S` connected, zero on one fibre (Milne 20.1); `S = Spec k[ε]`, `f ≡ 0` on `Spec k` | lifts of the zero map form a torsor under `Lie(B₀) ⊗ (ε)` and are the translations by infinitesimal sections; the zero-preserving one is `0` | injectivity holds; `IsNilpotent (ker i)` is the nilpotent-ideal hypothesis | carried from the review at e77dd51 |
| A1.3 invariant forms | identity; `E`; `𝔾_m` | ranks `0`, `1`; on `𝔾_m` the invariant form is `dt/t`, and `t ↦ at` pulls `dt/t` to itself but `dt` to `a·dt` | translation invariance is the right normalization | carried from the review at e77dd51 |
| A1.3a Serre tensor | `M = 0, R, R²`; `R = ℤ[√−5]`, `I = (2, 1+√−5)`; `R = M₂(ℤ)`, `M = e₁₁R` | `0 ⊗ A = S`, `R ⊗ A = A`, `R² ⊗ A = A²`; `I ⊗ A` has lattice `I`, and `a² + 5b² = 2` has no integer solution so `I` is not principal and `I ⊗ A ≇ A`; `e₁₁ B² = B × 0 ≅ B` | commutativity and freeness not assumed | carried from the review at e77dd51 |
| A1.3a functoriality, splittings, base change | `(1,2) : R → R²`; complements `N`, `N ⊕ R`; pullback to `k[ε]`; `S″ → S′ → S` | `x ↦ (x, 2x)`; projectors `diag(1,0)` and `diag(1,0,0)` return the first coordinate; `diag(1,0)` pulls back to `diag(1,0)`; iterated and direct comparisons both send `m ⊗ a ↦ m ⊗ a` | splitting-independence and cocycle hold | carried from the review at e77dd51 |
| A1.4 seesaw | `X = S`; infinitesimal class on `E_{k[ε]}` | `L = π^*e^*L` trivially; a nonzero tangent vector of `E^∨` is trivial on the reduced fibre yet nontrivial, so the reduced-base hypothesis is needed and `[IsReduced S]` is in the signature | hypothesis necessary and present | carried from the review at e77dd51 |
| A1.5 cube and `[n]^*` | `n = 0, 1, −1, 2, 3`; `L = π^*N`, `N ≠ O_S` | exponents `(n(n+1)/2, n(n−1)/2) = (0,0), (1,0), (0,1), (3,1), (6,3)`; for symmetric `L` totals `0, 1, 1, 4, 9 = n²`; for `L = π^*N` both sides of the cube identity are `(π₃^*N)^4` and `(π₃^*N)^3`, unequal unless `N` trivial, which the rigidification forces | rigidification hypothesis is exactly what the Lean form keeps | carried from the review at e77dd51 |
| A1.6 elliptic equivalence | `E`; identity scheme | genus 1 ↔ dimension 1; dimension 0 excluded in both directions | passes | carried from the review at e77dd51 |
| A1.8 Weil criterion and extension | DVR, `[p]`; field base; `X = A ×_S 𝔸¹`; `S = 𝔸²_k`; cone over `x³+y³+z³ = 0` | `[p]` extends to `[p]` with special kernel of rank `p²`; over a field restriction is the identity; the projection extends; the origin of `𝔸²` lies under no codimension-one point of `X = S`, so (2) does not reach it and (3) does; along `(t,−t,0)` and `(t,0,−t)` the cone section has limits `[1:−1:0] ≠ [1:0:−1]`, and its domain misses the vertex fibre so it is not `S`-rational | the regular hypothesis in `weilExtension` is necessary and sufficient; normal is not | carried from the review at e77dd51 |
| A2.1 Raynaud | zero abelian space; `S′ = Spec k ⊔ Spec k`; `Spec ℂ[u,v]/(uv)` | zero space is `S`; finite sets split over components; `U × S` is affine for affine `U ∋ P, Q` | consistent | carried from the review at e77dd51 |
| A2.2 dual, Poincaré, biduality | identity scheme; `E`; `E × E′`; order-3 point `a` | dual of `S` is `S` with `P = O_S`; `E^∨ ≅ E` by `a ↦ O([−a]−[0])`; `(E×E′)^∨ = E^∨ × E′^∨`; `O([−a]−[0]) ≠ O([a]−[0])` since `2a ≠ 0` | the inversion adapter is detectable | carried from the review at e77dd51 |
| A2.3 Mumford map | `L = O(d·0)`, `d = 0, 1, 2`; `π^*N` | `φ = [0], [1], [2]`; `φ_{π^*N} = 0`; product `E × E` with degrees `1, 2`: `[1] × [2]`, kernel rank `1·4 = 4` | sign and additivity agree | carried from the review at e77dd51 |
| A2.4 ample cohomology and degree | `E`, `d = −1, 0, 1, 2`; `L = O(0)`: `t^*Q` | `χ = d`, `h⁰ = 0, 1, 1, 2`, `deg φ = d²`; `t^*Q = O(2·0) ⊠ O(−2·0)`, `χ = 2·(−2) = −4 = (−1)^1 2^2 χ(L)²`, so `χ(Q) = −1 = (−1)^g deg φ_L` | both formulas and the sign agree | carried from the review at e77dd51 |
| A2.4 higher dimension | `E²`, degrees `1` and `−1` | `χ = −1`, `(L²) = 2·(1·(−1)) = −2`, `deg φ = χ² = 1` | square formula handles negative `χ` | carried from the review at e77dd51 |
| A2.5 polarizations | `O(m·0)`, `m = 1, 2`; `O(−0)`; zero map; empty base | kernel ranks `1, 4`, degrees `1, 2`; `[−1]` symmetric, not a polarization; `φ_{O_A} = 0`; vacuous constant rank on `∅` | definition excludes the plausible wrong models | carried from the review at e77dd51 |
| A2.6 graph bundle | `g = 1, d = 1`; `g = 1, d = 2`; `g = 2, d = 1` | `φ_M = 2λ`, `χ(M) = 2^g d = 2, 4, 4`; `h⁰(M³) = d(6)^g = 6, 12, 36`; the worked example's surface degree `(M²) = 2!·4 = 8` | factor 2 and cubic rank agree | carried from the review at e77dd51 |
| A2.7 positivity | `E`, `D = (0)`, `E′ = (P)` effective; zero divisor | `(D⁰·E′) = 1 > 0`; zero divisor excluded | passes | carried from the review at e77dd51 |
| A2.8 projective presentation | DVR, `L_η` ample symmetric, extension `L` | `φ_L` isogeny on `η`; with `μ_η φ_η = [n]` extended, `μ_s φ_s = [n]_s`, so `φ_s` is an isogeny; `h⁰(L_s) ≥ h⁰(L_η) > 0` by semicontinuity, so `L_s` is ample | the extended power is relatively ample | carried from the review at e77dd51 |
| A2.9 nefness | `[n]^*(L + π^*N) = n²L + π^*N` | `L + n^{−2}π^*N → L` as `n → ∞`; zero-section degree of normalized `L` is `0`; a negative base twist `L − π^*N` has degree `−deg N < 0` on the zero section | nef, not ample; twist destroys nefness | carried from the review at e77dd51 |
| A2.10 Néron–Severi | `E`; `E²` with `End E = ℤ`; `[2]^*` | `NS(E) = ℤ`; `ρ(E²) = 2 + 1 = 3`; `[2]^*` acts by `4` | agrees with A6.16 | carried from the review at e77dd51 |
| A3.1 isogeny, surjectiveHom_flat | `[p]` on supersingular `E`; projection `E² → E`; identity on `Spec K` | rank `p²` with one geometric kernel point; projection flat, not finite, kernel of dimension 1; identity faithfully flat | rank is not a point count | carried from the review at e77dd51 |
| A3.2 multiplication and density | `g = 0`; `n = ±1`; `n = 0`, `g > 0`; `E`, `ℓ ≠ p`, `r = 1, 2`; supersingular `p` | ranks `1`; `[0]` not finite, excluded by `n ≠ 0`; `|E[ℓ^r](k̄)| = ℓ², ℓ⁴`; `|E[p](k̄)| = 1` so `(p : K) ≠ 0` is needed | matches `mulBy_isAbelianIsogeny` and `dense_primeToChar_torsion` | carried from the review at e77dd51 |
| A3.3 quotient | `H = 0`; `H = ker F` on supersingular `E` | `A/0 = A`, rank 1; `E/ker F = E^{(p)}`, rank `p`; the geometric points of `ker F` form the trivial group and would give `E` | kernel is the pullback square, not its points | carried from the review at e77dd51 |
| A3.4 divisibility | `f = [n]h`; `f = id`, `n = p`, supersingular `E`; `n = ±1` | `f(x) = h(nx) = 0` for `nx = 0`; `id` does not kill the scheme `E[p]` although it kills its single geometric point; `h = ±f` unique | `T`-point quantifier essential | carried from the review at e77dd51 |
| A3.5 dual isogeny, pairing | `F`, `V`; `ℤ/p` and `μ_p`; swap of factors | `ker F^∨ = (ker F)^D`, `FV = VF = [p]`; `(ℤ/p)^D = μ_p`; pairing after swap is the inverse | twist and inversion retained | carried from the review at e77dd51 |
| A3.6 pairings and theta groups | `α₂`, `e = 1 + xy`; `(ℤ/2)²` with `(−1)^{a₁b₁+a₂b₂}`; `K(O(2·0)) = E[2]` | `e(x,x) = 1 + x² = 1`; normalized cocycles on `α₂` are `1 + axy`, symmetric, commutator `1 ≠ 1+xy`, so not strongly alternating; `e((1,0),(1,0)) = −1` fails diagonal alternation; rank `4` | three predicates separated by examples | carried from the review at e77dd51 |
| A3.7 polarized Weil pairing | `n = 3`, symplectic basis; `p` odd, skew `e` on a group killed by `p` | `e(P,Q) = ζ₃`, `e(Q,P) = ζ₃^{−1}`, `e(P,P) = 1`; `c = e^{(p+1)/2}` is bimultiplicative with `c(x,y)/c(y,x) = e^{p+1} = e`, a strong-alternation witness | A4.12's "strongly alternating since `p > 2`" verified | carried from the review at e77dd51 |
| A3.8 full level | `n = 3`, `n = 2`, `n = p` | `|GL₂(𝔽₃)| = 48`, `|SL₂(𝔽₃)| = 24`; `[−1] ≡ 1` on `E[2]`; `E[p]` not constant étale | symplectic condition absent, as stated | carried from the review at e77dd51 |
| A3.9 Rosati | `E²`, product polarization, `x = e₁₂`, `y = e₂₁` | `(xy)^† = e₁₁^† = e₁₁ = y^†x^†`, `x^†y^† = e₂₂` | anti-multiplicative | carried from the review at e77dd51 |
| A3.10 effective divisors | `E × {0}` in `E²`; `(P)` on `E` | stabilizer of `E×{0}` has dimension 1, not ample; `(P)` ample | criterion correct | carried from the review at e77dd51 |
| A3.11 principal quotient | type `(1,2)` | `deg λ = 4`, maximal isotropic rank `2`, `deg u = 2 = h⁰(L)`, quotient degree `4/2² = 1` | passes | carried from the review at e77dd51 |
| A3.12 genus two | subsets of `{1,…,6}` | even subsets `32`, modulo complement `16`, nonzero `15`; `{1,2}` vs `{3,4}`: `(−1)^0 = 1`; `{1,2}` vs `{2,3}`: `(−1)^1 = −1` | symplectic model agrees | carried from the review at e77dd51 |
| A3.13 symmetric Hom realization | `f = λ` on `E`; `f(x,y) = (λy, λx)` on `E²`; supersingular `E`, `p = 2` | `(id,f)^*P` has `φ = 2f` of degree `2⁴ = 16`, so it does not realize `f`; `[L]` is half its class; `e_2(x, φ_M(y)) = e_2(x, f(2y)) = 1` on `A[2]`; `Ext¹(ℤ/ℓ, 𝔾_m) = k^×/k^{×ℓ} = 0`, `Ext¹(μ_p, 𝔾_m) = H¹(k, ℤ/p) = 0`, `Ext¹(α_p, 𝔾_m) = k/k^p = 0` over `k̄`; `4φ_L = φ_{M²} = 4f` and torsion-freeness give `φ_L = f` | integral realization is not division by 2 | carried from the review at e77dd51 |
| A4.1 Tate module | zero variety; `E`, `ℓ = 3`; supersingular, `ℓ = p` | ranks `0`, `2`, `0`; `T_ℓ([n]) = nI` | `(ℓ : K) ≠ 0` necessary and present | carried from the review at e77dd51 |
| A4.2 universal vector extension | `E`; zero `A`; `ψ(t) = t^p − at` on `𝔾_a` | kernel rank 1, total dimension 2; both zero; pushout along `ψ` sends `c ↦ Fr(c) − ac = 0`, splitting, and gives two distinct maps `(π,0)`, `(π,h)` | uniqueness only among `V(u)`, as stated | carried from the review at e77dd51 |
| A4.3 `H¹_dR` | `E`; `E²`; `[p]` in char `p`; `λ = [p]λ₀` | ranks `2, 4`, Hodge ranks `1, 2`; `[p]^* = 0`; `⟨λ^*x, y⟩ = 0` not perfect | self-pairing perfect only when `deg λ` invertible | carried from the review at e77dd51 |
| A4.4 exterior cohomology | `g = 0, 1, 2`; `ℓ = 2` | ranks `(1)`, `(1,2,1)`, `(1,4,6,4,1)` from `C(2g,n)`; `v² = 0` is stronger than `v² = −v²` in char 2 | passes | carried from the review at e77dd51 |
| A4.5, A4.5a Barsotti–Tate | `ℚ_p/ℤ_p`, `μ_{p^∞}`, sum; `α_p`; `ℤ/p ⊕ ℤ/p²` | heights `1, 1, 2`; `α_p`: `im F = 0 ≠ ker V = α_p`, excluded at level 1; `ker[p]` order `p²` vs `im[p]` order `p`, excluded at level 2 | wrong groups excluded | carried from the review at e77dd51 |
| A4.6 divided powers | `(2) ⊂ ℤ/4`, canonical; zero divided powers; `(p) ⊂ ℤ/p²`, `p` odd; `pW_n(k)` | `v₂(γ_{2^r}(2)) = 2^r − v₂(2^r!) = 2^r − (2^r − 1) = 1`, so `γ_{2^r}(2) = 2 mod 4`, not locally nilpotent; `δ₂(2) = 0 ≠ γ₂(2) = 2`, not base-compatible; `γ_m(p) = p^m/m!` has valuation `m − (m − s_p(m))/(p−1) ≥ m(p−2)/(p−1) → ∞` for `p ≥ 3` | the two domains and the dyadic exclusion are right | carried from the review at e77dd51 |
| A4.7 Grothendieck–Messing (abelian) | ordinary `E` over a square-zero PD thickening | rank 2, Hodge line rank 1, lifts `(1, aε)`: one parameter `= g² = 1`; principally polarized `g(g+1)/2 = 1` | dimensions agree | carried from the review at e77dd51 |
| A4.CR.7.2 crystal, variance, twists | `ℚ_p/ℤ_p`, `μ_{p^∞}` over `W(k)`; dual; `p = 2, 3` | `F = σ, V = pσ^{−1}` and `F = pσ, V = σ^{−1}`; `FV = VF = p` gives `2, 3` on generators; dual of slope 0 then twist `−1` is slope 1 with `F = pσ`; double dual returns slope 0; contravariant direction `D(H) → D(G)` | agrees with the two sources' conventions after dualizing | carried from the review at e77dd51 |
| A4.CR.7.2 Grothendieck–Messing (BT) | étale, multiplicative, ordinary elliptic; `(2) ⊂ ℤ/4` with canonical or zero divided powers | Hodge submodules `0`, whole, a line in rank 2; lifts: unique, unique, one parameter; canonical: not PD-nilpotent; zero: not base-compatible | hypotheses discriminate | carried from the review at e77dd51 |
| A4.7a realizations of the tensor | `M = R, 0, Rⁿ`; `(1,2) : ℤ → ℤ²`; `M = ℤ/p`, char `p` | identity, zero, `n` copies; covariant `v ↦ (v, 2v)`, contravariant `(x,y) ↦ x + 2y`; `ℤ/p ⊗ A = 0` as fppf sheaf while `ℤ/p ⊗ Lie(A) = Lie(A) ≠ 0` | finite projectivity necessary | carried from the review at e77dd51 |
| A4.8 effectivity | constant `E` over a complete DVR with `O(3·0)` | each level has `h⁰ = 3`, the compatible graded algebra recovers `E` with the same embedding | coherent existence does not replace this step | carried from the review at e77dd51 |
| A4.9 Serre–Tate | zero `A`; ordinary `E`; `[n]` | one object; one parameter `q`; `[n]` acts by `n` on both factors | structures restrict, not create, deformations | carried from the review at e77dd51 |
| A4.10, A4.11 ordinary coordinates | `g = 1, 2`; `λ₀ = diag(1, p)`; canonical lift | unpolarized `g² = 1, 4`; principal `g(g+1)/2 = 1, 3`; `Qλ₀ = λ₀Qᵀ` gives `p·q₁₂ = q₂₁`, the weighted pattern; `q = 1 ↦ q^p = 1` | no division by `p` | carried from the review at e77dd51 |
| A4.12, A4.13, A4.14 finite-level lifting | surface, `p = 3`: `|G₁| = 3⁴`; `p = 2` ordinary: `16`, étale and multiplicative parts of rank 4; genus 2 | `h⁰(ω) = 2`, `dim Sym² = 3 = h⁰(ω²) = 3g − 3`; `α₂` with `1 + xy` outside A4.12 by A3.6 | dimensions and exclusions consistent | carried from the review at e77dd51 |
| A5.1 lattice uniformization | `ℂ/(ℤ + iℤ)`; `i`; `√2`; `n = 1`, `n = ℓ^r` | rank 2; `i` acts by `[[0,−1],[1,0]] ∈ GL₂(ℤ)`; `√2·1 ∉ ℤ + iℤ`; `Λ/1Λ = 0`; `[ℓ]` on `(1/ℓ^r)Λ/Λ` is reduction `Λ/ℓ^rΛ → Λ/ℓ^{r−1}Λ` | maps descend exactly when lattice-preserving | carried from the review at e77dd51 |
| A5.2 Riemann forms | `H(v,w) = v w̄` on `ℤ + iℤ`; `2E`; `−E`; `V = 0` | `E(1, i) = Im(1·(−i)) = −1`, `E(i, 1) = 1`, `E(Jv, v) = |v|² > 0`; `det(2E) = 4`, cokernel `(ℤ/2)²`, not principal; `−E` fails positivity; zero form on `0` is perfect; `Q = −E`, `C = −J`: `Q(Cv, v) = E(Jv, v) > 0`, while `Q = E` gives `−1` at `v = 1` | both sign changes needed | carried from the review at e77dd51 |
| A5.3 Appell–Humbert | `H = z w̄`, metric `exp(−π|z|²)`; trivial bundle | `Θ = π dz∧dz̄`, `(i/2π)Θ = (i/2)(−2i)dx∧dy = dx∧dy`, integral over `[1, i]` is `+1 = −E(1, i)`; `E = 0`, not ample | `c₁ = −E`, not `E` | carried from the review at e77dd51 |
| A5.4 types and Pfaffian | type `(1,2)`; `g = 0` | `Pf = 2`, `det = 4`, `h⁰ = 2`, `(L²) = 2!·2 = 4`, `deg λ = 4`; empty product `1` | determinant is the square | carried from the review at e77dd51 |
| A5.5 Hodge equivalence | non-CM `E`; `[2]` | integral Hodge endomorphisms `ℤ`, rational `ℚ`; `[2]^*E = 4E` | integral vs rational distinct | carried from the review at e77dd51 |
| A5.6 analytic families | `E × (ℤ/2)`; constant periods; rank-1 lattice in `ℂ` | exponential misses a component; product family; cylinder, not compact | hypotheses necessary | carried from the review at e77dd51 |
| A5.7 conventions | `E`, basis `1, i` | `H₁` weight `−1`, `H¹` its dual of weight `1`; pairing entries `±1` into `ℤ(1)` | duals and twists kept apart | carried from the review at e77dd51 |
| A5.8 Siegel family | `g = 1`, `τ = i`; `Ω = [[i,1],[1,i]]`, `M = [[I,0],[C,I]]`, `C = diag(1,0)`; `g = 0`; level 2 | `−1/i = i`, `τ + 1`; `CΩ + I = [[1+i,1],[0,1]]`, `Ω(CΩ+I)^{−1}` has `(2,1)` entry `1/(1+i)` while `(CΩ+I)^{−1}Ω` has `1`; empty determinant `1`; `−1` fixes torsion | order of multiplication detectable | carried from the review at e77dd51 |
| A6.1 degree | `[2]`; non-isogeny; `g = 0`; Frobenius `π/𝔽_p`; `[2][3]` | `4`, `0`, `1`, `p`, `36 = 4·9` | `0⁰ = 1` in dimension 0 | carried from the review at e77dd51 |
| A6.2 faithfulness and saturation | `r = 0`; `f = [ℓ^r]`; supersingular `ℓ = p`; `f` with `T_ℓ f = ℓ^r h` | `h = f`; `T_ℓ[ℓ^r] = ℓ^r I`; `T_p = 0` loses `id`, excluded by `(ℓ : K) ≠ 0`; `f` kills `A[ℓ^r](K̄)`, which is étale, so A3.4 gives `f = [ℓ^r]h` | both directions of `homTateInjective` | carried from the review at e77dd51 |
| A6.3 image | projection `E² → E`; Frobenius; imperfect `K` | images `E`, `E^{(p)}`; `f(A)_{K̄} = f_{K̄}(A_{K̄})` reduced and proper | no reduced-kernel argument used | carried from the review at e77dd51 |
| A6.4 simple varieties | `E`; `E²`; zero variety | subvarieties `0, E`; `E × 0` present; zero excluded, else `End⁰ = 0` would have to be a division ring | wrong vacuous object excluded | carried from the review at e77dd51 |
| A6.5 complete reducibility | `B = 0`; `B = A`; diagonal of `E²`; `E × 0` | `C = A`, `C = 0`; antidiagonal complement, sum map `[[1,1],[1,−1]]` of degree `4`; `0 × E` of degree `1` | complement is an isogeny, not a product | carried from the review at e77dd51 |
| A6.6 degree polynomial | `End E = ℤ[i]`; `diag(a,b)` on `E²`; `g = 0` | `a² + b²`; `a²b²`; constant `1` | homogeneous of degree `2g` | carried from the review at e77dd51 |
| A6.7 Hom finite free | non-CM `E`; supersingular `E`; `g = 0` | ranks `1 ≤ 4`, `4 = 4`, `0 ≤ 0`; `[n]f = 0 ⇒ f = 0` | `homFreeFinite` bound attained | carried from the review at e77dd51 |
| A6.8 semisimplicity | `E²`; `E × E′`; zero | `M₂(ℚ)`, `ℚ × ℚ`, zero ring (semisimple in Mathlib); dimensions `4, 2, 0` | passes | carried from the review at e77dd51 |
| A6.9 two lemmas | `P = (X−1)²`, `Q = (X−1)(X−1−ℓ)`, `F = T−1−ℓ`; `det`, `M = diag(2,3)`, `G = X+1` | `|ℓ²|_ℓ = ℓ^{−2}` vs `|0| = 0`; `det G(M) = 3·4 = 12 = ∏ G(a_i)` | hypotheses discriminate | carried from the review at e77dd51 |
| A6.10 characteristic polynomial | `[n]`, `g = 1`; `α = 0`; `g = 0`; `π/𝔽_q` | `P(r) = (r−n)² = deg([n]−r)`, `Tr = 2n`; `P = X²`; `P = 1`, `Tr = 0`; `X² − aX + q` | `exists_charpoly` holds in dimension 0 with `deg = 1` | carried from the review at e77dd51 |
| A6.11 Tate comparison | `[1+ℓ^r]` vs `[1]` on `E[ℓ^r]`; `ℓ = p` supersingular | same matrix `I` mod `ℓ^r`, traces `2 + 2ℓ^r ≠ 2`; `T_p = 0` fails | whole tower needed; `charpolyTate` keeps `(ℓ : K) ≠ 0` | carried from the review at e77dd51 |
| A6.12 subfield | CM `E`, `F = ℚ(i)`, `α = 1+i` | `f = 2 = 2g`, `Tr = 2`, `Nm = 2 = deg` | passes | carried from the review at e77dd51 |
| A6.13 polarized degree | `[n]` on principal `E`, `n = 2` | `deg([2]^*λ) = 1·4² = 16 = deg(4λ)` | square retained | carried from the review at e77dd51 |
| A6.14 Rosati positivity | `E`, `α = a+bi`; `E²`, `α = diag(1,0)`, `D = E×0 + 0×E`, translate by `(a,b)`, `b ≠ 0` | `Tr(αα^†) = 2(a²+b²)`; `α^*t^*D = {−a} × E`, `(D · ({−a}×E)) = 1`, `D² = 2`, `Tr = 4·1/2 = 2 = Tr(diag(1,0))` on `V_ℓ` | formula handles images inside `D` | carried from the review at e77dd51 |
| A6.15 operator adapter and root | `M₂(ℝ)`, transpose; `s = diag(2,3)`; `s = diag(4,4,9)`; `diag(1,0)`; `E = ℝ`, `s = 2`; `E = 0` | `⟨s x, y⟩ = t(sxyᵀ) = t(xyᵀs) = ⟨x, sy⟩`; root `diag(√2,√3) ∉ M₂(ℚ)`; root `diag(2,2,3)`, inverse `diag(1/2,1/2,1/3)`, commuting with the whole `2×2` block; `t(diag(1,0)e₂₂e₂₂ᵀ) = 0` fails strictness and `diag(1,0)` is not a unit; `r = √2`, `r⁻¹ = 1/√2`; in the zero ring `0 = 1` is a unit and its own root | `rosatiPositiveSquareRoot` true on each instance, unit conclusion needs no hypothesis | carried from the review at e77dd51 |
| A6.15 real division algebras | `ℝ, ℂ, ℍ, M₂(ℝ)`, `ℂ ⊗ ℍ = M₂(ℂ)` | centres `ℝ, ℂ, ℝ, ℝ, ℂ`; `e₁₁e₂₂ = 0` excludes `M₂`; `M₂(ℂ)` has zero divisors | complex-centre branch needs the division hypothesis | carried from the review at e77dd51 |
| A6.15 normal form | `J = diag(1,−1)`, `x^† = J^{−1}xᵀJ`, `x = e₁₂`; swap on `ℝ × ℝ`; `ℍ`, `s = 2` | `e₁₂^† = −e₂₁`, `t(e₁₂^† e₁₂) = t(−e₂₂) = −1`; `(1,0)(1,0)^† = (1,0)(0,1) = 0`; `Re(v̄·2·v) = 2|v|² > 0` | positivity excludes both wrong involutions | carried from the review at e77dd51 |
| A6.15 ample cone | `L` defining `λ`; `L^{−1}`; `E²` | `θ([L]) = 1`, `θ′ = 1/2`; `θ([L^{−1}]) = −1` not positive; cone = positive definite symmetric `2×2` | rational vs integral realization kept apart | carried from the review at e77dd51 |
| A6.16 NS finiteness | `E`; `E²` | `1 ≤ 4`; `3 ≤ 16` | passes | carried from the review at e77dd51 |
| A6.17 traces | non-CM `E`, `α = 1` | geometric `2`, reduced `1`, `2g/(em) = 2/(1·1) = 2` | LT Remark 4.8 not copied | carried from the review at e77dd51 |
| A6.18 automorphisms | `j = 1728`; `n = 2`; `y² + y = x³` over `𝔽̄₂`, `α : x ↦ ζx` | `Aut = μ₄`, `[i]` nontrivial on `E[3]`; `[−1]` fixes `E[2]`; `E[4](𝔽̄₂) = 0`, `deg(α − 1) = 2 − (α + ᾱ) = 2 − (−1) = 3`, while killing `E[4]` forces degree divisible by `16`; `ζ = 1 + nπ` root of unity with `n ≥ 3` has `|N(ζ−1)| ≥ n^d > 2^d` unless `π = 0`; at `n = 2`: `ζ = −1`, `π = −1` | `n ≥ 3` and étaleness of the test are both needed | carried from the review at e77dd51 |
| A6.19 polarization orbits | `Eⁿ`, `End E = ℤ`, `n = 2`; `2I` | `GL₂(ℤ)`-classes of positive definite unimodular forms: one (identity); `2I` gives `2λ₀` of degree `d = 4`, `deg = 16`, not principal | passes | carried from the review at e77dd51 |
| A6.20 full-level descent | quadratic twist, `n = 2, 3` | cocycle `−1` acts trivially on `E[2]`, by `−I` on `E[3]`; kernel of `GL_r(ℤ) → GL_r(ℤ/n)` torsion-free for `n ≥ 3` by the `ζ = 1 + nπ` lemma | `n = 2` excluded | carried from the review at e77dd51 |
| A6.21 Frobenius | `E/𝔽_q`, `q = 2, 3` | `π^†π = q`, `Tr(π^†π) = 2q = 4, 6`; `P = X² − aX + q` with root product `q` | centrality over `𝔽_q` only | carried from the review at e77dd51 |
| A6.22, A6.23 coefficients | `R = ℚ`, `ℤ`, `0`; `ℚ[ε]`; split inclusion `A → A × E` | `[2]` invertible in `ℚ ⊗`, not `ℤ ⊗`; `(1+εα)^{−1} = 1 − εα`; zero ring has one unit; left inverse but not invertible | two-sided units required | carried from the review at e77dd51 |
| A6.24 real isometries | `λ_B = 2λ_A`, `f = 1`; `f = diag(2,1)`, `x = e₁₂`; `s = diag(4,4,9)` | `u = 1/√2`, `u^†(2λ_A)u = λ_A`, no rational `u`; `fxf^{−1} = 2e₁₂`, transpose `2e₂₁ ≠ f xᵀ f^{−1} = e₂₁/2`, so `fᵀf = diag(4,1)` fails to commute with `e₁₂`; `r^{−1} = diag(1/2,1/2,1/3)` commutes with the block | adjoint compatibility is a real hypothesis | carried from the review at e77dd51 |
| A6.25 finite étale extension | `μ₃` over `ℤ[1/3]`, `U = Spec ℤ[1/6]`; nodal cubic; open immersion `U ≠ S` | both endomorphism rings `ℤ/3` with the three maps `ζ ↦ ζ^a`; crosswise double cover has `0` sections over `S`, `2` over `U`; `U → S` has `1` section over `U`, `0` over `S` | normality and finiteness both needed; `U` open | carried from the review at e77dd51 |
| A6.25 relative Hom | constant `E` over the cubic cone; `U = S`; empty `U`; two DVRs through `z, z′` | `End(E)` extends although generic sections need not; identity; `∅` dense only in `∅`; both special-fibre homomorphisms agree on all prime-to-`p` torsion, hence are equal, so `z = z′` and Zariski's main theorem applies to `Γ → A` | `homRestriction_bijective` hypotheses exact | carried from the review at e77dd51 |
| A6.26 localized Hom | `D = ℤ, ℤ_(p), ℚ`; `⨿_n Spec ℂ` with `[2^n]` | `[p]` invertible only for `D = ℚ`; `(2^{−n})_n ∉ (∏ℤ)[1/2]` | one global denominator, sheafification differs | carried from the review at e77dd51 |
| A6.27, A6.28, A6.29 weak polarizations and twists | `λ` vs `2λ`, `D = ℚ, ℤ`; `μ₂` with `[±1]`, `P = Spec D[i]`; `diag(1,−1)` on `E²`, `P = Spec ℚ(i)` | same ray over `ℚ`, distinct over `ℤ`; invariants `a ⊗ i`, so `A^P ≅ A` and `Pic(ℤ[1/2]) = 0`; basis `e₁⊗1, e₂⊗i`, descended form `diag(1, i²) = diag(1,−1)` indefinite, `P(ℝ) = ∅` | scalar twists are trivial; real triviality needed for polarizations | carried from the review at e77dd51 |
| A6.30–A6.33 Weil restriction | `Res_{S/S}`; `S ⊔ S`; `K = 𝔽₂(s)`, `L = K(√s)`; `ℚ(√2)`; `D = K[ε]`; `L = K`, quadratic `L` | `X`; `X₁ × X₂`; `L ⊗ K̄ = K̄[ε]/ε²`, units `≅ 𝔾_m × 𝔾_a` by `a + bε ↦ (a, b/a)`; `𝔾_m²` with swap; `Res_{D/K}E = E × 𝔾_a` not proper; `T_ℓ` ranks `2g`, `4g` | separability and étaleness necessary | carried from the review at e77dd51 |
| A6.34 quadratic twists | trivial `χ`; `y² = f(x)`, `L = K(√d)`; `g = 1` | twist `A`; `dy² = f(x)`; `[[1,1],[1,−1]]` has `det = −2`, degree `2^{2g} = 4`, also as a finite flat map in characteristic 2 | degree `4`, not `2` | carried from the review at e77dd51 |
| A6.35, A6.36 curves and Morikawa | `C = a + (E×0)`; diagonal; `C = A = E`, `deg H = d`; `C = E × 0 ⊆ E²` | generated `E × 0`, diagonal, each of dimension 1; `α = λ^{−1}[d]λ = [d]`, `Tr = 2d = 2(C·H)`, `P = (X−d)²`, `Q = X − d`; `E × 0` gives a zero eigenvalue | positivity needs generation | carried from the review at e77dd51 |
| A6.37, A6.38 CM and Hodge line | `Eⁿ` with CM by `F`; zero `A`; `E × E′` | `M_n(F)`, not `Fⁿ`; `det 0 = O_S`; `ω_E ⊗ ω_{E′}` | passes | carried from the review at e77dd51 |
| Lean `relativeSeesaw` | `S = Spec k`, `X = E`, `L` of degree 0 trivial on `E_{k̄}` | `π_*L` is a line, `π^*π_*L → L` iso, `L = π^*e^*L` | the reduced hypothesis is in the signature | carried from the review at e77dd51 |
| Lean `exists_abelianQuotient` universal property | `C` any group object, `f` killing `H` | `h` unique already as a morphism since `q` is an fppf epimorphism; `IsMonHom h` is then automatic | `∃!` well-posed | carried from the review at e77dd51 |
| Lean `tateModule_rank`, `homTateInjective` over non-perfect `K` | `K = 𝔽_p(t)`, `ℓ ≠ p` | `A[ℓ^r]` étale, so `A[ℓ^r](Kˢᵉᵖ) = A[ℓ^r](K̄)` of order `ℓ^{2gr}` | `Kˢᵉᵖ`-points suffice | carried from the review at e77dd51 |

There are 13 new rows and 106 rows carried from the review at e77dd51. The headline table (`README.md:29–37`) and the module docstring are unchanged. The previous review's comparison of the two stands: every headline that is not stated is named in the docstring with its missing carrier. The one-tactic padding probe of the reviews at 21a8758 and e77dd51 covers the unchanged 21 admitted theorems.

**Remarks on untouched text (no change requested).**

- `charpolyTate` (`Suggested.lean:341–349`) concludes `∃ e : tateModule A ℓ ≃ₗ … , …`. The gate does not flag it because its conclusion goes on to use `e`. It already implies the pre-repair form of `tateModule_rank`.
- The pull request description's "Depends on" block lists only three suppliers and omits EquivariantIntersectionTheory, although its merge-order paragraph names it before this roadmap. This is outside the folder.

## Not verifiable

- **faltings-chai**, the introduction to I.5 (p. 25) and I.1.6 (p. 4), cited in A3.6. The diff only reflows them. Springer, paywalled, recorded as uncertified; not read, as in the previous reviews.
- The other texts on the previous reviews' *Not verifiable* list (blr, messing, bbm, chai-conrad-oort §1.7.4 and the untouched secondary locators) lie outside the changed passages and were not reopened.
- Ownership against open pull requests was checked through the `roadmaps` index (457 heads) and the sibling checkouts the brief gives. EquivariantIntersectionTheory, which is not among the checkouts, was read with `roadmaps show` at its head ca06895.

## Source issues

- none
