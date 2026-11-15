<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16826#issuecomment-6898812319 -->
Review (claude) of 33b1190

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §8.3 cites Martínez's Corollary 8.12 for a statement it makes only when `G = P C_G(P)`

   **Location.** `packages/ModularCharactersAndBlocksPartII/README.md` lines 1585–1587: "so the set of
   heights of `B` is `{ν(ξ(1)) : ξ ∈ Irr(D)}` (reynolds line 531, Theorem 8; martinez line 2131)";
   `packages/ModularCharactersAndBlocksPartII/Suggested.lean` line 316: "(Reynolds 1963, Theorem 8;
   Martínez 2024, Corollary 8.12)".

   **Claim.** The locator supports the height set of a block with a normal defect group.

   **Witness.** martinez line 2131 opens "In the above situation", that of Theorem 8.11 (martinez
   lines 2018–2019), which assumes `G = C_G(P) P`. The passage from the block of `D C_G(D)` to `B` is
   in the proof of Theorem 9.8, martinez lines 2337–2347.

   **Repair.**
   1. README line 1587: replace "(reynolds line 531, Theorem 8; martinez line 2131)" by "(reynolds
      line 531, Theorem 8, for the formula; martinez line 2131, Corollary 8.12, for the block `b` of
      `N = D C_G(D)`, and line 2337, in the proof of Theorem 9.8, for the passage from `b` to `B`)".
   2. `Suggested.lean` line 316: replace "Martínez 2024, Corollary 8.12" by "Martínez 2024,
      Corollary 8.12 for `G = D C_G(D)` and the proof of Theorem 9.8".

   Tested on the refuting instance: `SL(2,3)`, `p = 2`, `D = Q₈`, where `G ≠ D C_G(D) = Q₈`, so
   Corollary 8.12 speaks of the block of `Q₈` (heights `{0, 1}`) and the lines 2337–2347 carry the
   set to `G` through `|G : Q₈| = 3`. The References entry "Lecture 9 (lines 2161–2360)" already
   covers the new line; the manifest needs no change.

2. **F02** (P3) §7.2 lists the base's defining identity for covering as a target, with no differing clause

   **Location.** `packages/ModularCharactersAndBlocksPartII/README.md` lines 1341–1342: "`Σ_{B covers
   b} e_B = Σ_{b'} e_{b'}`, `b'` running over the `G`-conjugates of `b` (martinez line 1642)", under
   "Prove:".

   **Claim.** This is a target of this roadmap.

   **Witness.** The README's own contract, lines 436–438, consumes the same identity from base §8.2:
   "the sum of the block idempotents over the `G`-orbit of a block `b` of `k[N]` is the sum of the
   `e_B` over the blocks `B` of `G` that cover `b`". The base README (open head, `### 8.2`) defines
   covering by it. Only the route (lines 1350–1353) shows that the form in `Z(O[G])` is meant.

   **Repair.** Keep it as a variant that says how it differs:
   1. Lines 1341–1342: replace the clause by "in `Z(O[G])`, the central lifts satisfy
      `Σ_{B covers b} e_B = Σ_{b'} e_{b'}`, `b'` running over the `G`-conjugates of `b`: the lift,
      by the uniqueness of central lifts of base §1.3, of the identity over `k` by which base §8.2
      defines covering (martinez line 1642)".
   2. Line 1369, the `*Needs:*` of §7.2: "base §§0.2, 2.1, …" becomes "base §§0.2, 1.3, 2.1, …".

   Tested: `S₃`, `N = C₃`, `p = 2`, `O = ℤ₂[ζ₃]`. For `b = {λ}` the orbit sum of lifts is
   `e_λ + e_λ̄ = (2 − r − r²)/3`, the lift of the block `{std}`, the one block covering `b`; for
   `b = {1_N}` it is `(1 + r + r²)/3 = e_1 + e_sgn`, the lift of `B₀`. Over `k` both are the base's
   definition and nothing is proved; over `O` the statement uses base §1.3, which the old `*Needs:*`
   line lacked (the Layer 7 Dependencies already list it).

