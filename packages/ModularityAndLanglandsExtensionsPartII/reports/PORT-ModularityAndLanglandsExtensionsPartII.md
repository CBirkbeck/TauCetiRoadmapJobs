# PORT-ModularityAndLanglandsExtensionsPartII

## Branch and head

- Branch: `roadmap/modularity-and-langlands-extensions-part-ii`, created from `ef3d21f` with a clean tree.
- Head: `cb06aa3b1c46e5c2395cb8c1daff84a95a6a0381`. The commit message is
  `ModularityAndLanglandsExtensionsPartII: roadmap (README, Suggested.lean, metadata)`.
- Diff against `ef3d21f`: three files added under `TauCetiRoadmap/ModularityAndLanglandsExtensionsPartII/`
  (`README.md`, `Suggested.lean`, `metadata.toml`). Nothing outside the folder changed, and the
  top-level README list was not edited.

## Checks

- **Build.** `lake build TauCetiRoadmap.ModularityAndLanglandsExtensionsPartII.Suggested` ended
  with `Build completed successfully (18830 jobs).` It printed **2 warnings**, both
  `declaration uses 'sorry'`, at `Suggested.lean:98:8` and `Suggested.lean:117:8`. There were no
  other warnings.
- **Gate.** The summary line was
  `gate ModularityAndLanglandsExtensionsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- **Dependency order.** I ran the brief's `gate --depcheck … --movable` command after the final
  edits. It printed one line, `depcheck: 255 roadmaps, 2429 edges, 0 problem(s)`. There was no
  UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the ported README, against main `ef3d21f` and 455 open
  heads, found no cross-roadmap citation and no Lean name missing. It could not check the
  library names, so I checked every Mathlib and Tau Ceti name in the supplier contracts by hand
  at the pins of this worktree's manifest (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`). All of them
  exist:
  - Tau Ceti `HeckeRing.GL2.Newform` (`Newforms/Newform.lean:104`), `satakeParameters`
    (`Newforms/Satake.lean:91`), `exists_satakeParameters_eq_pair` (117),
    `prod_map_one_sub_mul_satakeParameters` (161) and
    `LSeries_eulerProduct_hasProd_satakeParameters` (191, for `Re s > (k+1)/2`).
  - Tau Ceti `CuspForm.hasEntireExtension_qExpansion_coeff` (`LFunction/Basic.lean:192`), and
    `TauCeti.exists_isSl2Triple_of_isNilpotent_ad` and `IsSl2Triple.exists_isSl2Triple_iff_sub_mem`
    (`Algebra/Lie/Sl2/JacobsonMorozov.lean:87, 199`).
  - Mathlib `Nat.multiplicity_pow_two_sub_one` (it needs `Even n`, `n ≠ 0`, odd `x > 1`),
    `Polynomial.discr`, `Nat.exists_prime_lt_and_le_two_mul` (`n ≠ 0 → ∃ p, p.Prime ∧ n < p ∧ p ≤ 2n`),
    `NumberField.abs_discr_gt_two`, `DirichletCharacter`, `DirichletCharacter.changeLevel`,
    `changeLevel_injective` and `changeLevel_eq_one_iff` (both `[NeZero m]`),
    `changeLevel_eq_cast_of_dvd'`, `ZMod.unitsMap`, `MulChar.map_nonunit`,
    `UpperHalfPlane.qExpansion`, `ZMod.χ₄` (ℤ-valued) and `GaussianInt`.
  - The claim "no Ramanujan–Deligne bound is supplied" holds: Tau Ceti has no such theorem at the
    pin, and `Satake.lean` takes the bound as an explicit hypothesis.
