# Review of QuantumGroups (pull request #1705 at 8e68b86)

**Verdict:** needs changes

This is a full review of the head the previous review read incrementally (0 changed lines since). Line numbers refer to `TauCetiRoadmap/QuantumGroups/README.md` unless a file is named. "Branch pin" is the pull request's manifest (Tau Ceti `358314d4`, Mathlib `f6090c70`); "main's pin" is Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.

## R01 (P2) — The folder cites Tau Ceti modules the branch pin lacks; at main's pin four docstring clauses are false and the §8.5 sphericity headline is statable and absent

Re-raised: H01

The previous review's R01 is not repaired: the head is unchanged. If the repair report marks it `not actionable in this package`, that reason holds for step 1 below (the merge is outside the folder). It fails for step 2, which is a folder edit that has to follow the merge. Nothing in the folder can repair this before the merge, because the gate's build runs at the branch pin.

**Location.**

- `Suggested.lean:24`–`:25`: "the class `TauCeti.StarCoalgebra` (`Algebra/Coalgebra/Star.lean`), a module that the pinned Tau Ceti does not contain".
- `Suggested.lean:27`: "Proved in Tau Ceti and not restated, in modules that the pinned Tau Ceti does not contain".
- `Suggested.lean:71`–`:72` (recoupling) and `:73`–`:80` (sphericity): the same clause.
- The `From Tau Ceti` contract at `:172`–`:192` and all of Layer 8.

**Claim.** The README consumes these Tau Ceti declarations as supplied, and `Suggested.lean` says they are absent at the pin. Each is right at one pin only.

**Witness.**

- **Modules.** Of the ten Tau Ceti paths the contract names beyond the comodule files, nine are absent at `358314d4` and all ten are present at `2fd255d9`: `QuantumGroups/`, `Algebra/Coalgebra/Star.lean`, `Algebra/HopfAlgebra/{Star,Cancellation,InverseAntipode}.lean`, `Algebra/OreExtension/`, `Algebra/Category/FiniteHopfModuleCat/`, `CategoryTheory/Monoidal/Pivotal/`, `RingTheory/Finiteness/LocallyFinite.lean`. Only `Algebra/Lie/Sl2/Standard.lean` exists at both.
- **Names.** All 139 distinct backticked `TauCeti.*` names of the README resolve to a declaration at `2fd255d9`.
- **Sphericity.** At `2fd255d9` its carriers exist (`Pivotal/Spherical.lean:69`, `QuantumTrace.lean:41`) and no declaration states it for `FiniteHopfModuleCat ℂ (UqSl2 q)`: the only `SphericalCategory` instances are for the centre, symmetric and ribbon categories.

**Repair.**

1. The worker merges `origin/main` into the branch. `git merge-tree --write-tree HEAD origin/main` exits 0, and main has not touched the folder since the merge base `c9940702`. This moves the manifest to `2fd255d9`.
2. Restore the withdrawn commit's two files: `git checkout 903be55b -- TauCetiRoadmap/QuantumGroups/README.md TauCetiRoadmap/QuantumGroups/Suggested.lean`. That brings back the five `TauCeti.*` imports, `[TauCeti.StarCoalgebra ℂ A]` in place of `hΔ`, the instances `uqSl2RigidCategory` and `uqSl2PivotalCategory`, the headline `uqSl2_sphericalCategory (q : ℂ) [Fact (q ≠ 0)] (hq : q - q⁻¹ ≠ 0)`, and a docstring without the four pin clauses.
3. Apply R02 on top and re-run the gate with its build.

**Tested on the refuting instance.** New this round: `903be55b`'s `Suggested.lean`, copied to scratch and elaborated with `lake env lean` from the content checkout (main's pins), exits 0 with exactly five `declaration uses sorry` warnings (`:120`, `:152`, `:163`, `:173`, `:207`). Both instances elaborate with real bodies. The present head's `Suggested.lean` also elaborates there (four warnings), so the merge alone does not break the build. Values: on L₁⁺ at q=1/2, `tr K⁻¹ = 2+1/2 = 5/2 = tr K`; at q=±1 the module K=2, E=F=0 has `1/2 ≠ 2`, so `hq` is needed.

## R02 (P3) — `[Nontrivial A]` in `compactType_iff` is implied by the Hopf structure, and the Check that calls it necessary describes an object that does not exist

**Location.**