3. **F03** (P3) the two block definitions of `Suggested.lean` have no witnesses in the README

   **Location.** `packages/ModularCharactersAndBlocksPartII/README.md` lines 248–261, the Conventions
   bullet "**Blocks in `Suggested.lean`.**", which defines `blockCharacters` and
   `IsBlockDefectGroup`.

   **Claim.** Every definition has at least three discriminating Checks; every other Conventions
   bullet that fixes a convention ends in a computed "Witness".

   **Witness.** The bullet has none. The plausible wrong models are not excluded by the text: for
   `S₃`, `p = 2`, `e = 1 + r + r²`, dropping the maximality clause accepts `P = 1` (coefficient `1`
   at `1 ∈ C_G(1)`), and the nearby witness at lines 244–247 computes `Br_D` for `D = ⟨t⟩` only.

   **Repair.** Append to the bullet, after line 261:

   > Witnesses for `IsBlockDefectGroup`. `S₃`, `p = 2`, `e = 1 + r + r²`: `P = ⟨t⟩` qualifies
   > (coefficient `1` at `1 ∈ C_G(P) = {1, t}`, and `P` is a Sylow subgroup), while `P = 1` fails only
   > the maximality clause, so a definition without it would accept `1`. `S₃`, `p = 2`,
   > `e = r + r²`: the coefficients at `1` and `t` vanish, so `⟨t⟩` fails and `1` is the defect
   > group; a definition reading the support on all of `G` would accept `⟨t⟩`. `S₄`, `p = 3`, the
   > defect-zero block of the character of degree `3` with values `3, 1, −1, 0, −1`:
   > `e = 2 Σ(transpositions) + Σ(double transpositions) + Σ(4-cycles)` vanishes on
   > `C_G(⟨(123)⟩) = ⟨(123)⟩`, so the defect group is `1`; with the normaliser `S₃` in place of the
   > centraliser the transpositions would make `⟨(123)⟩` qualify. Witnesses for `blockCharacters`.
   > `S₃` over `ℤ₂[ζ₃]`: `b = (1 + r + r²)/3` gives `{1, sgn}` (it acts as `1` on both and as
   > `1 + ω + ω² = 0` on `std`) and `b = (2 − r − r²)/3` gives `{std}`. `b = 1` gives every
   > irreducible `K`-character and `b = 0` the empty set, an irreducible representation being
   > nonzero. `C₃` over `ℤ₂`, `b = (2 − r − r²)/3`: the single character with values `2, −1, −1`, of
   > degree `2`; a definition through complex characters would give two linear ones.

   Values computed for the repair: in `𝔽₃[S₄]`, `e_χ = (3/24) Σ χ(g⁻¹) g` has coefficients
   `3/8, 1/8, −1/8, 0, −1/8` on the classes of `1, (12), (12)(34), (123), (1234)`; with `8 ≡ 2` and
   `2⁻¹ ≡ 2 (mod 3)` they are `0, 2, 1, 0, 1`. Control: `ω_χ(e) = 2·2 + (−1) + (−2) = 1`, from
   `ω_χ = 6·1/3, 3·(−1)/3, 6·(−1)/3` on the three class sums. The four `3`-subgroups are
   self-centralising, and `e` is `0` at `1` and at the `3`-cycles.

Three findings, all P3 (none blocking). The mathematics, the Lean file, the supplier citations and
the round-1 repair are sound; the three repairs are a locator, one restated supplier identity and
the missing witnesses of two Lean definitions. No maintainer notes were left for this roadmap.

## Previous finding, checked

