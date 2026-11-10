# Review of ModularCurves (pull request #2140 at 67dbf63)

**Verdict:** needs changes

Ten findings, all P3; none is a false statement. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` as its only warning. The mathematics of the two added targets (Layer 0.1 item 8 and the coarse base change of Layer 6.4) was recomputed and is sound. The findings are: four sorried theorems that the pinned Tau Ceti already proves (R01, R02), four statements about suppliers, the library or other roadmaps that the pin or main contradicts (R03–R06), two label and locator gaps (R07–R09), and two sentences of the description (R10).

## R01 (P3) — the two irreducibility theorems of Layer 5.3 are proved at the pin

**Location.** `TauCetiRoadmap/ModularCurves/Suggested.lean` 667–671 (`irreducibleSpace_of_connectedSpace`) and 678–685 (`irreducibleSpace_baseChange_algebraicClosure_of_connectedSpace`); `README.md` 2519–2521: "Both are stated in `Suggested.lean` (…) and are owned here."

**Claim.** Both are targets of this roadmap. The pinned Tau Ceti proves both, for any relative dimension and over any field.

**Witness.** Pin `2fd255d99`, `TauCeti/AlgebraicGeometry/Morphisms/Smooth/Irreducible.lean:54` (`Smooth.irreducibleSpace_of_connectedSpace`) and `:63` (`Smooth.irreducibleSpace_baseChange_algebraicClosure_of_connectedSpace`). On a scratch copy, `have := SmoothOfRelativeDimension.smooth 1 sY` followed by the pinned theorem closes each: exit 0.

**Repair.** Delete both declarations from `Suggested.lean` and the phrase "the algebraic reduction of geometric irreducibility of Layer 5.3" from its docstring's headline list. In `README.md` item 7 of Layer 5.3, replace "Both are stated in `Suggested.lean` … and are owned here" by a citation of the two pinned theorems, and list them under §Exact supplier contracts, From Tau Ceti.

## R02 (P3) — the two completion lemmas of Layer 0.9 are proved at the pin

**Location.** `Suggested.lean` 572–574 (`ringKrullDim_adicCompletion`) and 579–582 (`isRegularLocalRing_adicCompletion_iff`); `README.md` 1136–1138.

**Claim.** Both are stated as targets with `sorry`. Each closes with one `exact` of a pinned lemma.

**Witness.** `TauCeti/RingTheory/AdicCompletion/LocalRing.lean:52` (`TauCeti.AdicCompletion.ringKrullDim_eq`) and `:58` (`isRegularLocalRing_iff`). Probe: `exact TauCeti.AdicCompletion.ringKrullDim_eq` and `exact TauCeti.AdicCompletion.isRegularLocalRing_iff.symm`; with R01 the file goes from 36 to 32 `sorry` warnings, exit 0.

**Repair.** Delete both declarations from `Suggested.lean`. In `README.md` 1136–1138 cite the two pinned lemmas by name instead of the two backticked names of this roadmap, and add them to §Exact supplier contracts.

## R03 (P3) — Layer 5.3's "external contract": its first statement needs no supplier, and one locator moved

**Location.** `README.md` 2528 ("geometric connectedness is insensitive to the algebraically closed extension `ℚ̄ ↪ ℂ`"), 2534 ("No roadmap in this repository owns these statements"), 2536 ("excludes the compact-Riemann-surface comparison from its Layer 12").

**Claim.** All three statements are an external contract, and AlgebraicCurves states its exclusion in Layer 12.

**Witness.** `Y(ρ)` is affine. From `Y(ρ)⊗ℂ` to `Y(ρ)⊗ℚ̄` connectedness passes along the surjective projection; the converse is the pinned `connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed` (`TauCeti/RingTheory/Idempotents/Connected/ScalarExtension.lean:64`). AlgebraicCurves on main states the exclusion at lines 1660–1669, under "Scope exclusions and future directions", after Layer 12.

**Repair.** Cite the pinned lemma for the first statement and keep the other two as the contract ("two named hypotheses"). Replace "from its Layer 12" by "in its §Scope exclusions and future directions".

## R04 (P3) — four dependency statements route naive rigidity through Picard duality, which the pinned proof does not use

**Location.** `README.md` 718–719 ("uses the endomorphism rigidity of Layer 3.3, hence the Picard duality of Layer 2.4"), 1998–1999 ("The rigidity argument uses the endomorphism identities of Layer 2.6 and, through them, the Picard dual of Layer 2.4"), 2107–2108, 2471–2472.

**Claim.** Layers 3.3, 3.5 and 5.2 depend on Layers 2.4 and 2.6 through rigidity.

**Witness.** Layer 3.3 itself (1972–1975) describes the pinned proof: the automorphism fixes three points distinct in every fibre. `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Geom/Rigidity.lean` imports only `Geom.BaseChange.Basic`, `Geom.NaiveLevel`, `Geom.Neg` and `Scheme.ZeroSection`; no file of `Geom/` mentions the Picard functor. The statements owned in 3.3 follow by `IsRigid.of_hom`.

**Repair.** Layer 3.3: "**Dependencies.** Layers 2.1, 3.1, and 3.2, and the pinned rigidity." Delete the Picard clause at 718–719, the sentence "its rigidity proof nevertheless reaches Layer 0.1 …" at 2107–2108, and "through Layer 3.3 it consumes the Picard-duality construction of Layer 2.4" at 2471–2472. The table of §Dependency order stays true (Layer 3.2 uses Layer 2.1).

## R05 (P3) — "Each of these is pinned by a `#check`" is not what the file does