- **Citations into roadmaps on main.** I opened each cited section, and every one exists with the
  content the contract states:
  - AdicSpacesPartII §R1.9, AdicSpacesPartIII §R2.9 and AdicSpacesPartV §§1.1, 1.4, 1.5.
  - IntegralHeckeAndGaloisDeterminants §§0.2 (Chenevier determinants), 0.5, 1.1, 1.3, 1.4, 1.5.
  - SmoothRepresentationsOfLocalGroups SR.1.4, SR.1.5, SR.2.1–SR.2.3, SR.3.1, SR.3.3, SR.3.4, SR.4.4.
  - ReductiveGroupsPartII §§RG2.1.3, RG2.3.3, RG2.4.1, RG2.4.2, and NilpotentOrbits N2.
  - PhiGammaModulesAndIwasawaCohomology §7.5.
  - ClassFieldTheory Layers 7, 8, 11–14, Chebotarev Layer 10 (completed roadmap) and
    RepresentationTheory/CharacterTheory Layers 3 and 9.
  - The supplier threshold `a₀(p) ≥ 3`, used by the §11.1 Check, is in
    ArithmeticGaloisRepresentations at its head (README lines 3413 and 5320 there).
- **Signatures.** I added `#check @name` for all four declarations to the end of `Suggested.lean`,
  built the module once with the brief's `lake build` command, read the elaborated types and then
  restored the file byte for byte. The restored file is identical to the package's file. Each
  elaborated type matches its README statement in §§14.4–14.5:
  - `1 ≤ n` is present.
  - The Satake hypothesis ranges over all primes in §14.4 and over primes with `¬p ∣ N` in §14.5.
  - `[NeZero N]`, `2 ≤ k` and `¬HasQuadraticSelfTwist f` are present.
  - The product runs over `Nat.Primes` in §14.4 and over `{p : Nat.Primes // ¬ p ∣ N}` in §14.5.

  The file has no section `variable`s, so no binder can be lost, and nothing changed.

## Draft pull request body

This roadmap proves symmetric power functoriality for holomorphic modular forms and for Hilbert
modular forms. ModularityAndLanglandsExtensions states these theorems and the steps of
Newton–Thorne's and Clozel–Thorne's proofs. This Part II starts where that roadmap stops and builds
the four methods behind them:
- **Analytic continuation along eigenvarieties.** Rigid spaces of conjugate self-dual
  pseudocharacters, continuation of symmetric-power automorphy along components of definite
  unitary eigenvarieties and of the Coleman–Mazur eigencurve, and the 2-adic ping-pong on
  Buzzard–Kilford's boundary annuli (Theorem D).
- **Level raising on definite unitary groups.** Depth-zero types at inert places, chamber-fixer
  Hecke algebras of ramified unitary groups, the Kazhdan–Lusztig classification and its modules,
  Steinberg level raising by residually reducible deformation theory and by Thorne's `p`-adic
  method, and the residually CM seed.
- **Automorphy lifting for symmetric powers.** Rank-two deformation rings patched together with
  the symmetric-power pseudodeformation ring, with seasoned representations removing
  supercuspidal primes.
- **Tensor-product functoriality lifting.** The untwisted tensor `r_π ⊗ Sym^{r−1} r_σ`,
  functoriality lifting with one factor fixed, and residual witnesses for the coefficient-Frobenius
  twisted tensor. Together these give the Bertrand induction proving `SP_n` for every `n` over
  every totally real field.

The endpoints over `ℚ` are Theorems A, B and E in every rank and symmetric power functoriality for
every non-CM newform. `Suggested.lean` states the consequences that are visible on Tau Ceti's
newforms and Satake parameters: the Euler product of `L(s, Sym^n f)` extends to an entire
function for level-one eigenforms, and, away from the level, for every newform of weight at least
`2` without a quadratic self-twist. The roadmap is written so that every step of the published
proofs, including the places where a printed argument needs repair, is a target with its exact
hypotheses and locator. Each such target rests on Mathlib, Tau Ceti or a named section of an
earlier roadmap.

## Roadmaps this one depends on that are still pull requests

- AlgebraicModularFormsAndSerreWeights
- ArithmeticGaloisDuality
- ArithmeticGaloisRepresentations
- AutomorphicGaloisRepresentations
- AutomorphicGaloisRepresentationsPartII
- AutomorphicLFunctionsAndLocalFactors
- ClassicalSerreModularity
- CompletedCohomologyAndLocalGlobalCompatibility
- DeformationAndDerivedPatchingAlgebra
- EndoscopicTransferAndUnitaryTraceComparison
- FiniteFlatGroupsAndIntegralPadicHodgeTheory
- GL2AutomorphicRepresentationsAndTransfer
- GL2ModularityLifting
- GlobalGaloisDeformations
- LocalGaloisDeformationRings
- ModularityAndLanglandsExtensions
- OrdinaryAutomorphicFormsAndModularityLifting
- PadicFamilies
- PadicHodgeTheory
- PotentialAutomorphyInfrastructure
- PotentialAutomorphyInfrastructurePartII
- PotentialModularityAndCompatibleSystems
- SerreWeightAndLevelOptimisation
- SpringerResolutionAndCharacteristicCycles