- **F01 (P3), supplier lists incomplete — repaired.** `packages/ModularCharactersAndBlocksPartII/README.md`
  line 136: "§4.5 (Brauer's splitting field: a field of characteristic zero containing a primitive
  `exp(G)`-th root of unity splits `G`)"; lines 315–325 add
  `IsDedekindDomain.HeightOneSpectrum.adicCompletion` and `UniformSpace.Completion.extension` to
  `### From Mathlib`; lines 457–463 add §4.5 to the CharacterTheory contract; lines 1309–1310 add
  the two completion names to the Layer 6 Dependencies.
  Adversarial pass on the added text: Mathlib `Topology/UniformSpace/Completion.lean` line 429
  (`extension`, a `def` returning a constant off uniformly continuous maps), line 437
  (`uniformContinuous_extension`, under `[CompleteSpace β]` only), line 446 (`extension_coe`, under
  `[T0Space β]` and `hf`): the README's three clauses match. `RingTheory/DedekindDomain/AdicValuation/Completion.lean`
  lines 34–35 and 50–55: `adicCompletion` is a one-field structure over `(v.valuation K).Completion`,
  as written. Tau Ceti `RepresentationTheory/Induction/Cyclotomic/SplittingField.lean` line 107:
  hypotheses `IsPrimitiveRoot ζ n`, `Monoid.exponent G ∣ n`, a simple `W : FDRep L G`; conclusion a
  simple `V` over `K` with one-dimensional endomorphisms and `baseChange ≅ W`; the contract says
  this. CharacterTheory on main has `### 4.5 Brauer's splitting field, and the universe adapter`
  (its README line 817), whose one target is the `ULift`/`Shrink` transport. Instance:
  `C₃`, `p = 2`: `X² + X + 1` has no root in `𝔽₂` (`0 + 0 + 1 = 1`, `1 + 1 + 1 = 1`), so `2` is
  inert, `K_w = ℚ₂(ζ₃)`, `k_w = 𝔽₄`, and `ℚ₂` itself fails the hypothesis, as the §6.1 Check says.
  Same pattern elsewhere: every `CharacterTheory §`, `InductionRestriction Layer`, `base §` and
  backticked library name in the body was compared with the Scope list and the contracts; none is
  missing now.

## Verified sound

### 1. Principles

No route-specific shortcut (Layers 1–5 assume only the coprimality and solvability the theorems
need; Layers 6–9 are stated for every splitting `p`-modular system). Part II of an existing plan:
the base's headings at its open head (Layers 0–8, `### 0.1`–`### 8.4`) were read and searched for
`height`, `Fong`, `Reynolds`, `Osima`, `Min–Max`, `domina`, `regular block`: only the
`p`-subgroup domination of its §8.1 and the covering of its §8.2 occur, both cited here (R02 is
the one restated line). No algorithm, no sorry'd data, no `set_option` (searched).

### 2. Sources: the seeded sample (15 targets)