**Location.** `README.md` 611: "Each of these is pinned by a `#check` in `Suggested.lean`."

**Claim.** Every declaration listed under From Tau Ceti has a `#check`.

**Witness.** The file has 214 `#check` lines. More than fifty listed declarations have none, among them `projModelOver`, `projModelVariableChangeIso`, `tripleCategoryEquivalence`, `quotientAlgEquiv`, `isPullback_kernel_scheme`, `mulBy_mul`, `isogenyOfDegree_intCast`, `isRegularOfDim_iff_of_representableBy`. All eight exist at the pin (for instance `Scheme/ProjModel.lean:252`, `StrictHenselization/Point.lean:257`).

**Repair.** Replace the sentence by "The carriers and the declarations the statements of `Suggested.lean` rest on are pinned there by `#check`; the others are cited by name and file", or add the missing `#check` lines.

## R06 (P3) — §Downstream consumers says SchemeAndStackFoundations consumes these layers; that roadmap on main says it takes none as input

**Location.** `README.md` 3968–3975 ("SchemeAndStackFoundations consumes Layers 0.2–0.7 … Layer 0.9 … Layer 6.3 … and Layer 7.4") and 3990–3991 ("consumes Layer 0.9's strict henselisation (its scope and ownership, and the geometric unibranchness of §0.10)").

**Claim.** SchemeAndStackFoundations is a consumer of these layers.

**Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md` on main, lines 115–117: it names ModularCurves' layers as the owner of these objects and continues "none of these is an input here: §0.10 uses Tau Ceti's strict henselization `TauCeti.StrictHenselization.algebra`".

**Repair.** Rewrite the first bullet as "SchemeAndStackFoundations names Layers 0.2–0.7, 0.9, 6.3 and 7.4 as the owner of these objects in its scope and takes none of them as an input", and delete the sentence at 3990–3991. Keep "Nothing of this roadmap consumes SchemeAndStackFoundations", which the dependency check confirms.

## R07 (P3) — two kinds of label that open pull requests cite are not in §Labels used by other roadmaps

**Location.** `README.md` 3993–4053 (the table of former labels).

**Claim.** The description: "§Labels used by other roadmaps maps every earlier label to its section, so those citations resolve."

**Witness.** CanonicalModelsAndGonality (open, lines 1910 and 1921) cites "ModularCurves §0A.1, §0A.4–0A.5"; the table has no item labels. ShimuraVarieties (open revision, lines 135–143 and 2917) links the heading anchors `#0d-finite-étale-schemes-and-galois-actions`, `#5a-tate-normal-form-and-y₁n-for-n4`, `#5b-full-ordered-bases-and-fixed-pairing`, `#9d-coarse-moduli-schemes-and-finite-quotients` and `#9e-the-coarse-j-line-and-y₀n`, which no longer exist.