- `:908`: "For the zero algebra, coefficient span equals the whole zero space, but a linear functional sends 1=0 to 0≠1. Nontriviality is necessary for the equivalence."
- `:853` "nonzero Hopf *-algebras", `:899` "For a nonzero Hopf star algebra".
- `Suggested.lean:153`–`:156`: "a nonzero Hopf *-algebra", `[Nontrivial A]`.

**Claim.** The equivalence needs a nontriviality hypothesis, shown by the zero algebra.

**Witness.** A Hopf *-algebra here is a native `HopfAlgebra ℂ A` (`:675`). Mathlib's `Bialgebra.counit_one` (`RingTheory/Bialgebra/Basic.lean:61`) gives `ε(1)=1`, so `1=0` in A would give `1=0` in ℂ. The zero ring carries no such structure.

**Repair.**

- Delete `[Nontrivial A]` from `compactType_iff` and "nonzero" from its docstring and from `:853` and `:899`.
- Replace the Check at `:908` by a true one, for example: "The zero ring is not an instance: the counit of a complex bialgebra is unital, so ε(1)=1 forces 1≠0 in A. A definition of Hopf *-algebra without the counit axiom would admit it, with coefficient span everything and no normalized functional."

The API bullet at `:698` ("force nontriviality of the algebra") is true and stays.

**Tested.** A scratch file proves `example (A) [Ring A] [Bialgebra ℂ A] : Nontrivial A` from `Bialgebra.counit_one` and `map_zero` (exit 0, no message). The head's `Suggested.lean` with `[Nontrivial A]` removed elaborates with the same four `sorry` warnings and no error.

## Previous findings

- **R01 of the previous review** — not repaired (the head is the same commit). Quoted passage: `Suggested.lean:27` "in modules that the pinned Tau Ceti does not contain". Carried as R01 above.
- **Settled earlier, checked again, not findings.**
  - §§0.2–0.3 are also claimed by the open CategoricalOperatorAlgebras (`b9c0a6fb`, `:45` "have their single home here") and TemperleyLiebOperatorAlgebras (`ba43cc7a`, `:72`) heads; both heads are unchanged. Neither roadmap is on main, and main's QuantumGroups cites both as suppliers (main `:42`–`:43`), which a roadmap on main may not do. Moving the objects down into Layer 0 is the admissible direction; the correction belongs in those two pull requests.
  - The pull request's title and description announce a "Q9" ribbon category `RepUqg` that the folder does not contain (no match for `RepUqg`, `Q9` or `ribbon` in the README). The generated `merge-order` block orders #1649 before this pull request, so the conflict with #1649 (`5a9e4394`) has a stated order.

## Verified sound

**Gate, order, build.**

- Gate re-run on `8e68b86`: every counter 0, `OK`, exit 0. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check, the required command, output unmodified (no UPWARD, CYCLE or `moved:` line):

```text
depcheck: 233 roadmaps, 2259 edges, 0 problem(s)
```

- `lake env lean` on `Suggested.lean` at the branch pin: exit 0, four `sorry` warnings (`:124`, `:156`, `:167`, `:177`), nothing else.
- `#check @` of all six declarations in one scratch file: the types equal `scratch/signatures.md`. `AlgebraicHaar` does not carry `[StarModule ℂ A]`; no field uses it and every headline has the binder, so nothing changes. The `of` entry in `signatures.md` is the generator reading the `module` keyword.
- Padding probe `first | rfl | simp | infer_instance | trivial | decide | aesop | exact?` on the four theorems: fails on all four.

**Headlines.**

| Headline | Handling |
| --- | --- |
| §3.1 `schur_orthogonality`; §4.1 `compactType_iff`, `haar_modular_automorphism`, `haar_trace_iff_antipode_involutive` | stated |
| §1.2 Haar state, Layer 2 Peter–Weyl, Layers 4–5, 7, §8.6 | not statable: no minimal C*-tensor product at either pin (the only `minTensorProduct` in Mathlib is for pointed cones) |
| §§3.2–3.4, Layer 6 | not statable: no dagger or C*-category class at either pin |
| §8.5 pentagon | not statable at either pin: only triple recoupling (`ClebschGordan/Recoupling.lean:135` at `2fd255d9`) |
| §8.5 sphericity | unstatable at the branch pin, statable at main's (R01) |

**Seeded sample, read at the locators.** 15 targets; all cached locators agree with the README.