| Target | Locators opened | Result |
|---|---|---|
| 1.1 | glauberman line 94; hartley-turull line 302 | the conjugate `η^a` and `Irr_S(G)`; match |
| 1.3 | glauberman line 355 | Brauer's theorem used for a cyclic group and the nonsingular table; supports the single-automorphism form |
| 2.1 | glauberman line 100, proof lines 107–135 | Theorem 1; the source assumes absolute irreducibility, the README the weaker "endomorphisms are scalars", which is all the proof at lines 113–115 uses |
| 2.2 | glauberman lines 234–237, 263; hartley-turull line 304 | Theorem 2 (a), the name, Definition 3.1; match |
| 2.3 | glauberman line 173, lines 238, 251–258 | Lemma 1, Theorem 2 (b); match |
| 3.1 | glauberman line 266, proof lines 273–286 | Lemma 2 (a)–(c); match, `a` a generator |
| 4.1 | glauberman lines 481, 503, 524 | Lemma 4 (`B` not assumed coprime), the Definition, Lemma 5; match |
| 4.2 | glauberman line 540, proof lines 545–554 | Theorem 4 (a), last step Corollary 6 (c); match |
| 4.3 | glauberman lines 542–543, 562 | Theorem 4 (b), (c); the `B × E` step at line 562 with `p = |A/A₁|`; match |
| 4.6 | glauberman line 636 (639–643) | Theorem 5 (a)–(d); (b) restated with `j` prime to `|Γ|`, equivalent since both characters have values in `ℚ(ζ_{|Γ|})` |
| 5.2 | geck lines 29–30, 34–36; hartley-turull lines 84–86, 91 | the statement, its completion, Theorem A, the reduction to prime order; match |
| 6.4 | martinez line 718, line 583 | §3.2; Theorem 2.8 (iii)–(iv); match |
| 7.2 | martinez lines 1642, 1652, 1760, 1763, 1790, 1976 | Problem 7.4, Proposition 7.6, Corollary 7.8, Proposition 7.9, Proposition 7.11, Lemma 8.6; match (R02 concerns ownership of the first, not the locator) |
| 8.3 | reynolds line 531 (proof 534–540); martinez line 2131 | Theorem 8 matches; Corollary 8.12 has a hypothesis the target drops: R01 |
| 8.4 | reynolds line 542; martinez line 2328 | Theorem 9, Theorem 9.8; match, both directions |

No locator is flagged as unverified by the author. Also opened this round: glauberman lines
299–305, 364–390, 454–466, 601–629, 644; reynolds line 60; martinez lines 24–64, 2005–2030,
2321. The remaining locators rest on the round-1 list, which the texts did not change since.

