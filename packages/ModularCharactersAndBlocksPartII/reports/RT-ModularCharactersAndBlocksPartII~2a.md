<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16826#issuecomment-6900436208 -->
Red team round 2 pass a (claude) of 0234184

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) two supplier lines name a deprecated Mathlib alias

   - **Location.** `packages/ModularCharactersAndBlocksPartII/README.md:323` ("`Sylow`, `IsPGroup`,
     `IsSolvable`, `IsCyclic`") and `README.md:914` ("`MulDistribMulAction (G ⧸ H)
     (FixedPoints.subgroup H α)`, `IsSolvable`").
   - **Claim.** `IsSolvable` is the pinned Mathlib declaration consumed.
   - **Witness.** At the pin, `Mathlib/GroupTheory/Solvable.lean:145–150`: the class is
     `Group.IsSolvable`, and `_root_.IsSolvable` is `@[deprecated (since := "2026-07-16")] alias`.
     `README.md:111` and `Suggested.lean:101, 141, 164` already use `Group.IsSolvable`.
   - **Repair.** Replace `` `IsSolvable` `` by `` `Group.IsSolvable` `` at `README.md:323` and at
     `README.md:914`. Tested: after the edit every backticked library name of the README (202 distinct
     backticked names scanned) is a non-deprecated declaration at the pins.

2. **F02** (P3) the definition of a regular block has one discriminating Check

   - **Location.** `README.md:1547–1553` (Checks of §7.5): "`Q = O_p(G)` with `Q C_G(Q) = G`:
     `b^G = b`" and "`S₃`, `p = 3`, `N = C₃` … `P ∩ N = C₃` is the defect group of `b`".
   - **Claim.** §7.5 defines "regular with respect to `N`" and tests it by three Checks.
   - **Witness.** Only the first bullet tests regularity. In the second `N = G`, where no class lies
     outside `N` and every block is regular (it also holds for the wrong notion "every block"); the
     third tests Fong's theorem, not the definition.
   - **Repair.** Add to the Checks of §7.5:
     - "`S₄`, `p = 2`, the single block `B₀` (defect group `D₈`), `N = V₄`: `C_G(D₈) = Z(D₈) ≤ V₄`,
       and `λ_{B₀}` is the class size modulo `2`, namely `6, 8, 6 ≡ 0` on the transpositions, the
       `3`-cycles and the `4`-cycles, the classes outside `V₄`; so `B₀` is regular with respect to
       `V₄`, and it is `b^G` for the block `b` of `V₄`. On the double transpositions, inside `V₄`,
       `λ_{B₀} = 3 ≡ 1`, so `B₀` is not regular with respect to `N = 1`."
     - "`G = C₂`, `p = 2`, `N = 1`: the single block has `λ(t) = 1 ≠ 0` on the class `{t} ⊄ 1`, so it
       is not regular; accordingly `b^G` is not defined for the block `b` of `1`, since
       `z ↦` (coefficient of `z` at `1`) sends `t · t = 1` to `1` and `t` to `0`, and is not
       multiplicative."
     - Tested: `S₄` has one `2`-block (`C_G(V₄) = V₄`), class sizes `1, 6, 3, 8, 6`; both instances
       agree with the equivalence of §7.5 (regular exactly when `b^G` is defined and equals `B`) and
       with the criterion `C_G(D) ≤ N`.

3. **F03** (P3) three layer `Dependencies` lists omit Tau Ceti inputs their sections name

   - **Location.** `README.md:896` ("Layers 1–2; InverseGaloisAndArithmeticFundamentalGroups IG.3.4;
     CharacterTheory §§3.6, 4.1, 4.4."); `README.md:1072–1073`; `README.md:1584–1585`.
   - **Claim.** Each `Dependencies` paragraph lists what the layer's `*Needs:*` lines use.
   - **Witness.** §3.2 needs Tau Ceti `IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction_apply`
     (`README.md:824–825`); §4.4 needs `TauCeti.card_irreducibleCharacters` (`README.md:977–978`);
     §7.4 needs `Subgroup.indClassFun` (`README.md:1512–1513`). None is covered by the layer's list.
   - **Repair.**
     - `README.md:896`: "Layers 1–2; Tau Ceti Galois action on characters;
       InverseGaloisAndArithmeticFundamentalGroups IG.3.4; CharacterTheory §§3.6, 4.1, 4.4."
     - `README.md:1072–1073`: "Layers 1–3; Mathlib quotient actions on fixed points; Tau Ceti
       character counts, Galois action and fields of values; CharacterTheory §4.4."
     - `README.md:1584–1585`: replace "Tau Ceti Clifford theory" by "Tau Ceti Clifford theory and
       induced class functions".
     - Tested: after the edit each Tau Ceti name in a `*Needs:*` line of Layers 3, 4 and 7 falls
       under an item of its layer's `Dependencies`.

Three P3 findings (S01–S03). No P1 or P2 finding: every Lean statement and every README target was
instantiated on the cases in the tables below and held, every cross-roadmap citation resolved at
the cited head, and every certified locator was read at its line. Both files were read in full
(`packages/ModularCharactersAndBlocksPartII/README.md`, 1805 lines;
`packages/ModularCharactersAndBlocksPartII/Suggested.lean`, 344 lines). No Lean was run in this
pass (the brief gives no elaboration command): signatures were compared with the worker's
elaborated types.

## Round 1 findings at this head

| Finding | State | Witness at `0234184` |
|---|---|---|
| 1a/F01 = 1b/F01 (routes "as in the source", "Lemma 2", "Lemma 3 (c)") | repaired | `README.md:821–823`: "§3.1, which makes the sum of `|χ̂|²` over the coset `a Γ` equal to `|Γ : C|` times its sum over `a C`, turns the norm identity into `Σ_λ m_λ² = 1`"; `README.md:860–878`: own route for §3.4 through §§1.2, 2.2, 3.1–3.3 and CharacterTheory §§3.6, 4.1, all in its `*Needs:*` line; `README.md:954`: "Route: induction on `|S|`". No "as in the source" and no unkeyed lemma number remains. |
| 1a/F02 (Theorem 4 locators) | repaired | `README.md:952`: "(glauberman line 542, Theorem 4 (b), (c))"; `README.md:995`: "(glauberman line 537, Theorem 4, line 601, Corollaries 7–8". glauberman line 537 is the head, line 540 (a), line 542 (b), line 543 (c). |
| 1a/F03 (title) | repaired | `README.md:1`: "# Roadmap: modular characters and blocks, Part II — the Glauberman correspondence and heights of characters". |
| 1b/F02 (§2.1 route in the source's letters) | repaired | `README.md:663–673`: route in the roadmap's letters (`m`, `δ`, `k`), no shared sentence with glauberman lines 107–149. |

New errors introduced by the repairs: none found. The rewritten routes were recomputed:

- §2.1: `det(δ^{−k} T) = δ^{1 − k m} = 1` since `δ^{|A|} = 1` and `k m ≡ 1 (mod |A|)`; for
  `SL(2,3)`, `m = 2`, `|A| = 3`, `k = 2`, `δ^{−3} = 1`; for `Q₈`, `A = C₂` no `k` exists and the
  Check finds `det = −1`.
- §3.4: with `α − β = ε_a (1 − ξ(a))` and `|α| = |β| = 1`, the solutions are `(ε_a, ε_a ξ(a))` and
  `(−ε_a ξ(a), −ε_a)`; the product is `ξ(a)` in both and one factor is `±1`; `A ∖ B` generates `A`,
  so the product is `ξ` on `A`. For `SL(2,3)`: `χ̂|_A = ξ + ξ²`, `(1 − ξ)(ξ + ξ²) = ξ − 1`,
  factors `(ξ, 1)`, `θ₀ = 1`, `ε' = −1`.
- §3.4 (b): `[χ|_C, λ] = ε' + |A : B| [Δ, λ] ≥ 0` with `|A : B| ≥ 2` gives `[Δ, λ] ≥ 0`; for
  `C₂` inverting `C₃`, `χ = 1`: both `(ε', θ₀) = (1, 1)` (first case, `Γ = C · ker χ`) and
  `(−1, sgn)` (`(1 + 1)/2 = 1`, a character) satisfy (a) and (b).
- The added supplier clause, CharacterTheory §4.1: on main it owns the adapter that a semisimple
  endomorphism over `ℂ` with one eigenvalue is scalar and the equality case of the triangle
  inequality, as `README.md:481–484` says.

Not actionable in the package and settled by the repair report: two `where` fields of
`design/plan.json` still carry line 543. Not re-raised.

## The pass: declarations of `Suggested.lean`

No `variable` or `include` line: every binder is in the declaration's own signature. All 20
elaborated types (worker's signature file, 0 dropped binders) were compared with the README
statements; no difference.

| Declaration (README §; context) | Instances tried, values on each side | Result |
|---|---|---|
| `invariantIrreducibleCharacters` (1.1; `Group S`, `Group Γ`, `MulDistribMulAction S Γ`) | `C₃` on `C₇`, `r ↦ r²`: `s⁻¹ • r = r⁴` (`2·4 ≡ 1`), fixed set `{1}` under either convention; `C₃` on `Q₈`: `{1, χ₂}`; `S = 1`: `Irr(Γ)` | holds |
| `existsUnique_canonicalExtension` (2.2; finite, `hcop`) | `Γ = 1`: `ψ` linear, `ψ = det = 1` on `S`; `S = 1`: `ψ = χ`; `SL(2,3)`: twists have `det = λ² ≠ 1`; `S₃`: `1`, not `sgn` (`det = −1`) | holds, no solvability used |
| `canonicalExtension_values` (2.3) | `SL(2,3)`: values `2, −2, 0, −1, 1`; trivial `C₂` on `C₃`: `ℚ(ζ₃)` both sides, `ψ(s) = 1` | holds |
| `gallagher_bijOn` (2.4; `N.Normal`, `Finite G`) | `N = G`: `{θ} ↔ {1}`; `N = 1`, `C₂`, `η = sgn`: swaps `1, sgn`; `Z(Q₈)`: no `η` (1 against 4) | holds |
| `ncard_invariantIrreducibleCharacters` (4.4; `Group.IsSolvable S`, `hcop`) | `SL(2,3)`: `2 = 2 = 2`; `(C₇ ⋊ C₃)` with `r ↦ r⁻¹`, `s ↦ s` (an automorphism: `s r⁻¹ s⁻¹ = r⁻²`): `C = ⟨s⟩`, `3 = 3 = 3`; `C₃` on `C₇`: `1 = 1 = 1` | holds |
| `existsUnique_restrict_pairing_not_dvd` (4.5; `Fact p.Prime`, `IsPGroup p S`) | `S = 1`: `m = 1 ≡ 1`; `SL(2,3)`: `[χ₂|_C, sgn] = 2 ≡ −1 (3)`, `[χ₂|_C, 1] = 0`; `3^{1+2}`, `p = 2`: `3 ≡ 1`; swap on `C₃²`: `1` | holds |
| `IsGlaubermanFamily` (4.5; universes `Γ, C_Γ(T) : Type u`, `S, ↥T, S ⧸ T : Type v`) | `S = 1`: law 2 at every `p` forces `π χ = χ` (`m ∈ {0, 1}`); `T = ⊥`: `π(Γ, 1)χ = χ` invariant; `T = S`: `π(C, 1) = id`; wrong model `1 ↔ sgn` for `C₃` on `Q₈`: `[χ₂|_C, 1] = 0`, excluded by law 2 | laws fix `π` on `Irr_S(Γ)` |
| `exists_isGlaubermanFamily`, `.apply_eq` (4.5) | `C₁₅` on `Q₈ × C₁₁` (`3` has order `5` mod `11`): both series give `sgn ↦ χ₂ × 1`; uniqueness step: `S/T` of order `p`, `π(C_Γ(T), S/T)` fixed by the `p`-group law, every `y ∈ C_Γ(S)` has a matching `x` | holds |
| `.restrict_pairing_ne_zero`, `.adjoin_range_eq` (4.6) | `SL(2,3)`: `2 ≠ 0`, `ℚ = ℚ`; swap on `C₃²`: pairing `1`, `ℚ(ζ₃)` both sides | holds |
| `.exists_sign_of_isCyclic` (4.5; `ha` cyclic, no solvability binder needed) | `SL(2,3)`: `ψ(a) = −1`, `ψ(−a) = 1`, `ε = −1`; `S = 1`: `ε = 1`; `inr a` and `inl t` commute for `t ∈ C` | holds |
| `.index_mul_degree_eq` (5.1) | `SL(2,3)`: `4·1 = 2·2`; `3^{1+2}`: `9·1 = 3·3`; `θ = 1`: `q = |Γ : C|` | holds |
| `IsBlockDefectGroup` (Conventions; `Field k`) | `S₃`, `p = 2`, `1 + r + r²`: `⟨t⟩` yes, `1` fails maximality only; `r + r²`: `1`; `S₄`, `p = 3`, `χ₃`: `3/8, 1/8, −1/8, 0, −1/8 ↦ 0, 2, 1, 0, 1`, control `2·2 + 1·(−1) + 1·(−2) = 1`, zero on `⟨(123)⟩` | agrees with base `IsDefectGroup` |
| `blockCharacters` (Conventions; `IsDomain O`) | `(1 + r + r²)/3` over `ℤ₂[ζ₃]`: `{1, sgn}`; `b = 1`: all; `b = 0`: `∅`; `ℤ₂[C₃]`: one character `2, −1, −1` | as stated |
| `brauer_height` (6.2; complete DVR, `CharZero`, `hζ`, `CharP` residue) | `G = 1`: `a = d = 0`; `S₃`, `p = 2`: `1, 1` and `2 ∣ 2`; `A₅`, `p = 2`: `1, 3, 3, 5`; `C₃` over `ℤ₂`: degree `2`, `a − d = 0`, excluded by `hζ` | holds |
| `fongReynolds`, `existsUnique_fongReynolds` (7.4) | `S₃ ⊵ C₃`, `p = 2`: `T = C₃`, `λ ↦ std`, defect `1 ↦ 1`; `p = 3`: `T = S₃`; `S₄ ⊵ V₄`, `p = 3`: `T = D₈`, two linear extensions to the two degree-`3` characters; uniqueness: `Irr(B₂^G)` nonempty and disjoint from `Irr(B')` | holds |
| `reynolds_heights` (8.3; `D.Normal`) | `SL(2,3)`, `p = 2`: `{0, 1}` both sides; `A₄`: `{0}`; `D = 1`: `{0}`; `ν(n) ≥ a − d` so no truncation | holds |
| `reynolds` (8.4) | `D₈`: height `1`, nonabelian; `A₄`: all `0`, `V₄`; defect zero: true ↔ true | holds |

## The pass: README targets

| Target | Instances tried, values computed | Result |
|---|---|---|
| Conventions (actions, conjugate characters, signs) | `inr s⁻¹ · inl g · inr s = inl(s⁻¹ • g)` matches `char_conjFDRep` (`χ(x⁻¹ y x)`); `ζ₆ = −ζ₃²`; `2` has order `3` mod `7`: `6/3 = 2` places | holds |
| 1.1 | see `invariantIrreducibleCharacters` | holds |
| 1.2 fixed classes (route recomputed) | `M ∩ inl(X)` of index `|S|` in `M`; `(xy) S (xy)⁻¹ = S`, `[xy, s] ∈ inl(X) ∩ inr(S) = 1`; `Q₈ ⋊ C₃`: `2 = 2`; `C₂` on `S₃`: `3 ≠ 2`; `A₅` on `𝔽₇⁵`: constant vector `3c`, `5·3 ≡ 1` | holds |
| 1.3 permutation lemma | `C₂²` on `𝔽₂³`: fixed vectors `2`, fixed characters `4`, orbits `(8 + 4 + 4 + 4)/4 = 5` | holds |
| 2.1 normalised extension | see the repair check above; uniqueness `h^m = h^{|A|} = 1` | holds |
| 2.2, 2.3, 2.4 | see the declarations; `ℚ(ζ₄) ∩ ℚ(ζ₃) = ℚ`, `ℚ(ζ₄) ∩ ℚ(ζ₈) = ℚ(i)` | holds |
| 3.1 cosets | `SL(2,3)`: `a Q₈` splits `4 + 4`, `(a·(−1))⁴ = a`; `D₈`: `{a, ax²}`, `{ax, ax³}` | holds |
| 3.2 cyclic correspondence | `Σ_β β(a⁻¹) χ̂ β = |A| χ̂ 1_{aΓ}`, norm `|A|`, so `Σ_g |χ̂(ag)|² = |Γ|`; `SL(2,3)`: `4(1 + 1) = 8`; `m_λ ∈ ℚ(ζ_{|Γ|}) ∩ ℚ(ζ_{|A|}) = ℚ` | holds |
| 3.3, 3.4 | see the repair check; `C₃²` on `Q₈`: `η × 1` | holds |
| 4.1–4.4 | `C₁₅` on `Q₈ × C₁₁`: both series `sgn ↦ χ₂ × 1`; `C₉` on `C₁₉`: `C = 1`; counts as in the declarations | holds |
| 4.5, 4.6 | swap on `C₃²`: `(ψ_a × ψ_a)* = ψ_{2a}`; `j = 2`: `ψ_{4a} = ψ_a`; swap on `C₂²`: two candidates | holds |
| 5.1, 5.2 | chain step: `θ(1) ∣ |Γ : C_Γ(T)| μ(1)`, `μ(1) ∣ |C_Γ(T) : C| θ*(1)`; `SL(2,3)`: `1 ∣ 2 ∣ 4`; `2 ≡ −1 (3)` | holds |
| 6.1 central characters, Osima, defect classes | `S₃`, `p = 2`: `(1 + 1)/6 = 1/3 ≡ 1`, `(1 − 1)/6 = 0`; defect-zero block `2·2/6 ≡ 0`, `−2/6 ≡ 1`; `S₃`, `p = 3`, `x = t`: `Σ_φ φ(1) Φ_φ(t) = 1 − 1 = 0`, while `Φ₁(t)/6 = 1/6 ∉ ℤ₃` termwise (the text claims only the sum) | holds |
| 6.2 route | `ν(|𝒞|) = a − d`; unit `|𝒞| χ(x)/χ(1)` gives `ν(|𝒞|) ≤ ν(χ(1))`; integrality at `x⁻¹` gives the reverse for one `χ` | holds |
| 6.3, 6.4 | `SL(2,3)`, `p = 2`: heights `0,0,0,1,1,1,0`; `p = 3`: block `{χ₂, χ₂ω, χ₂ω²}`, correspondent in `C₆` with `3` characters; `A₅`: `4 = 4` | holds |
| 7.1 Min–Max | `Tr_{D_x}^G(x) = |C_G(x) : D_x| 𝒞⁺`; `S₃`, `p = 3`: `λ(t) = 3 ≡ 0`, `λ(r) = 2` | holds |
| 7.2 covering | `ω_std({r, r²}⁺) = 2·(−1)/2 = −1 = λ(r) + λ(r²)`; `S₄ ⊵ A₄`, `p = 2`: `W|_{A₄} = λ ⊕ λ̄` | holds |
| 7.3 domination | fibre of `G/D → G/DN` has `|N : N ∩ D|` elements; `S₃ × C₂`, `N = S₃`: images `1`, `0`; second block has `|N : N ∩ D| = 6 = 0` in `k`, dominating none | holds |
| 7.4 | see the declarations; `a_G − d' = ν|G : T| + a_T − d` gives `d' = d` | holds |
| 7.5 regular blocks, Fong | `S₃`, `C₃`, `p = 2`: `λ_{B₀}(t) = 3 ≡ 1`, `ω_std(t) = 0`; `S₄`, `V₄`, `p = 2`: `6, 8, 6 ≡ 0` (S02); `S₃`, `p = 3`: `|G : PN| = 2` | holds |
| 7.6 | `S₄`, `p = 2`, `V₄`: index `6`, defect group `D₈` | holds |
| 8.1, 8.2 | `p`-regular elements of `P C_G(P)` lie in `C_G(P)`; `[χ, χ] = d²/ξ(1)²`; `C₂ × C₃`: heights `0` | holds |
| 8.3, 8.4 | `ν(χ(1)) ≥ ν|G : T| + ν|N : D| + ν(ξ(1)) = (a − d) + ν(ξ(1))` using `p ∤ |T : N|`; equality by the declared gap; every `ξ` occurs since `θ_ξ|_D = θ(1) ξ` | holds |
| 9.1, 9.2 | `S₄`, `p = 2`: degree `2`, height `1`, `D₈`; `SL(2,3)`, `p = 3`: `3 = 3` twice | holds |

## Verified sound

- **Declarations read:** 20 of 20 (4 definitions, 16 theorems). One `import Mathlib` and three
  `TauCeti.*` modules, each present at the pin and used. No `set_option`, `lemma`, `#eval`,
  sorry'd data, `True` placeholder or process comment.
- **Headlines and padding:** the end theorems of `README.md:24–34` are the 16 theorems; the three
  cited-not-proved propositions are named in the module docstring. One-tactic probe: none follows
  from one pinned lemma or restates a definition (`restrict_pairing_ne_zero` is immediate only for
  a `p`-group `S`; `existsUnique_fongReynolds` adds surjectivity on blocks to `fongReynolds`).
- **Targets read:** 35 of 35 (§§1.1–9.2), with Conventions and the supplier contracts.
- **Checks tested:** every Check of §§1.1–9.2 and every Conventions witness recomputed (about 115
  bullets); none false. One definition is short of discriminating Checks (S02).
- **Locators verified:** 101 distinct line locators opened in the cached texts (glauberman 27,
  martinez 43, reynolds 8, sambale 6, hartley-turull 5, mnst 4, ruhstorfer 3, geck 2,
  spath-vallejo 2, kessar-malle 1); none wrong. Not opened: the proof range martinez lines
  783–831 cited in §6.2.
- **Library names:** all 202 distinct backticked names scanned; every library name exists at the
  pins. Read in their files: `TauCeti.irreducibleCharacters` (`CharacterTable/Table.lean:114`, on
  `Fin n → k`, irreducible so nonzero), `TauCeti.IsPrimitiveIdempotent` (three fields),
  `char_conjFDRep`, `arrowAction` (a `def`), the quotient-action instance of `OfQuotient.lean:62`,
  `SemidirectProduct.inl_aut`, `Ideal.exists_smul_eq_of_isGaloisGroup`,
  `HeightOneSpectrum.adicCompletion` (one-field structure), `UniformSpace.Completion.extension`
  and `extension_coe` (`T0Space`, uniformly continuous),
  `FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot` (any field with a primitive
  `n`-th root, `exp G ∣ n`), the tensor-factorisation declarations (universe-polymorphic). One
  deprecated alias (S01).
- **Sibling citations checked (resolved now):** ModularCharactersAndBlocks at its open head:
  Conventions, §§0.2, 1.1–1.3, 2.1–2.4, 3.1, 4.1–4.3, 5.1, 6.1–6.3, 7.1–7.2, 8.1–8.2 exist; §6.2
  states the Brauer-projection first main theorem over a field splitting `G` and its subgroups,
  the scalar extension and the defect classes; §7.1 the formula `Br_P(e_B) = Σ e_b`; §7.2 the
  second main theorem at the system of §1.1; §8.2 covering by orbit sums; the seven cited names
  are in its `Suggested.lean`. InverseGaloisAndArithmeticFundamentalGroups IG.3.4, *Conjugacy of
  coprime complements* (coprime, `N` or `G/N` solvable, by an element of `N`). CharacterTheory
  §§2.1, 3.5, 3.6, 4.1, 4.3, 4.4, 4.5 and `fieldOfValues_eq_map_fixedField_stabilizer` on main.
  InductionRestriction Layers 1, 2, 5, 7 on main, Layer 7 with the quoted title.
  FiniteGroupInvariants §6.2 (named as not owned). 5 roadmaps, 34 sections.
- **Ownership:** `roadmaps grep` over main and the open heads finds no other statement of the
  Glauberman correspondence, the Fong–Reynolds correspondence, or any of the eight Lean names
  searched. FiniteGroupExtensionSplitting (main) leaves the conjugacy of coprime complements to
  another roadmap, so IG.3.4 is the earliest owner. The base states no height, Osima formula or
  Min–Max theorem, and domination for normal `p`-subgroups only.
- **Declared gap** `gap:clifford-multiplicity-dvd-index`: same slug in `design/plan.json` and in
  the README; the `needs` sentence is one statement with its hypotheses; not provided by
  InductionRestriction on main nor by the pinned Tau Ceti (`FDRep.clifford_restrict_dvd_finrank`
  gives `dim V ∣ dim W` and the inertia index only).
- **Policy:** the pull request changes only `packages/ModularCharactersAndBlocksPartII/` (8
  files); no pull-request number, process wording or machine path in the README or docstrings;
  every target has a locator.
- **Dependency check:** `depcheck: 246 roadmaps, 2245 edges, 0 problem(s)`. No UPWARD, CYCLE or
  moved line.

**Copyright.** Wording: beside the locators, these statements and routes were set beside their
sources: §2.1 (glauberman lines 100–150), §2.2 (lines 234–243), §3.1 (lines 266–286), §3.4 (lines
375–412), §4.1 (lines 503–526), §4.4 (lines 623–628), §4.6 (lines 636–644); §6.3 (martinez lines
718–726), §7.3 (lines 1895–1934), §7.5 (lines 2222–2296), §8.2 (lines 2018–2032), §8.3–8.4 (lines
2328–2348; reynolds lines 531–543); Conventions (sambale lines 341–351, 483–484). No sentence
shares a run of words beyond formulas and standard names. Arrangement: martinez has Lectures 1–9;
Layer 6 draws on Lectures 2–3, Layer 7 on Lectures 3, 4, 7, 8, 9 in another order (domination
before Fong–Reynolds), Layer 8 on Lectures 8–9, Layer 9 on Lecture 9: no one-to-one run. Layers
2–4 share their order with glauberman §§2–4; the `*Needs:*` lines of §3.2 (§§2.2–2.4) and §4.1
(§3.2) force it, and the scopes differ (Lemma 3 in Layer 1, Theorem 5 (e) in Layer 5, §4.5 the
roadmap's own). Reuse: no table, figure, exercise list or data taken over.

Source independence: 14 passages compared with 4 sources (glauberman, martinez, reynolds, sambale), none shared; largest share martinez, 46 of 116 locators; contents compared with martinez: independent.

## Not verifiable

- The locators into `isaacs`, `isaacs-1973`, `navarro-1998`, `navarro-2018` and `feit`:
  uncertified, cited by locator only; several are chapter-level.
- The uniqueness formulation of §4.5 rests, among read sources, on spath-vallejo line 118, which
  asserts it without proof; the README's route was checked by hand (table above).
- Agreement of the arXiv numbering of `kessar-malle`, `mnst`, `ruhstorfer` with the journal
  versions named in the References: only the cached versions were read.
- Elaboration: no Lean was run; the comparison used the worker's elaborated signatures.
- Ownership against open pull requests was checked for those the index lists, through
  `roadmaps grep`.

## Source issues

- **Misprint** in martinez at §3.2, printed page 18 (line 725): the source says height zero characters are those whose degree `p`-part equals the numerical defect `d(B)`; it should be those whose degree `p`-part equals `p^{a−d(B)}`; affects nothing.
- **Misprint** in martinez at §3.2, printed page 18 (line 722): the source says the height is defined for every character in `Irr(G)`; it should be for every character in `Irr(B)`; affects nothing.
- **Misprint** in martinez at Theorem 9.8, proof, printed page 61 (line 2337): the source says the heights in `B` coincide with the set of characters in `b`; it should be the set of heights of characters in `b`; affects nothing.

## For the human reviewers

- **Licence.** `martinez`, the source with the largest share (46 of 116 locators), is unpublished
  course notes read from the author's page (`sources.toml`, `licence_class = "author-page"`); the
  main results also carry refereed locators (reynolds, sambale).
- **Licence.** `sambale` (a Springer Lecture Notes volume) and `spath-vallejo` (J. Algebra) are
  recorded in `sources.toml` with `licence_class = "author-page"`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0234184c47a7849a00a0e15c6e96bb2e1001dcf1", "job": "RT-ModularCharactersAndBlocksPartII~2a", "model": "fable", "worker": "chris-x89"} -->