All of them are earlier than this roadmap in the merge order. The roadmaps it cites on main are
AdicSpacesPartII, AdicSpacesPartIII, AdicSpacesPartV, ClassFieldTheory,
IntegralHeckeAndGaloisDeterminants, NilpotentOrbits, PhiGammaModulesAndIwasawaCohomology,
ReductiveGroupsPartII, RepresentationTheory, SmoothRepresentationsOfLocalGroups and Chebotarev
(completed). No cited id is defined only by an open revision.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the acceptance-test form:
- It has one module docstring titled "target signatures", which names the headline theorems that
  are not statable and what each lacks.
- It has two real definitions on native carriers, `symPowerEulerFactor` and
  `HasQuadraticSelfTwist`.
- It has two headline theorems with `sorry`: `symPowerEulerProduct_levelOne_entire` and
  `symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist`.
- It has one proved `example`, the `α ↔ β` symmetry of the kept Euler factor. That example is not
  a value computation, and README §14.4 cites it.

The file has no `set_option`, no `lemma`, no sorry'd data and no padding, and I kept it unchanged.
Its header (`module`, `public import Mathlib`, `public import
TauCeti.NumberTheory.ModularForms.Newforms.Satake`) is a form used by other roadmaps on main, and
the gate's import checks accept it. The one Tau Ceti module it imports exists at the pin.

I checked whether any headline is statable at the pins but missing. Every other endpoint needs one
of these carriers, none of which exists at the pins:
- automorphic representations of `GL_n` or of definite unitary groups;
- the automorphy predicate;
- eigenvarieties;
- Hilbert modular forms;
- local Langlands at ramified primes;
- deformation rings.

The docstring lists each of them.

## Supplier replacements and duplication removals

No supplier replacement or duplication removal was needed.

- **The two definitions.** Neither the pinned Mathlib nor Tau Ceti has a symmetric-power Euler
  factor or a self-twist or CM predicate on newforms. I grepped Tau Ceti's modular-forms tree and
  Mathlib's `NumberTheory/ModularForms`. The Loogle and LeanSearch leads in the scratch file
  (`EulerProduct.eulerProduct_hasProd`, `riemannZeta_eulerProduct_hasProd`,
  `MulChar.IsQuadratic`, …) are general tools, and none of them proves either target.
- **Self-twist on main and at the open heads.** `roadmaps grep` finds no other `satakeParameters`
  statement in any roadmap's Lean file. It finds no other self-twist predicate on newforms either.
  GL2AutomorphicRepresentationsAndTransfer §R16.4.6 owns the non-CM condition on cuspidal classes,
  a carrier that is not at the pins. The README cites it as the owner and keeps only its
  coefficient form on Tau Ceti newforms, the carrier the Lean statement needs.
- **Holomorphy of `L(s, Sym^n ·)`.** The only other statements are ModularityAndLanglandsExtensions
  §4.32 (completed `Λ(Sym^n E, s)` for semistable `E/ℚ`) and §4.37 (`n ≤ 8` over totally real
  fields, Clozel–Thorne). §§14.4–14.5 here differ: they cover all `n`, for level-one eigenforms
  and for non-CM newforms of any level away from the level. Both sections are derived from that
  roadmap's §§4.12 and 4.29, which they cite.
- **Kazhdan–Lusztig classification (§4.9).** No roadmap on main states it.
  SmoothRepresentationsOfLocalGroupsPartII (open) states it as its §7.4, but it is later in the
  merge order (line 316 against 304), so this roadmap is the owner. The removal belongs to that
  roadmap (see "Unresolved").