### 3. Adversarial pass (values computed this round)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 convention `(s·χ)(g) = χ(s⁻¹•g)` | `C₇`, `r ↦ r²` | `2·4 = 8 ≡ 1 (mod 7)`, so `s⁻¹•r = r⁴` and `(s·χ)(r) = ζ₇⁴`; `χ(s•r) = ζ₇²` | as stated | none |
| 1.3 permutation lemma | `C₂²` on `𝔽₂³`, `a = 1 + E₁₂`, `b = 1 + E₁₃` | `a v = v + v₂e₁`, `b v = v + v₃e₁`, `ab`: `v₂ = v₃`; fixed vectors `8, 4, 4, 4`; on characters `aᵀw = w + w₁e₂`, fixed iff `w₁ = 0`: `8, 4, 4, 4`; common `2` against `4`; orbits `20/4 = 5 = 5` | sound; cyclic needed for the fixed-point form | none |
| 2.1 normalised extension | any field; `Q₈`, `A = C₂` by `i`; `V = 0` | `c^n = ∂e`, `c^r = ∂d`, so `c = ∂(d^j e^i)` with `in + jr = 1`; `δ = det S'` has `δ^n = 1`, rescale by `δ^{−r'}`, `r r' ≡ 1 (n)`; uniqueness `h^r = h^n = 1`; `(cρ(i))² = −c² = 1`, `det = c² = −1`; `gcd(n, 0) = n` | sound over every field | none |
| 2.2 `existsUnique_canonicalExtension` | `SL(2,3)`; `S₃` | `det(χ̂β)|_S = β^{χ(1)}`, trivial iff `β = 1` as `gcd(χ(1), |S|) = 1`; `λ² ≠ 1` for `λ ≠ 1` on `C₃`; `sgn` has `det = −1` | true, unique | none |
| 2.3 `canonicalExtension_values` | `SL(2,3)`; trivial `C₂` on `C₃` | `2, −2, 0, −1, −1, 1, 1`; `χ̂(s) = 1`, `ℚ(χ̂) = ℚ(ζ₃)` | true | none |
| 2.4 `gallagher_bijOn` | `Z(Q₈) ≤ Q₈`; `N = 1`, `G = C₂` | `1` against `4` without an extension; multiplication by `sgn` swaps `1, sgn` | true | none |
| 3.1 cosets | `SL(2,3)`; `D₈`; general | order of `ag` is `|A|·m`, `m ∣ |Γ|`; `(at)^{k|Γ|} = a`; centraliser of order `6`, class `24/6 = 4`; `D₈`: classes `{a, ax²}`, `{ax, ax³}` | sound; coprimality needed | none |
| 3.4 / 4.2 signs at `p = 2` | `3^{1+2}_+` with the involution | trace of a determinant-one involution on dimension `3` is `−1`; `(3ω − ω)/2 = ω` and `(3ω + ω)/2 = 2ω` are both characters, so the existential sign is right | sound | none |
| 4.1 series | `C₁₅` on `Q₈ × C₁₁` | `3, 9, 5, 4, 1 (mod 11)`; `gcd(15, 88) = 1`; both series give `χ₂ × 1` | sound | none |
| 4.3 | `C₉` on `C₁₉` | `9 ∣ 18`, `C = 1`, `Irr_S = {1}` | sound | none |
| 4.4 `ncard_invariantIrreducibleCharacters` | `C₇ ⋊ C₃` with `C₂` inverting `C₇` | `−1` is a nonresidue mod `7`, so the two classes of order `7` and the two characters of degree `3` are swapped: `3 = 3 = 3` | true | none |
| 4.5 `IsGlaubermanFamily.apply_eq` | `S = 1`; `|S| = p`; `T` of prime index | law 2 at `S = 1` (a `p`-group for every `p`) forces `π(Γ,1)(χ) = χ`; by induction `π(Γ,T) = π'(Γ,T)`, and `π(C_Γ(T), S/T)` is fixed by laws 1–2 and the `p`-group theorem; every `y ∈ C_Γ(S)` has an `x` over it | uniqueness holds | none |
| `existsUnique_restrict_pairing_not_dvd` | `S = 1`; `p = 2`; `SL(2,3)` | `C = Γ`, `m = 1`; odd `m` is `≡ 1`; `2 ≡ −1 (mod 3)`, written `m + 1 ≡ 0` | true | none |
| 4.6 (a), (b) | swap on `C₃ × C₃`, inversion, `j = 2` | `(ψ_{−a} × ψ_{−a})* = ψ_{−2a} = ψ_{2a} ∘ α⁻¹`; `(ψ_{2a} × ψ_{2a})* = ψ_{4a} = ψ_a` | true | none |
| 5.1 `index_mul_degree_eq` | `SL(2,3)`; `θ = 1`, `C ≠ Γ` | `4·1 = 2·2`; reverse `|Γ : C| ∤ 1` | true | none |
| 5.2 reduction | `T ⊴ S` of prime index | `θ*(1) ∣ θ^{*T}(1) ∣ θ(1)`; `C_Γ(T)`, `S/T`, `T` stay in the universes | sound | none |
| 6.1 Checks | `S₃`, `p = 2`; `C₃` over `ℤ₂` | `e_std = (2 − r − r²)/3 ≡ r + r²`; `−1/3 ≡ 1`; `ω_std = 2·(−1)/2 = −1`; `(1 + α²r + αr²) + (1 + αr + α²r²) = r + r²` with `α² + α = 1` | sound | none |
| `IsBlockDefectGroup`, `blockCharacters` | `S₃`; `S₄`, `p = 3`; `b = 0` | rows of R03: `P = 1` rejected only by maximality; `e` of the degree-3 block `≡ (0, 2, 1, 0, 1)`; `b = 0` gives `∅` (`Representation.IsIrreducible` is `IsSimpleModule`) | agree with the base's `IsDefectGroup` | R03 |
| 6.2 `brauer_height` | `A₅`, `p = 2`; `C₃` over `ℤ₂` | degrees `1, 3, 3, 5` with `a = d = 2`; `4 ∣ 4`; non-splitting: degree `2`, `a − d = 0`, excluded by `hζ` | true | none |
| 6.4 | `A₅`/`A₄`; `SL(2,3)`, `p = 3` | `4 = 4` (degrees `1, 3, 3, 5` and `1, 1, 1, 3`); `N_G(C₃) = C₆`, three characters | sound | none |
| 7.2 first statement | general; `S₃` | `Σ_{x ∈ 𝒞} χ(x)/χ(1) = Σ_i Σ_x θ_i(x)/(t θ(1)) = Σ_x θ(x)/θ(1)` as `𝒞` is `G`-stable; `−1 = λ(r) + λ(r²)` | true | none |
| 7.2 third statement | `S₃`, `N = C₃`, `p = 2` | rows of R02 | true; the base's definition over `k` | R02 |
| 7.4 `fongReynolds`, `existsUnique_fongReynolds` | `S₃`, `N = C₃`, `p = 2` and `p = 3` | `T = C₃`, `B = e_λ`, `Ind λ = std`, defect groups `1 ↦ 1`; `p = 3`: `b = 1`, `T = S₃`, identity; uniqueness since induction is onto `Irr(B^G)` and `Irr(B) ≠ ∅` | true | none |
| 8.3 `reynolds_heights` | general; `SL(2,3)`, `p = 2` | `h(χ) = ν(ψ(1)) − ν(|N : D|) ≥ ν(θ(1)) + ν(ξ(1)) − ν(|N : D|) = ν(ξ(1))`, equality when `ψ(1)/θ_ξ(1) ∣ |T : N|`; `N = Q₈`, `|T : N| = 3`, heights `{0, 1} = {ν(1), ν(2)}`; every `ξ` occurs since `B` covers `b` | true, both inclusions | R01 (locator only) |
| 8.4 `reynolds` | `D₈`; `A₄`; `D = 1` | heights `0,0,0,0,1`, nonabelian; `0,0,0,0`, abelian; `{χ}` | true, both directions | none |