**Repair.** Add to §Labels: "An item label `0A.k` is item `k` of Layer 0.1; items 1–7 keep their numbers" (checked: items 1, 4 and 5 are the fibre criterion, finite-iff-proper and the degree, as on main). Add five rows for the former heading anchors: `0d-…` → Layer 0.4, `5a-…` → Layer 5.1, `5b-…` → Layer 5.2, `9d-…` → Layers 6.3 and 6.4, `9e-…` → Layers 6.5 and 9.6.

## R08 (P3) — Loeffler 3.8.1 is a Fact, and Proposition 3.8.2 states étaleness only

**Location.** `README.md` 1939–1941 ("étale, finite and surjective over `Ell/B` (…: Loeffler Proposition 3.8.2 for these two problems)"), 509–510, 1947–1948 ("Loeffler Definition 3.8.1"), 2386 ("finite étale over `Ell/ℤ[1/N]` (Loeffler Proposition 3.8.2)").

**Claim.** Loeffler 3.8.2 supports finiteness and surjectivity, and 3.8.1 is a definition.

**Witness.** Loeffler's notes (author's page), line 1031: "Fact 3.8.1", the existence of `P_H`; line 1063: Proposition 3.8.2 says `P_H` is relatively representable and étale over `Ell/ℤ[1/N]`. Neither finiteness nor surjectivity is stated there.

**Repair.** Write "Loeffler Fact 3.8.1" at 1948. At 509–510, 1939–1941 and 2386 attach the Loeffler locator to "relatively representable and étale" and leave finiteness and surjectivity to the pinned `hasProperty_isFinite_…` and `hasProperty_surjective_…`, which the text already names.

## R09 (P3) — Layer 1.5 has no locator

**Location.** `README.md` 1519–1531: "Prove that the unit `𝒪_T ⟶ (π_T)_*𝒪_{E_T}` is an isomorphism for every `T⟶S` … Prove that `𝒪_E(3[0])` is relatively ample and commutes with arbitrary base change."

**Claim.** Three theorems are stated with no source and no **Further sources** paragraph.

**Witness.** Stacks Project, Tag 0E62 (perfect.pdf line 3655): for `f` proper, flat and of finite presentation with `κ(s) = H⁰(X_s, 𝒪)` for all `s`, `f_*𝒪_X = 𝒪_S` after any base change. Tag 0D3D (spaces-descent.pdf line 1008): for a proper morphism the locus of relative ampleness of an invertible sheaf is open and compatible with base change.

**Repair.** Add to Layer 1.5: "**Further sources.** Stacks Project, Tag 0E62(a), for `π_*𝒪_E = 𝒪_S` universally (the fibre hypothesis holds because the fibres are geometrically integral, Layer 2.4 item 2); Tag 0D3D for the reduction of relative ampleness of `𝒪_E(3[0])` to the fibres, where a divisor of degree three on a curve of genus one is ample."

## R10 (P3) — two sentences of the description do not match the head

**Location.** The description: "No existing target, hypothesis, proof route or supplier contract is changed." and "Layers 0, 1, 2, 5 and 10 keep their numbers and their content, apart from the sections that moved into Layer 0."

**Claim.** Nothing but order and labels changed in Layers 2 and 10.

**Witness.** Main's Layer 10, item 2, extends `w_N` from "Layer 8's `[N-Isog]`-transposition" and its Dependencies name "Layer 8 (`[Γ₀(N)]`, `[N-Isog]`-transposition for `w_N`)". The head (3677–3679, 3768–3770) defines `w_N` as `(E, C) ↦ (E/C, E[N]/C)` on the naive structures of Layer 3.2 by the quotient isogeny of Layer 2.2. Main's 2F rigidity is now Layer 3.3, so Layer 2 lost content.