- **0.2:** `longoroberts` §2 line 123 (p.4), Lemma 3.3 line 389 (p.10), Theorem 3.8 line 621 (p.15), Theorem 3.11 line 681 (p.17), Appendix line 2000 (p.48). `nt` Definitions 2.2.10 and 2.2.12 lines 1427, 1446 (p.32), Proposition 2.2.13 line 1458, Theorem 2.2.14 line 1501 (p.33), Theorem 2.2.16 line 1571, Theorem 2.2.17 line 1596 (p.35), Theorem 2.2.19 line 1633 and Remark 2.2.20(ii) line 1661 (pp.36–37), Definition 2.7.1 with the remark `d(U)≥1` lines 3236–3241 (p.70), `R̄=−τR` line 2431 (p.52).
- **0.3:** `nt` lines 2556–2566 (p.55) and Theorem 2.5.3 lines 2573–2577, `k≥4`; `penneys` Proposition 4.5.3 line 745, Facts 4.5.5 line 758, Examples 4.6.12 and 4.6.14 lines 941, 1000 (printed pp.158–164).
- **2.1–2.3, 3.4 (Timmermann, uncertified):** cross-checked against `nt` Definition 1.3.1 line 262 (invertible U, `U_12U_13`), the unitarization `Q=(ι⊗h)(U*U)` lines 301–311, Theorem 1.5.2 line 569 and Theorem 1.5.4 line 643 (regular representation, dense slices), `σ_z=f_iz*a*f_iz` line 968, `τ_z=f_−iz*a*f_iz` line 1031, `S²=τ_−i` line 1034.
- **3.1:** `nt` Theorem 1.4.2 line 447 (p.9).
- **4.1:** `nt` Theorem 1.6.6 line 810 (p.18), Theorem 1.7.3 line 977 (p.22), Proposition 1.7.7 line 1036 (p.23).
- **4.2, 4.3:** `bmt` Theorem 2.2 line 257 (p.6), Theorem 2.8 line 461 (p.10), Corollary 2.9 line 478 (p.11), Theorem 3.6 line 858 (pp.18–19).
- **6.2:** `malacarne` Theorem 1.1 line 52, Lemma 1.2 line 127, Lemma 2.1 line 183, Lemma 2.2 line 202, Lemma 3.1 line 235, Theorem 4.1 line 285 (pp.2–5).
- **7.1:** `bmt` Theorem 2.12 line 614 with the shift model line 619, Corollary 2.13 line 645 (pp.13–14).
- **8.1:** `virelizier` §2.3 lines 348–357, Proposition 2.4 line 358 (p.8).
- **8.2:** `virelizier` Example 3.3 line 552 (p.11), Proposition 3.7 line 585, Corollary 3.8 line 594 (p.12).
- **8.5:** `virelizier` Lemma 2.3 line 265 (p.6), Proposition 4.1 line 644 (p.13).
- Also read: `kustermansvaes` Notations and conventions line 163 with leg numbering line 193 (p.840), Definition 2.1 line 743 (p.853); `banica` Theorem 1 line 42; `virelizier` §4.1 line 642 for the §8.7 basis change.