Context: the file has no `variable` block. The 20 elaborated types of `scratch/signatures.md`
were compared with the README statements: equal generality, no binder lost.

### 4. Duplication and ownership

- Library: Tau Ceti `CharacterTable/Table.lean` 114 (`irreducibleCharacters`, representations on
  `Fin n → k`), 123, 181, 585; `Induction/ClassFunction.lean` 194 (`Subgroup.indClassFun`,
  `[S.FiniteIndex]`, a coset sum); `RingTheory/Idempotents/Primitive/Basic.lean` 89;
  `Induction/Conjugate.lean` 130, 485, 683; `Clifford/Classes.lean` 125; `Clifford/Decomposition.lean`
  305; `Clifford/Dimension.lean` 113, 142; `Clifford/Basic.lean` 327; `Clifford/Obstruction.lean`
  162, 304; `TensorFactorization.lean` 108, 329; `ProjectiveCorrespondence.lean` 149, 223;
  `CharacterTable/CentralCharacter.lean` 89; `Cyclotomic/Action.lean` 201; `Determined.lean` 49;
  `Degree.lean` 117; `GroupTheory/SemidirectProduct.lean` 33. Mathlib
  `GroupTheory/GroupAction/OfQuotient.lean` 62, `FieldTheory/Galois/IsGaloisGroup.lean` 58,
  `RepresentationTheory/Irreducible.lean` 29. Every other dotted library name of the README was
  found by its last component in the pinned sources. No declaration of the Glauberman
  correspondence, the canonical extension, heights or Fong–Reynolds exists at the pins.
- Roadmaps (`roadmaps grep`, README text): `Glauberman correspond`, `Fong.Reynolds`,
  `Alperin.McKay`, `Osima`: no match on main or in any open pull request. `permutation lemma`:
  FiniteGroupInvariants §6.2, the Galois form, named as not owned. `coprime action`:
  OddOrderTheorem §1.3 (later in the merge order, commutator and Hall-subgroup statements, not the
  class and coset statements of §1.2) and LocalFiniteGroupTheory L3 (excluded as a supplier).