- **Other intermediate objects** (pseudocharacter spaces, the twin involution, depth-zero types,
  the Kazhdan–Lusztig modules `X`, `Y`, `Z`, seasoned representations, `S5-global`/`S5-local`):
  I searched by object and found them only here. "Scope and ownership" records the boundary with
  ModularityAndLanglandsExtensions, which states the theorems this roadmap proves.

## Fixes made in the README as an upstream reviewer

1. **Dangling reference (Conventions).** "Locators are to the versions recorded in `sources.toml`"
   referred to a file that is not in the roadmap repository. It now reads "…listed under
   References", which already gives the versions.
2. **Wrong author (References).** The first author of ls20 is **Jaime** Lust, not Peter Lust. I
   checked the arXiv abstract page of 1611.08421v1. The same error is in the package's
   `sources.toml`, which the port does not carry.
3. **A Check that did not test the stated object (§2.5, third Check).** The locus `Z_{3,l,i}` is
   cut out by `discr(det(X − g^i))` for the rank-two pseudocharacter. The Check computed
   discriminants of `Sym^3` of `Q_8`'s representation instead, which is not what the definition
   uses. The rewritten Check uses the index `i = 2`:
   - every `g²` is `±1`, so all those discriminants vanish;
   - the representation is irreducible;
   - for `i = 1` a non-central `g` has discriminant `(2√−1)² = −4 ≠ 0`.

   The rewrite also avoids using `i` both as the index and as `√−1`.
4. **Type mismatch (§14.5, third Check).** Mathlib's `ZMod.χ₄` is a `MulChar (ZMod 4) ℤ`, not a
   `DirichletCharacter ℂ 4`. The Check now says it is composed with `ℤ → ℂ`.
5. **Process reference (Scope and ownership).** The sentence justifying ownership of the
   Kazhdan–Lusztig classification by "the earliest roadmap in the merge order" became "other
   roadmaps that need the classification cite §4.9". The merge-order reasoning stays in this
   report.

All other text is the package's. The accepted review (REV~10) had no open finding: its three P3
findings were repaired in FIX-PKG~11 before acceptance. The red-team rounds RT~1 and RT~2 were
repaired in FIX-RT~1 and FIX-RT~2 before this port, and I confirmed that those repairs are present.

## Adversarial mathematics pass