**Adversarial table.** All values computed this round; q=1/2 unless stated, so `[2]=5/2`, `q−q⁻¹=−3/2`.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `schur_orthogonality` vs `nt` 1.4.2 | SUq(2) fundamental, `F̃=diag(2,1/2)=ρᵗ` | Lean: `h(a*a)=(F̃⁻¹)₁₁/Tr=(1/2)/(5/2)=1/5`, `h(c*c)=2/(5/2)=4/5`, `h(aa*)=F̃₁₁/Tr=4/5`. Independent: §7.1 gives `h(c*c)=(1−q²)/(1−q⁴)=4/5`, `h(a*a)=1−4/5`, `h(aa*)=1−q²·4/5=4/5` | ok | none |
| `schur_orthogonality`, degenerate | H=0; one-dimensional character | H=0 has no simple subcomodule lattice; character: `F̃=1`, `1=1/1`; `F̃=2` gives `2≠1/2` | ok | none |
| `AlgebraicHaar` | ℂ[C₂], `h(u_g)=δ_(g,e)`; zero functional; counit | `h((1+u)*(1+u))=2`; zero: `h(1)=0≠1`; ε: `(id⊗ε)Δu=u≠ε(u)1=1` | ok | none |
| `compactType_iff` | ℂ; ℂ[C₂]; ℂ[x] primitive; zero ring | both sides true; both true; `x+h(x)=h(x)1` forces x=0, and no unitary coefficient is x: both false; zero ring: `ε(1)=1` impossible, not an instance | hypothesis redundant | R02 |
| `haar_modular_automorphism` | SUq(2); θ⁻¹; ℂ[S₃] | `θ(a)=F₁₁aF₁₁=4a`, `h(aa*)=4/5=4·h(a*a)`; θ⁻¹ gives `1/20`; `h(u_gu_k)=δ_(gk,e)=δ_(kg,e)`, θ=id | ok | none |
| `haar_trace_iff_antipode_involutive` | ℂ[S₃]; SUq(2) | trace and `S²=id`; `h(aa*)=4/5≠1/5=h(a*a)` and `S²c=(−q)(−q)c=c/4` | ok | none |
| §3.4 conventions vs `nt` | c=u₂₁, a=u₁₁ | `S²c=F₂₂cF₁₁⁻¹=c/4=τ_−i(c)`; `σ_t(c)=F₂₂^(it)F₁₁^(it)c=c`; `σ_t(a)=4^(it)a` | ok | none |
| §3.3 metrics | `M=F⁻²` on the double dual | `(FuF⁻¹)*F⁻²(FuF⁻¹)=F⁻¹u*uF⁻¹=F⁻²`; `tr(F·diag(1,0))=2`, `tr(F⁻¹·diag(1,0))=1/2` | ok | none |
| §0.2 Checks | `diag(2,1)`; `[[1,1],[0,0]]`; cups ×2, ×1/2 | `‖T†T‖=4`; Hilbert–Schmidt `√17≠5`; norm `√2`; squared norms `8`, `1/2` | ok | none |
| §0.3 Checks | d=5/2; d=√2; m=3; δ=−5/2 | `tr₂(p)=4/25`, `21/25`; `d³−2d=0`; truncation `min(2,0)=0` so `1⊗1=0`; `e²=(25/4)p=δe` | ok | none |
| §1.2 monoid {1,0} | `Δ(A)(A⊗1)` | span of `δ₁⊗δ₁`, `δ₀⊗1`, `δ₁⊗δ₀`: dimension 3 of 4 | ok | none |
| §2.2 Check | `U(s)=[[1,2],[0,−1]]` | `U²=I`; `T=(I+U*U)/2=[[1,1],[1,3]]`, det 2; `U*TU=[[1,1],[1,3]]` | ok | none |
| §4.2 pentagon | ℤ, `U(δ_a⊗δ_b)=δ_a⊗δ_(a+b)` | `U₁₂U₁₃U₂₃(1,2,3)=(1,3,6)=U₂₃U₁₂(1,2,3)` | ok | none |
| §4.3 | F₂; ℤ | `2√3<4=ε`; `2/(2N+1)→0` | ok | none |
| §5.1 relations | `u*u`, `uu*`; q=1 and q=1/2 at a=0, c=1 | entries give the five relations; `[[0,−1],[1,0]]` unitary; `aa*+q²c*c=1/4≠1` | ok | none |
| §5.1 antipode, coproduct | `S(u_ij)=u_ji*` | `S(c)=−qc`, `S(c*)=−q⁻¹c*`; `Δa=a⊗a−qc*⊗c`, `Δc=c⊗a+a*⊗c` | ok | none |
| §5.2, §7.2 | `F=[[0,1],[−2,0]]`; n=1; n=2 reduction | `FF̄=−2I`; cup `−2e₀⊗e₁+e₁⊗e₀`, norm² 5, `d≤5/2`; `‖Je₀‖²=2`; `u²=1`; `Fū F⁻¹=[[a,−qc*],[c,a*]]` for `F=[[0,1],[−q⁻¹,0]]` | ok | none |
| §7.1 Haar and character | `(c*c)^k`; ξ₂, ξ₃ | `4/5`, `(3/4)/(63/64)=16/21`; endpoints `1/2`, `1/3`; `√3/4`, `(√3/2+√15/4)/3`; `ω(a)=1` forces `ω(c*c)=0` | ok | none |
| §7.2 dimensions | d=5/2; semicircle | `1, 5/2, 21/4, 85/8`; `β=25/4`; `m₂=1`, `m₄=2` vs two-point `1, 1` | ok | none |
| §8.1 | q=1/2; q=i; q=0 | `KF=4FK`; `δ_E(FK)=δ_E(q²KF)=K(K−K⁻¹)/(2i)`; `KE=0` forces E=0 | ok | none |
| §8.2 ladders | L₁⁺, L₂⁺, L₁⁻ | `[E,F]=diag(1,−1)=(K−K⁻¹)/(−3/2)`; weights `1/4,1,4`, `[E,F]=diag(5/2,0,−5/2)`; `diag(−1,1)` | ok | none |
| §8.3 Casimir | L₀⁺, L₁⁺, L₂⁺; two forms; mixed | `10/9, 17/9, 65/18`; `diag(0,1)+diag(17/9,8/9)` and `diag(1,0)+diag(8/9,17/9)`; mixed `diag(8/9,26/9)` | ok | none |
| §8.5 Clebsch–Gordan | m=n=j=1; `Δ(E²)` | `α₁=−1/2`; `ΔE` gives `−1/2+1/2=0`, `ΔF` gives `1/2−1/2=0`; middle coefficient `1+q²=5/4` | ok | none |
| §8.5 sphericity | L₁⁺; L₀⁻; q=±1 with K=2 | `5/2=5/2`; `−1=−1`; `1/2≠2` | ok (statement: R01) | R01 |
| §8.6 form and pairing | m=1 | `h₁=q=1/2`; `⟨Ev₁,v₀⟩=1=⟨v₁,KFv₀⟩=2·(1/2)`; orthonormal entries `√2=q^(−1/2)`, `1/√2` | ok | none |
| §8.7 basis change | `v_i=q^(i(i−1)/2)u_i`, m=2 | F exponent `i(i−1)/2+i−i(i+1)/2=0`, E exponent `(i−1)+(1−i)=0`; `(2)_q=5/4`, `q⁻¹(2)_q=5/2=[2]` | ok | none |
| Docstring pin clauses | `358314d4` vs `2fd255d9` | nine module paths absent vs present | pin-dependent | R01 |