- `scratch/overlaps.md`: no dropped id, no open revision, no second copy, no conflicting head.
- `IsBlockDefectGroup` restates the base's `IsDefectGroup` with coefficients because the base's
  `brauerProjection` is not at the pins; the names differ and the README says whose notion it is.

Overlap check: read ModularCharactersAndBlocks, GlaubermanZStar, OddOrderTheorem,
LocalFiniteGroupTheory, FiniteGroupInvariants (open) and CharacterTheory, InductionRestriction,
FiniteGroupExtensionSplitting (main); blocks, defect groups, defect classes, covering,
`p`-subgroup domination: owner ModularCharactersAndBlocks (cited; R02 for one restated identity);
Galois-form permutation lemma: owner FiniteGroupInvariants §6.2; projective tensor factorisation:
owner InductionRestriction Layer 7; conjugacy of coprime complements: owner
InverseGaloisAndArithmeticFundamentalGroups IG.3.4; fixed points of coprime actions: also
LocalFiniteGroupTheory L3, not citable; nothing else shared.

### 5. Supplier order

Dependency check output: `depcheck: 246 roadmaps, 2245 edges, 0 problem(s)`; no UPWARD, CYCLE or
`moved:` line. `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.
Resolved now: the base's Conventions and §§0.2, 1.1–1.3, 2.1–2.4, 3.1, 4.1–4.3, 5.1, 6.1–6.3,
7.1–7.2, 8.1–8.2 exist at its open head; I read its §§1.1, 6.2, 7.1, 7.2, 8.1, 8.2 against the
contract (the scalar extension, the defect classes, the first main theorem over a splitting
field, covering for arbitrary `N`): faithful. Its `Suggested.lean` declares
`existsUnique_blockIdempotent_map_residue`, `exists_blockIdempotent_iff_centralCharacter_congr`,
`SameBlock`, `IsDefectGroup`, `isDefectGroup_conj`,
`isDefectGroup_iff_sylow_of_augmentation_ne_zero`, `brauer_first_main`. IG.3.4 (`### IG.3.4`)
holds the target *Conjugacy of coprime complements* with "`N` or `G/N` solvable" and conjugacy by
an element of `N`. CharacterTheory §§2.1, 3.5, 3.6, 4.3, 4.4, 4.5 and InductionRestriction Layers
1, 2, 5, 7 exist on main under those numbers; Layer 7's title is the one quoted.

Declared gap `gap:clifford-multiplicity-dvd-index`: same slug in `design/plan.json` and under the
InductionRestriction subsection; one statement with its hypotheses; minimal (InductionRestriction
on main has no such divisibility; `FDRep.clifford_restrict_dvd_finrank` gives `dim V ∣ dim W` and
`[G : inertia V] ∣ dim W` only). Not a finding; martinez line 2340 uses the same step.

### 6. Shape and the Lean form

README shape as required; nine layers, each ending in Examples and Dependencies. Layer order
forced: §3.2 needs §§2.2–2.4, §4.1 needs §3.2, Layer 7 needs §6.1–6.3, §8.3 needs §§7.2, 7.6.
Checks per definition: 1.1: 3; 2.2: 3; 4.1: 3; 4.5: 4; 5.2: 3; 6.3: 7; 7.3: 4; 7.5: 3; 9.1: 4;
9.2: 3; the two Conventions definitions: R03. No LaTeX delimiters, process words, pull-request
numbers, dates, anchors or machine paths (searched).

Elaboration: `lake env lean` on `packages/ModularCharactersAndBlocksPartII/Suggested.lean` from
the content checkout: exit 0, 16 warnings, all `declaration uses sorry`. Header `import Mathlib`
and three `TauCeti.*` modules, each used. One module docstring, one namespace, layer comments in
README order, a docstring on each of the 20 declarations, `theorem` only, four definitions with
real bodies. All own backticked names of the README are declared, and conversely.