Values were recomputed this round. The pass covers the two Lean statements and their definitions
in full, and every numerical Check and worked example of every layer. Statements whose content is
a structural theorem of a source were tested through these instances, not re-read in the source
this round. Rounds 2–10 of review record the source reads.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `symPowerEulerFactor` symmetric in `α, β` | `n = 2`; general `n` | `(1−α²x)(1−αβx)(1−β²x)` is symmetric; reindex `j ↦ n−j` | holds (and is proved in Lean) | none |
| `symPowerEulerFactor` at `n = 0`, `n = 1` | `n = 0`; `n = 1` with Satake `{α,β}` | `1 − x`; `(1−αx)(1−βx) = 1 − a_p x + αβx²` (Tau Ceti `prod_map_one_sub_mul_satakeParameters`) | API bullets hold | none |
| §14.4 headline | `n = 0`; `n = 1`; `Δ`, `n = 2`, `p = 2`; empty `Newform 1 k` for `k ≤ 10` or odd | `ζ(s)`, pole at 1, so `1 ≤ n` is needed; region `(k+1)/2` is Tau Ceti's; `α²+αβ+β² = 576 − 2048 = −1472`, `x²`-coefficient `αβ·(−1472)`, `x³`-coefficient `−(2¹¹)³`; empty type, vacuous | true; hypotheses needed | none |
| §14.4 region | `|α^jβ^{n−j}p^{−s}|` under Deligne | `p^{n(k−1)/2 − Re s} ≤ p^{−1−δ}` for `Re s > n(k−1)/2 + 1` | absolute convergence, so `HasProd` | none |
| §14.5 headline, `M > 0` | `M = 0` | `p.Coprime (N·0)` iff `p = 1`, so no prime is tested; the sign character of `(ℤ/0)^× = {±1}` is non-trivial with square `1` | without `M > 0` every `f` self-twists | none (already in Lean) |
| §14.5 `HasQuadraticSelfTwist` vs CM | `y² = x³ − x` (level 32), `ψ = χ_{−4}`; `Δ`, `ψ = χ_{−4}` | `a_5 = 5 + 1 − 8 = −2`, `ψ(5) = 1`; `a_3 = 0`; for `Δ`, `a_3 = 252`, `252·(−1) ≠ 252` | the CM form has a self-twist and `Δ` does not | none |
| §14.5 exclusion is needed | level 32, `n = 4`, `αβ = p` | `α²β² = p²` gives `ζ(s−2)(1−2^{2−s})`, with a pole at `3 = 4·1/2 + 1` | hypothesis necessary | none |
| §14.5 `k ≥ 2` | icosahedral weight one, `k = 1` | edge `n·0/2 + 1 = 1`; trivial constituent gives `ζ(s)` | weight bound necessary | none |
| §14.5 `n = 0` | any `N` | `ζ(s)∏_{p∣N}(1−p^{−s})`, nonzero factor at `s = 1` | `1 ≤ n` needed | none |
| §14.5 modulus enlargement | `ψ = χ_{−4}`, `M′ = 3` | `changeLevel`: `ψ′(3) = 0`, `ψ′(7) = −1`; ring-map composite has value `−1` at the non-unit `3` | holds | `ZMod.χ₄` typing fixed |
| §14.5 self-twist ⇔ CM for `k ≥ 2` | real quadratic `ψ` | `r ≅ r⊗ψ` gives `r = Ind χ`; real quadratic `χ` has parallel infinity type, so equal HT weights, contradicting `{0, k−1}` | only imaginary `ψ`, so CM | none |
| §0.2 Checks | `n = 1`, `p` odd; `p = 3`, `C_5` | pro-`p` of `ℤ_p^×× ℤ̂` is `ℤ_p²`; `|Hom(ℤ_3^××ℤ̂, C_5)| = 1·5 = 5`, `|Hom(ℤ_3^××ℤ_3, C_5)| = 1` | holds | none |
| §0.4 Euler characteristic | `n = 1`; `n = 2` abs. irr. | `1 + 0 + 1 = 2`; `1 + 0 + 4 = 5` | holds | none |
| §1.1 `3`-regularity | ratio `α/β` | `(α/β)^{1,2} ≠ 1` iff `α ≠ ±β` | holds | none |
| §1.3 Vandermonde | indices `{0, 2}` | `det[[1,1],[0,2]] = 2 = ∏(j−i)` | holds | none |
| §2.1 twin | `Δ`, `p = 2`; twin twice with ramified `χ_{0,1}` | slopes `3 + 8 = 11`; `(ψψ′)_p = χ_{0,2}^{−1}χ_{0,1}^{−1}χ_{0,2} = χ_{0,1}^{−1}` | holds | none |
| §2.2 Checks | `pℤ_p ⊂ ℤ_p`; `⟨4⟩ ⊂ ⟨2⟩`, modulus 3 | `t ↦ t^p`, degree `p`; `2^a ≡ (−1)^a` | holds | none |
| §2.5 `Sym^6` criterion | binary octahedral; `A_5` | `S_4` irreps have dimension ≤ 3 < 7; `A_5` irreps have dimension ≤ 5 < 7, while `Sym², Sym⁴` are irreducible | holds | none |
| §2.5 `Q_8` Check | `i = 1, 2` | `g² = ±1`: discriminant `0`; `g` of order 4: `(2√−1)² = −4` | old Check tested `Sym^3`, not the definition | rewritten |
| Layer 2 Examples | `Δ`, `p = 3` | `252 = 2²·3²·7`, slopes `2, 9` | holds | none |
| §3.1 | `κ(5) = 5` | `w = 4`, `v₂ = 2`, slopes `2, 4, 6, …`, all even | consistent with no odd slope at level 4 | none |
| §3.2 | `k = 3, 4, 6` (`m = 0`); `k = 2`, `m = 1` | `w = 4, 24, 624`, `v₂ = 2, 3, 4 = 2 + v₂(4)`; `w = −2`, `v₂ = 1 = 2^{1−m}` | annulus is `v₂ < 3` | none |
| §3.3 | weights `3`, `5`, `m = 0` | `i + i′ = 1` (impossible); `= 2` | holds | none |
| §3.4 | `Δ` mod 5 and mod 7 | `−24 ≡ 1`, `2¹¹ ≡ 3`, `(X−2)(X−4) ≡ X²−X+3`; `2` has order 4 in `𝔽_5^×`, order 3 in `𝔽_7^×` | no root-of-unity ratio | none |
| §3.7 ping-pong | `i = 1` | `m_π = 2`, `k′ = 9`, `s = 2 < 7/2`, `i′ = 3 = 2² − 1`, twin slope `6 = 3·2` | holds | none |
| Layer 3 Examples | weight 16 | `a_2 = 216 = 2³·27`, slopes `3, 12` | holds | none |
| §4.1 | `Φ_2`; `𝔽₉/𝔽₃` | `Φ_2^t = −Φ_2 = Φ_2^{−1}`, `θ_2² = id`; `𝔽₉^×/𝔽₃^×` has order 4, character value `i` | holds | none |
| §4.3 | `n = 2`, `σ⊕σ′`, `σ⊕σ` | odd multiplicities do not extend; `σ⊕σ` extends and is not discrete | holds | none |
| §4.4 | `q = 3` | `|U_3(𝔽_3)|_{3′}/|C| = 4·8 = 32`; `dim τ(v) = 6`; `−1 + q(q−1) + q³ = (q+1)(q²−1)`; `q ≡ 1` gives `q³+1 ≡ 2` | holds | none |
| §4.5 | `q = 3`, `p = 7` | `3` has order 6 mod 7; `|C| = 28` | holds | none |
| §4.8 | `k = 0`; `k = 1` | `H(U_1, I) = ℤ[ℤ/2]` of rank 2 against `H_B = ℤ`; `v_F(ϖ_E²) = 1` | holds | none |
| §4.9 | `PGL_2`, `s = diag(i,−i)` | ratio `−1`; `zs = −s` is `W`-conjugate to `s`; pullback character `i² = −1` at `ϖ`, so `2 = 1 + 1` | condition (d) needed | none |
| §4.10 counts | `n = 7, 9, 11` | `1+7 = 8`; `1+11+2 = 14 = 2·2+2+8`; `1+16+5 = 22 = 2·3+2+14`; `[K:B] = 4·40·364 = 58240` | holds | none |
| §4.12 signs | `m = 3, 5` | `jY − jX + jZ` equals twice the shuffle sum (term by term); `11 − 1 + 2 = 12`; printed `X` exponent fails | holds | none |
| §5.1 | `n_1 = 2, 3`; `n_2 = 2` | `dim = q−1, (q−1)(q²−1)`; `[GL_3:𝔮] = 13` at `q = 3`; `[𝔮:𝔯] = q+1` | holds | none |
| §5.6 | `s = 0`, `l > 5` and `l = 5`; `U(7)` weights | `4/2 = 2` and `4`; `1` and `2`; `(4,3,2,0,−2,−3,−4) − ρ = (1,1,1,0,−1,−1,−1)` | holds | none |
| §5.7, §5.8 | `q_{v_0} ∈ {9, 19, 29}`; partitions of 7 at least `331` | all `≡ −1` mod 5; orthogonal ones `331, 511, 7` | holds | none |
| §5.9, §5.10 | `(a, b) = (d+c, d)`; `a = 2`, `b = 1` | `a > b` iff `c > 0`; `6 > 5` | holds | none |
| §6.2, §6.3 | `12·32 = 384`; `p = 7`, `q_v = 29`; `p = 5`, `q_v = 11` | ratios `1 ≠ 29`; `(X−1)³ ∉ Pol_3((2,1), 11)` | holds | none |
| §6.4, §6.7, §6.9 | `n = 3`; `(4,3)`; `q = 2` over `𝔽_5`, `𝔽_7` | `[F_ṽ:ℚ_p] > 4`; `12` even and `5 ∤ 84`; `2·2 = 4 ≠ 1` but `3·2 = 1`; `{3, 5} ∩ {2, 4} = ∅` | holds | none |
| §7.1 | `a_2, a_4, a_5, a_8` | `(1+i)⁴ = −4`, `16`, `(2+i)⁴ + (2−i)⁴ = −14`, `−64` | matches `q`-expansion | none |
| §7.2 | `n = 3, 4` | `48·3! = 288`, `577` prime (`289 = 17²`); `48·4! = 1152`; `χ_iχ_i^c = ε^{3(n−1)−4(n−1)}` | holds | none |
| §7.3 | Diamond at `q ≡ 3 mod 4` | `0 ≡ −q³(q+1)²` iff `q ≡ −1` mod `p` | holds | none |
| §8.1, §8.2 | `n = 3`; `n = 3`, `k = 2` | `α², αβ, β²` distinct iff `α ≠ ±β`; `p > max(8, 4)`, so `p ≥ 11`; `(n−1)(k−1) ≤ p−2` | holds | none |
| §9.1, §9.5, §9.8 | `n = 2, 10`; `p = 3`; `p = 2`, `n = 3, 4` | `7 > 5 ≥ 5`; `23, 25 > 19`; `3^a > 5` gives `a ≥ 2`; `2^a > 5, 7` gives `a ≥ 3` | holds | none |
| §9.3, §9.4 | `n = 2, 3`; `n = 4` with cube-root ratio | exponents `(1,−1)`, `(1,0,−1)`; `α³ = β³` | holds | none |
| §9.6 | `ℤ₂[[y]]`, `λ = −1`; `(1+x)²` | `λ²(1+y) = 1+y`; fibre `x² + 2x`, degree 2 | holds | none |
| §9.7 | `n = 3`, `a = 2, −1, i` | `{4,1,1/4}`, `{1,1,1}`, `{−1,1,−1}` | criterion `a^{2m} ≠ 1` | none |
| §10.3, §10.5 | `n = 3`; `t = n = 13` | `t = 53` (`49, 51` composite), `q = 211` (`158` composite); `tr I_13 = 13 = 0` in `𝔽_13`; `8·13·12 = 1248` | holds | none |
| §10.1 | depth-zero supercuspidal | `a(Ind χ) = 2·1 + 0 = 2`, giving `l²` | holds | none |
| §11.1, §11.2 | `p = 5`; `r = 2` | `19 ≡ −1`; `a > a₀(5) ≥ 3` gives `a ≥ 4` (supplier at its head); `{0,1}+{0,2} = {0,1,2,3}`; `ε̄^{−2}ε̄ = ε̄^{−1}` | holds | none |
| §11.3 | `s^c` against `s^∨` | multiplier `ε^{1−2r}ω_p^{r−1}(yy^c)^{1−r} = ε^{1−2r}` | holds | none |
| §11.4–11.6 | `n = 4`, `[F′:ℚ] = 2`; `𝔽_7`, `q = 3`, `Φ = diag(1,2)` | `dim Λ = 9`; `1+16 = 17`; adjoint-twist eigenvalues `3·{1,1,2,4} = {3,3,6,5}` | holds | none |
| §12.4 | `r = 1`, `(α,β,γ) = (2,3,5)` | `η = (10, 15)`, generators `U¹ − 10`, `U² − q^{−1}·150`; `η_1η_2 = αβγ²` | holds | none |
| §12.6 | `q = |S ∪ S_∞| = 3`; `q = 0` | `γ = 2`, `{±1}²`; `γ = −1` | bound on `q` needed | none |
| §13.1, §13.2 | char 2, `M = 6`; `r = 3`; `p = 5` | `q ± 1 ∈ {1,3,5}`; `max(12,5) = 12`; `q_{v_1} ∈ {11,16,31,41}` | holds | none |
| §13.3 | `t = 13` | `103 ≡ −1`, `53 ≡ 1` mod 13 | holds | none |
| §13.4 eigenvalue choice | `r = 4`, `q = 17`, `x = 2`, `y = 3`; `q = 43`, slots exchanged | forbidden `{1,2,4,8,9,13,15,16}`; eigenvalues `7,6,10,11,14,12,3,5`, distinct; `xy³ = xy^{−3}` | holds | none |
| §13.8 | `p = 7`, `a` odd | `7^a ≡ 3` mod 4, so `−1` is a non-square and the only scalars are `±1` | cyclotomic clause can fail | none |
| §13.9, §13.10 | `n = 6, 7, 8, 10, 11, 12`; Bertrand on `⌊n/2⌋` | `(5,1)`: `SP_1, SP_2, SP_4`; `(5,2)`: `SP_1, SP_2, SP_3, SP_3`; `(7,1)`, `(7,3)`; `11`: only `p = 7`; `12`: `p ∈ {7, 11}`; `p ≤ 2⌊n/2⌋ < n` or `= n` even, not prime | every index `< n`, `p ≥ 5` | none |
| §14.1 | `Sym^{n−1}(St ⊗ χ)`; `T_v ≡ 2` | `sp(n) ⊗ χ^{n−1}`; `(q_v+1)² ≡ 4 = T_v²`; `ℚ_{p²}` labelled `(4,0)`, `(0,4)` not ordinary | holds | none |
| Worked examples | `p = 577`, `n = 11` | `577 = 2·288 + 1`; `(5.5, 11) ∩ primes = {7}`, `r = 4` | holds | none |