**Repair.** Amend the description: "except that Layer 10 now defines `w_N` on the naive `[Γ₀(N)]`-structures of Layer 3.2 by the quotient isogeny of Layer 2.2, so that it uses nothing from Layers 7–9, and that the rigidity of naive level structures moved from Layer 2 to Layer 3.3". The new definition is correct: `(E/C)/(E[N]/C) = E/E[N] ≅ E` by `[N]`, carrying `(E/C)[N]/(E[N]/C)` to `C`.

## Previous findings

The previous review read pull request #1808 at `edc8e6a`, a different branch. Against this head:

- R01 (hand copies of pinned carriers; the branch reverted main) — repaired: the merge base is main `5fc1aa8f`; the file has no `structure FiniteFlatCommGroupScheme` and no `mulBy_eq_one_of_finrank`, and line 178 reads `#check @TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme`.
- R02 (statable headlines declared not statable) — repaired: `firstMainTheorem_gamma`, `firstMainTheorem_gammaOne`, `exists_relRepData_gammaZero`, `exists_coarseModuliData_gamma_one` and `exists_representableBy_gammaNaive` are stated; the docstring's not-statable list (lines 133–149) names only carriers absent at the pin.
- R03 (files outside the folder) — repaired: the gate reports `outside-folder=0`; `git diff --stat origin/main...HEAD` lists only `README.md` and `Suggested.lean` of this folder.
- R04 (stale base, no order with #1187) — repaired: the merge-order block reads "`ModularCurves`: **this pull request** → #1808 → #1187 (pin bump)".
- R05 (moved content without old → new lines) — repaired in kind: §Labels used by other roadmaps maps every lettered label; the residue is R07.
- R06 (three one-tactic declarations) — partly: `isCommMonObj_kernel_mulBy` is gone; `ringKrullDim_adicCompletion` and `isRegularLocalRing_adicCompletion_iff` remain at 572–582 (R02).
- R07 (Layer 5.3's contract) — not repaired: line 2534 still reads "No roadmap in this repository owns these statements" (R03, narrowed to what main and the pin show).
- R08 (rigidity through Picard duality) — not repaired: 718–719 still reads "hence the Picard duality of Layer 2.4" (R04).
- R09 (`#check` sentence, strict henselisation at the pin, `ArtinianTestAlgebra`) — partly: Layer 0.9 now cites the pinned `TauCeti.StrictHenselization` declarations by name and line 3029 names `ArtinianTestAlgebra`; line 611 still overstates the `#check` list (R05).
- R10 (two `**Dependencies.**` lines) — repaired: Layer 0.9 has one, at 1362–1363.

## Verified sound

### Gate, dependency check, elaboration

- Gate at `67dbf63`, re-run with `--base origin/main`: every scanner 0, `OK`.
- Dependency check: `depcheck: 236 roadmaps, 2159 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, 36 `declaration uses sorry` warnings, no other warning, no error.
- `Suggested.lean` against main: after removing comments, the 94 blocks of declarations and `#check` lines are the same set on both sides. No statement changed; only order, section headers and docstrings.
- README against main: of 1799 sentences of main (labels normalised), 138 do not recur verbatim. I read all 138: introductions and dependency paragraphs rewritten, the split sections, and the one change of content in R10.
- One-tactic probe on a scratch copy (`rfl`, `infer_instance`, `simp`, `trivial`, the two completion lemmas): 34 of 36 stay open; with the two pinned irreducibility theorems, 32 (R01, R02).
- Signatures: `signatures.md` lists 56 declarations, none with a lost binder. Compared with the README: `hasProperty_finite` carries `[IsNoetherianRing ↑R]`, `exists_universalDeformation` carries `[IsAlgClosed k] [CharP k p]`, `smoothOfRelativeDimension_one_of_isCategoricalQuotient` carries `[IsLocallyNoetherian S]` and the regular-stalk hypothesis, `isDiscreteValuationRing_algebra` carries `[IsSepClosure (ResidueField R) Ω]`.

### Adversarial table

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.1 item 8, difference divisors (new) | `D' = D`; `D' = ∅`; Stacks 0B8V, 0B9F | `D'' = ∅`, degree `d − d = 0`; `D'' = D`, degree `d`; 0B9F: `X → S` smooth of relative dimension 1, degrees `d₂ − d₁` | true, locators exact | none |
| 6.4 coarse base change away from the level (new) | `H = 1`; `H = GL₂(ℤ/N)`; `N = 3`, `p = 2`; `Γ₁(4)`, char 2 | `[Γ(N)]` representable, KM 8.1.6(1); `M = 𝔸¹_j`, agrees with 6.5 item 6; `|H| = 48`, none of 8.1.6(1)–(4) applies, claim gives `(A/2)^H = 𝔽₂[j]`; `2 ∣ 4`, outside `ℤ[1/4]` | true; consistent with 6.5 and with `Ces15` Remark 6.6 | none |
| 6.4 route: reduction to primes | `D = ℤ[1/N]`, `φ : A → ∏A` | coker torsion-free ⇔ `A^H/p → (A/p)^H` onto for all `p ∤ N`; injective since `pa ∈ A^H ⇒ a ∈ A^H` | sound | none |
| 6.4 route: rank one | `−1 ∈ H`; `j ≠ 0, 1728` in char 2, 3 | `(E, −P, −Q) ≅ (E, P, Q)` so `−1` trivial on `Y_full(N)` yet free on structures of a fixed `E`; `Aut = {±1}` there, `H/(H∩±1)` free, torsor square base-changes | sound | none |
| `ker_baseChange_of_noZeroSMulDivisors_coker` | `ℤ →(·2) ℤ`, `R = 𝔽₂`; diagonal `ℤ → ℤ²` | kernel `𝔽₂` against range `0`, excluded by torsion in `ℤ/2`; `0 = 0` | true | none |
| 0.2 `ℤ/N` and `μ_N` dual; killed by rank (sample) | `μ_p/𝔽_p`; EGM (3.22)–(3.24), (4.46); Tate–Oort §1 | `x^p = 1`; EGM lines 2080, 2132, 2136, 3380; Tate–Oort line 126 (Deligne) | locators exact | none |
| 0.2 regression `ℤ[x]`, `x ↦ −x` | mod 2 | `𝔽₂[x²]` against `𝔽₂[x]` | consistent with 6.1 item 3 | none |
| 0.4 Galois description (sample) | Stacks 04HN; EGM (3.26) | étale.pdf line 925, splitting on an étale neighbourhood; EGM line 2205 | locators exact | none |
| 0.8 KM 1.11.4 example | `ζ = X` in `𝔽_p[X]/(X^p − 1)`, `ε = X − 1` | `∏_{a,b}(T − ζ^a) = (T^p − 1)^p = T^{p²} − 1`; `∑_a(ζ^a − 1) = ε^{p−1} ≠ 0`, so `∏_a(T − ζ^a) ≠ T^p − 1` | true | none |
| 1.5 (sample) | Stacks 0E62, 0D3D | 0E62(a) gives `f_*𝒪 = 𝒪` universally; 0D3D the ample locus | statements true, no locator | R09 |
| 3.1 (sample) | Conrad 3.1.2, §2.4; `Ces15` §4.1.2, 6.3 | Conrad lines 888, 664; `Ces15` lines 1246, 2708 | locators exact | none |
| 3.2 naive problems (sample) | char `p ∣ N`; `N = 2`; Loeffler 3.8.1, 3.8.2 | `(ℤ/p)²` has `p²` points, `E[p](k)` at most `p`: empty; `[−1]` fixes all; Fact, étale only | true; locator narrower than cited | R08 |
| 3.3 rigidity bounds | `Y² + Y = X³`, `(X,Y) ↦ (ζX, Y)`, point `(0,0)` | order 3 point fixed, so `[Γ₁(3)]` not rigid | true; dependency line wrong | R04 |
| 3.6 `IsRegularOfDim` (sample) | empty rigidifier; `Spec 𝔽_p` | fails nonemptiness; dimension `0 ≠ 2` | discriminates; pinned `Regular.lean:136` | none |
| 4.1 exact order (sample) | zero section in char `p`; ordinary `E[p]`, `P` of order `p` | `pⁿ[0] = Ker Fⁿ`; `∑_{a ∈ ℤ/p²}[aP] = p∑_{a ∈ ℤ/p}[aP] = E[p]` | true; Conrad 2.3.4–2.3.7, `Ces15` 4.2.6–4.2.7, `KW15` §4.2 exact | none |
| 5.1 Tate normal form | `a = b = 1` | `Δ = 1·(1 − 1 − 8 + 36 − 27 − 16) = −15` | true | none |
| 5.2 `exists_representableBy_gammaNaive` (sample, headline) | `B = ∅`; residue char `p ∣ N`; `N = 3` | representing base `∅`; both sides empty; `Spec ℤ[1/3,ζ₃][μ,1/(μ³−1)]` | true; Conrad 3.2.7, 4.1.1(3), 4.2.1(2), `Sch10` 4.3 exact | none |
| 5.3 irreducibility pair | pinned theorems | close with one `have` and one `exact` | already proved | R01 |
| 5.3 contract, statement 1 | affine `Y`, `ℚ̄ ⊂ ℂ` | image of a connected space; pinned lemma `:64` for the converse | not external | R03 |
| 6.1 `KatzMazurQuotientData` (sample) | empty base; `ℚ[x₁, x₂, …]`, `C₂` | singleton fixed by all `H`, hence "nonempty" in `hfree`; `A/B₊A` infinite-dimensional, `hP_ft` needed | discriminates; SGA 1 V 1.1, 1.2, 1.5, 1.8, 1.9, 2.2, 2.3 (`GR02` lines 3634–3849), EGM (4.8), (4.16), `Ryd07` (4.1), (5.4) exact | none |
| 6.5 `j`-line | level three; Legendre | `c₄³/Δ = 9³μ³(μ³+8)³/27(μ³−1)³ = 27u`; `d(ud − d² − 3d − 3) = 1` from `(d+1)³ = ud²` | true | none |
| 7.1 PD-1 to PD-3 (sample) | EGM (10.10), (10.15), (10.16), (4.45), (10.21), (5.18), (5.19) | lines 7176, 7310, 7322, 3355, 7360, 3871, 3879; `V∘F = [p]` | locators exact | none |
| 7.3 PD-6 (sample) | `p = 3, 5, 7, 2` | `H₃ = 1 + t`; `H₅ = t² − t + 1`, both roots `j = 0`; `H₇ = (t+1)(t²+t+1)`, all `j = 1728 = 6`; `H_p(1) = C(p−1, m) ≡ (−1)^m`; `48/24 = 2`; `12/|Aut| = 1, 2, 3` | true; EGM (5.26) line 4017 exact | none |
| `IsSupersingular` (def) | ordinary in char `p`; `p ≠ char k` | identity component of rank `p` plus an étale part, at least two points; `E[p]` étale with the zero section a component | discriminates | none |
| 8.1 `axiomaticRegularity` (headline) | trivial problem; empty problem | rank 1, `Spec W(k)[[T]]` regular of dimension 2; fails Reg. 4A | consistent | none |
| 8.2 (sample) | — | a consumption of Layer 0.9 and 7.4; no numerical claim | read | none |
| 8.6 ST-5 (sample) | `[Γ₁(pⁿ)]` | pair `T, X(P)` in the 5.4 table, Rigid II gives `p = 0` only | consistent with 8.7 item 6 | none |
| 8.7 formal engine (sample, headline) | `v_p C(pⁿ, p^{n−1})`; `n = 0` | `n − (n−1) = 1`, with `pⁿ = 0` gives `p = 0`; `X = 0` cuts out a subgroup over any ring, so `n ≥ 1` needed | true | none |
| 9.1 `[N-Isog]` fibres (sample) | ordinary fibre, level `pⁿ` | `G = G⁰ × G_red`, `G⁰ = μ_{p^a}`, `G_red = p^{n−b}ℤ/pⁿ`: `n + 1` subgroups | true; `Ces15` 4.2.15(b) line 1598 exact | none |
| 9.4 degree of `[Γ₀(N)]` | general `N` | `N²∏(1 − p⁻²)/(N∏(1 − p⁻¹)) = N∏(1 + p⁻¹)` | true | none |
| Layer 10 `w_N` (changed definition) | `(E, C)` | `(E/C)/(E[N]/C) ≅ E`, image of `(E/C)[N]` is `C` | involution | R10 |
| `existsUnique_comp_eq` (0.9) | `ℤ[i][1/2] → 𝔽₅`, `B = ℤ₅`; `A = 0` | unique lift of `i ↦ 2`; no `ψ` exists | true | none |
| `IsStrictlyHenselianLocalRing.tfae` | a field `k` | third clause ⇔ every finite separable extension trivial | true | none |

### Sources read (the seeded sample and the further sources)

- `Ces15` (arXiv:1511.07475v2): 2.2.4, 2.2.7, 2.2.9, 3.3.1, 3.3.2, 4.1.3, 4.2.2, 4.2.3, 4.2.5, 4.2.6, 4.2.7, 4.2.15, 4.3.2, 4.3.5, 4.4.4, 4.5.1, 4.6.4, 5.13, 6.2, 6.3, 6.4, 6.6, 6.7. Proposition 6.4(b) is stated over `ℤ[1/gcd(6,n)]` and its proof over `ℤ[1/n]` has the three steps Layer 6.4 names (`Ces15` lines 2747–2764).
- Conrad, *Arithmetic moduli of generalized elliptic curves* (author's page): 2.2.5, 2.3.1, 2.3.2, 2.3.4–2.3.7, 2.4.1, 2.4.2, 3.1.2, 3.1.8, 3.2.2, 3.2.7, 3.3.4, 4.1.1, 4.2.1, 4.2.3, 4.3.2, 4.3.4. The thresholds `d ≥ 5` and `d ≥ 3` of 4.2.1(2) are as Layer 3.3 reports them.
- EGM draft (author's page): (1.14), (1.15), (3.22)–(3.26), (4.8), (4.16), (4.39), (4.45), (4.46), (5.9), (5.12), (5.18), (5.19), (5.26), (10.10), (10.15), (10.16), (10.21).
- SGA 1 V (`GR02`), Rydh (`Ryd07`: (2.16), (4.1), (4.3), (4.4), (5.4), (6.12)), Kottwitz–Wake (`KW15` §4.1, §4.2), Scholze (`Sch10` 4.3, 6.2), Conrad's Keel–Mori note (1.1, 3.1), Tate–Oort §1, Loeffler (3.3.4, 3.3.6, 3.4.4, 3.7.4, 3.8.1–3.8.3).
- Stacks Project tags read in the text: 00R4, 02KB (by statement), 03BM, 03JE, 04HN, 056Q, 05LB, 062T, 062Y, 06DI, 06LJ, 07NV, 07NY, 0A02 (`STACKS-0A02` line 1571), 0A03 (`STACKS-0A03` line 1639), 0AP3, 0B8U, 0B8V, 0B9D, 0B9E, 0B9F, 0BFD, 0BFG, 0CCJ, 0D3D, 0E62.

### Library declarations opened at the pin (Tau Ceti `2fd255d99`, Mathlib `1b1ccf4b`)

`Morphisms/Smooth/Irreducible.lean:54, 63`; `IrreducibleOfConnectedDomainStalk.lean:398`; `RingTheory/AdicCompletion/LocalRing.lean:52, 58`; `RingTheory/Idempotents/Connected/ScalarExtension.lean:64`; `EllipticCurve/Scheme/Geom/Rigidity.lean:8–11, 109`; `ModularCurve/NaiveLevel.lean:8–17`; `ModularCurve/Regular.lean:136`; `Scheme/ProjModel.lean:252`; `StrictHenselization/Point.lean:257`; `GroupScheme/Kernel.lean:141`; `Geom/Isogeny.lean:123`; `Geom/MulBy.lean:161`; `Scheme/MulBy.lean:473`; Mathlib `AlgebraicGeometry/Morphisms/Smooth.lean:133`. Seventeen locations.

### Cross-roadmap citations resolved on main (`5fc1aa8f`)

- AlgebraicCurves: Layers 7, 8, 9 and 12 at lines 783, 870, 1099, 1468; the exclusion at 1660–1669 (R03).
- EllipticCurves: Layer 3 at 683 with the ordinary/supersingular dichotomy at 716–718; Layer 4 at 793.
- StableReduction: Layer 2 at 405, relative `Proj` at 323. AlgebraicVectorBundles: L0B, L0C, L2A at 351–364, `gradedSymmetricAlgebra` at 115. JacobianChallenge: Layer C at 143, Grauert at 179.
- EtaleCohomologyFoundations §F.3a at 776; SchemeAndStackFoundations 108–120 (R06).
- Labels cited by roadmaps on main (§4D, §0E, §5A, §5B, §1C, §9A, §7C, §4C, §3N, §3D, §0G, §0D, Layer 0d, Layers 0–3, 10): each has a row of the table.
- `citations.md`: the five "Lean names found nowhere" are declared in `Suggested.lean` (lines 459, 491, 534, 549, 731).

### Overlaps and ownership

- #1187 and #1808 conflict with this head in this folder; the description states the order (this pull request first).
- No cited id is dropped by an open pull request, and none is defined only by an open revision.
- Ids dropped here and cited elsewhere: R07.
- Ownership against the open heads given with their files: ModularCurvesPartII, SchemeAndStackFoundations (two open heads), JacobianChallenge and PurityForFlatCohomology are the closest in vocabulary. This roadmap is on main, so each of them cites it; no object here is handed to an open roadmap. No declaration of `Suggested.lean` has the fully qualified name of a declaration in another roadmap's Lean file on main (grep for the six structure and class names `IsStrictlyHenselianLocalRing`, `IsHenselization`, `KatzMazurQuotientData`, `CoarseModuliData`, `ArtinianTestAlgebra`, `EtaleRigidifier`).

## Not verifiable

- Katz–Mazur, *Arithmetic Moduli of Elliptic Curves*: the sources service finds no legal copy. Every KM locator is cited by locator only, including those of the sampled sections 3.6 (4.12, p. 505), 8.6 (5.2.2, 5.3.2, pp. 135–137), 8.7 (5.3.2.1–5.3.6, pp. 138–143) and 9.1 (6.5.1, 6.8.1). In particular the exact hypotheses of the quotient-smoothness theorem of the Notes Added in Proof (pp. 508–509), on which Layers 6.4 and 10 stand, were not read; `Ces15` line 2733 cites it as the "Theorem on p. 508".
- Deligne–Rapoport: resolves only to a paywalled page. DR locators (II.1, III 1.2, IV 3.3–3.10, IV 6.7, VI 1.1, VI 1.2, VI 6.7) are confirmed only as far as `Ces15` and Conrad quote them (IV.3.10(iii) at `Ces15` line 2701, VI.6.7 at line 2724, VI.1.1 at line 1101).
- Not fetched: SGA 3, Katz's *Serre–Tate local moduli*, Lazard, Igusa, Oda, Oort, Mazur, Drinfeld, Buzzard's lecture. None is in the seeded sample except SGA 3 VIIA §3.3 (Layer 0.2), for which EGM (3.22) was read instead.
- Silverman `AEC`: settled as uncertified.
- Loeffler's notes carry no version; the copy read is the one on the author's page.

## Source issues

- none