**Library declarations opened.**

- Branch pin: Mathlib `RingTheory/Bialgebra/Basic.lean:61` (`counit_one`); Tau Ceti `Algebra/HopfAlgebra/Antipode.lean` (module docstring `:27`: `antipode_antipode` for a commutative Hopf algebra); the two imported comodule modules elaborate.
- Main's pin: `Algebra/Coalgebra/Star.lean:46`–`:49` (one field, the equation `hΔ` states); `CategoryTheory/Monoidal/Pivotal/Spherical.lean:69`–`:71`; `QuantumGroups/UqSl2/QuantumTrace.lean:41` (hypothesis `q − q⁻¹ ≠ 0`); `QuantumGroups/UqSl2/ClebschGordan/Recoupling.lean:135`.

**Cross-roadmap citations resolved on main (13).** VonNeumannAlgebras (V13b.SpatialNorm `:70`, V10.ModularTheory `:2364`, V10.KMS `:2459`, V4.Core/PositivePredual/Normality `:244`, Layers 0, 1, 3, 11), HilbertModules H1–H3 (`:126`, `:179`, `:262`), CStarAlgebras §1.7 `:468`, §1.8 `:497`, §§5.1–5.2 `:1112`, `:1143`, Subfactors §§3.1–3.2 and `markovTrace_nonneg_iff` `:676`, `:697`, `:729`, OperatorAlgebraDynamics D1–D2, FreeProbability F1, F3, F6, AmenableGroups Layers 1, 5, 7, PivotalSpherical Layers 0–2 (`:257`–`:318`) and 7, TemperleyLieb, RepresentationTheory/CompactGroups (`su2Irrep` `:190`), RepresentationTheory/LieHighestWeight. Consumers: QuantumEnvelopingAlgebras `:183` ("Q8 item 1") and HopfologicalAlgebra `:40` ("Q8 item 5") match the mapping at `:208`–`:215`.

**Overlaps.** `scratch/overlaps.md` lists no dropped id and no revision-only id; the conflict with #1649 has its order in the description.

## Not verifiable

- **Timmermann** (`timmermann`) is settled as uncertified. Its locators in §§1.2, 2.1–2.3, 3.1–3.4, 4.1, 5.1, 7.1 and 8.6 were not read; the statements were cross-checked against `nt` as listed above.
- **Jones 1983 and Takesaki II** are settled as uncertified; the README does not cite them by locator.
- **Ownership against open pull requests** was checked for the five closest roadmaps of `scratch/overlaps.md` (the two with competing claims are quoted above) and for sphericity of U_q-modules at main's pin; other objects were not searched pull request by pull request.

## Source issues

- **Misprint** in bmt at the proof of Theorem 2.12, p.13: the source says the Haar state is `(1−q²)` times the unweighted sum of the diagonal coefficients at the vectors `e_(n,0)`; it should be weighted by `q^(2n)`, otherwise the value at 1 diverges; affects nothing.
- **Error** in banica at Theorem 1, p.1: the source says the SU(2) fusion rules hold for every n in ℕ; it should be n≥2, as its abstract says, since at n=1 the algebra is the group algebra of ℤ/2 with two irreducibles; affects a stated result.