## Ownership against open work

The closest roadmaps by the overlap tool were PotentialAutomorphyInfrastructurePartII,
ModularityAndLanglandsExtensions, OrdinaryAutomorphicFormsAndModularityLiftingPartII,
PotentialModularityAndCompatibleSystems and GL2ModularityLifting (open), and
SmoothRepresentationsOfLocalGroups, IntegralHeckeAndGaloisDeterminants and ModularForms (main).
None of them owns an object this roadmap states:
- ModularityAndLanglandsExtensions states the theorems this roadmap proves and imports nothing
  back.
- PotentialAutomorphyInfrastructurePartII supplies the residually reducible machinery, cited by
  layer and title.
- Chenevier determinants are IntegralHeckeAndGaloisDeterminants'.
- Newforms and Satake parameters are Tau Ceti's.

No other open pull request changes this roadmap, no cited id is dropped, and there is no second
copy. The `Suggested.lean` declarations' fully qualified names do not collide with any
declaration in a readable roadmap. I checked ownership against the open roadmap pull requests
through `roadmaps grep`/`show` at their heads.

## Unresolved

- **SmoothRepresentationsOfLocalGroupsPartII** (open, later in the merge order) states the
  Kazhdan–Lusztig classification as its §7.4 without citing §4.9 here. That roadmap should cite
  §4.9 instead. The edit belongs to it.