### 7. Headlines and padding

The README's end theorems (lines 24–34), sixteen, are each stated; the docstring names the three
cited propositions (degree-divisibility, height zero, Alperin–McKay) as not stated. One-tactic
probe on a scratch copy, each `sorry` replaced by `first | rfl | (simp; done) | infer_instance |
trivial | simp` with the four definitions unfolded `| (intros; exact ⟨_, rfl⟩) | decide`: 16
errors, one per theorem; none closes. No declaration restates a definition, mirrors a Check or
treats a boundary case.

### 8. Copyright and arrangement

Wording compared at the sampled locators and at eight further passages: the §2.1 route against
glauberman lines 107–135; the §3.1 route against lines 273–286; the §4.3 route against lines
555–600; the §8.3 route against reynolds lines 534–540; the §8.4 route against martinez lines
2330–2349 (a different argument: no induction on `|G|`); the §6.3 definition against martinez
lines 719–726; the §5.2 definition against geck lines 29–30; the docstring of
`existsUnique_canonicalExtension` against glauberman lines 236–237. No sentence is reproduced;
what is shared is formulas and the letters of formulas. No table, figure or exercise list is
taken over. No public formalisation of these statements is known to me.

Arrangement against martinez (contents at martinez lines 24–64): Layer 6 ↔ 2.1, 3.1, 3.2, 2.2;
Layer 7 ↔ 3.1, 4.2, 7.1, 8.1, 7.2, 9.2, 9.1, 8.2; Layer 8 ↔ 8.2, 9.3 and Reynolds; Layer 9 ↔ 9.3.
No one-to-one run. Against glauberman, Layers 2–4 meet its §§2–4 in the order the `*Needs:*`
lines of §3.2 and §4.1 force, with other scopes (Lemma 3 and Brauer's lemma in Layer 1, Theorem
5 (e) in Layer 5, the uniqueness of the family added).

Source independence: 23 passages compared with 5 sources, none shared; largest share martinez,
36 of 83 `<source> line N` locators; contents compared with martinez: independent.

## Not verifiable

- isaacs (Theorems 3.12, 6.32, Corollaries 6.17, 11.29, Chapter 13), isaacs-1973, navarro-1998,
  navarro-2018, feit: uncertified and settled; not read. Each stands beside a locator that was
  read, except the uniqueness formulation of §4.5 (navarro-2018), whose induction I checked
  directly (table row 4.5).
- The truth of the cited classification-dependent theorems (kessar-malle, mnst, ruhstorfer, geck)
  beyond their statements.

## Source issues

- **Misprint** in martinez at §3.2, printed page 18 (martinez line 725): the source says a character has height zero when the numerical defect equals the `p`-part of its degree; it should be when `p^{a − d(B)}` equals the `p`-part of its degree; affects nothing.
- **Misprint** in martinez at the proof of Theorem 9.8, printed page 61 (martinez line 2337): the source says the heights of `B` coincide with the set of characters of `b`; it should be with the set of heights of the characters of `b`; affects nothing.

## For the human reviewers

- **Licence.** martinez (36 of 83 line locators) is unpublished course notes read from the
  author's university page; sambale is read from the author's page, the published book being
  Springer LNM 2127. Neither copy states a licence (`sources.toml`, `licence_class = "author-page"`).
- **Scope.** LocalFiniteGroupTheory L3 (open) states Glauberman's lemma; README §1.2 (lines
  547–572) proves the class and coset forms itself from IG.3.4, that roadmap being excluded as a
  supplier. Whether to cite it later is a maintainer's decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "33b1190cf3bc5fd34ac3f52918c831dd59aba143", "job": "REV-PKG-ModularCharactersAndBlocksPartII~2", "model": "fable", "worker": "chris-x26"} -->