- **Fifteen "What X must provide (gap:…)" contracts** are requests to supplier roadmaps that are
  still pull requests:
  - PotentialAutomorphyInfrastructurePartII ×2
  - AdicSpacesPartV
  - GlobalGaloisDeformations
  - DeformationAndDerivedPatchingAlgebra
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory
  - GL2ModularityLifting ×2
  - SerreWeightAndLevelOptimisation
  - EndoscopicTransferAndUnitaryTraceComparison ×2
  - SmoothRepresentationsOfLocalGroups
  - SpringerResolutionAndCharacteristicCycles
  - CompletedCohomologyAndLocalGlobalCompatibility
  - RepresentationTheory/CharacterTheory

  The AdicSpacesPartV, SmoothRepresentationsOfLocalGroups and CharacterTheory gaps target roadmaps
  on main and need revisions there. The others need additions in their supplier's open roadmap.
  The form "What X must provide (gap:…)" is the one used by roadmaps on main (AdicSpacesPartV,
  ExplicitPrimeCounting and others), and I kept it.
- **PotentialAutomorphyInfrastructurePartII** cites PotentialAutomorphyInfrastructure §2.5 for
  prescribed completions in its own routes. This roadmap uses PotentialModularityAndCompatibleSystems
  §2.16 for them, as recorded by the red-team fix. That is a defect in the other roadmap, not here.
- **Source issues** recorded in the README (nt21 Proposition 7.4's rank-two block, nt26 Lemma
  3.4's triviality above `p`, and several misprints) are stated at the claim. I searched for no
  published correction.
- **The `sources.toml` manifest** of the package still has "Peter Lust". It is not part of the
  roadmap folder.
- **Suspicious text.** None found in the reviews, reports or fetched pages.


Pull request: #2449 (roadmap/modularity-and-langlands-extensions-part-ii at cb06aa3)
