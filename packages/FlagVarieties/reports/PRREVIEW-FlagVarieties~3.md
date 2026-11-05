# Review of FlagVarieties (pull request #1762 at 997db0b)

**Verdict:** needs changes

🤖 Independent AI review (full re-review: the folder changed by 345 lines since 670f067). Four findings, one blocking (P2). The gate passes, the dependency check is clean, `Suggested.lean` elaborates with only its two `sorry` warnings and contains no padding, and every supplier gap is now declared in the project's form with a precise one-sentence need. What blocks is a missing hypothesis in headline 1: the Summary and §2.2 classify *all* closed subgroup schemes containing `B`, which is false in characteristic `p` (the Frobenius preimage of `B` is a counterexample the README's own §0.1 Check names). The three P3 notes are residual phantom supplier names, one redundant gap, and shape.

**Status of the previous review's findings (PRREVIEW-FlagVarieties~2 at 670f067).**

| Previous | Passage at 997db0b | Status |
| --- | --- | --- |
| R01 (P1) Layer F1A consumed its own conclusion | README 119–125, §1.1: "every reduced Hopf ideal `I ≤ GeneralLinear.UpperTriangular.definingHopfIdeal k (n+1)` … equals `GeneralLinear.weightParabolicDefiningHopfIdeal k (standardWeight J)` for exactly one `J`"; "The weight-ideal comparison and parabolicity are proved in this layer" | repaired: the layer owns its statement; the abstract `B W_J B` theorem is `gap:tits-standard-parabolic` on ReductiveGroups |
| R02 (P1) gaps written as supplier targets | README 55–77: eleven sentences `What ReductiveGroups must provide (gap:<slug>): …`, each one need with its hypotheses and a Milne locator | repaired in form; three phantom names remain (R02 below, P3) |
| R03 (P2) GL headline absent from `Suggested.lean` | `Suggested.lean` 43–55: `standardWeight` and `exists_unique_standardWeight_eq`; README 121 names both | repaired; elaborates at the pin |
| R04 (P3) two restated pinned lemmas | `Suggested.lean` has three declarations, none a restatement (probe below) | repaired |
| R05 (P3) gate failures | worker's gate: every check 0, `OK` | repaired |
| R06 (P3) shape, narrative, README–Lean agreement | `**Summary.**`, `## Scope and ownership`, `## Conventions`, every layer ends with `### Examples`/`### Dependencies`, Checks attached to §0.1, §0.3, §2.1, §3.1; unused smoothness hypotheses dropped from the Lean theorem; the §3.1 witness now names characteristic 2 | mostly repaired; residue in R04 below |
| R07 (P3) locators | README 303–306: Milne §7.e with Prop. 7.11/7.15 pp. 141–143, Thm. 21.91 pp. 453–454, Conrad–Feng T.1 as statement reference, Cartier cited by name, intersections "in every characteristic", Humphreys marked uncertified | repaired (each locator re-read below) |
| R08 (P3) projectivity owner | README 21, 203–207: ShimuraData §3.8 owns `Par_t(G)`; this roadmap owns "contains a Borel ⇒ `G/H` proper" and the comparison | repaired |

## R01 (P2) — Headline 1 and §2.2 classify every closed subgroup scheme containing `B`; false in characteristic `p`

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:7` ("J ↦ P_J is an order isomorphism from subsets of S to closed subgroup schemes of G containing B") and `:158`–160 (§2.2: "For any closed subgroup Q containing B, classify Q(k) abstractly and recover Q=P_J through 0.1 and 2.1. Export an order isomorphism Set S ≃o {Q : closed subgroup schemes of G | B ⊆ Q}").

**Claim:** For reductive `G` over algebraically closed `k` in any characteristic, every closed subgroup scheme containing `B` is a standard parabolic `P_J`.

**Witness:** `G = SL₂` over `k` of characteristic `p`, `B` upper triangular with ideal `(c)` in `k[a,b,c,d]/(ad−bc−1)`, `F` the Frobenius endomorphism. `H_m = F^{−m}(B)` has ideal `(c^{p^m})`: it is a closed subgroup scheme, `(c^{p^m}) ⊆ (c)` so `B ⊆ H_m`, the `H_m` are pairwise distinct, and none is reduced (`c` is a nonzero nilpotent of `O(H_m)` for `m ≥ 1`). So the poset of closed subgroup schemes containing `B` is infinite while `Set S` has two elements; no order isomorphism exists. The only smooth members are `B = P_∅` and `G = P_S`. The source proves only the smooth statement: Milne Theorem 21.91 (503f1a7d line 18700) reads "every parabolic subgroup `P` of `G` containing `B`", a parabolic being a subgroup *variety* (Definition 17.15, line 14605). The route in §2.2 cannot do more: `HopfIdeal.eq_of_quotientPointsSubgroup_eq` (`HopfIdeal/Points/Separation.lean:84`) needs both quotients reduced, and the README's own §0.1 Check (line 93) says the Frobenius inverse image of a Borel is invisible to points. The Lean form is already right: `exists_unique_standardWeight_eq` carries `[IsReduced (CommHopfAlgCat.quotient … I)]`.

**Repair:** In the Summary write "1. `J ↦ P_J` is an order isomorphism from subsets of `S` to smooth closed subgroup schemes of `G` containing `B`; in characteristic zero, to all closed subgroup schemes containing `B`" (the shape headline 3 already uses), and in §2.2 "For any smooth closed subgroup `Q` containing `B` (any closed subgroup in characteristic zero, by `TauCeti.smoothCommHopfAlgProperty_of_charZero`) …, Set S ≃o {Q smooth closed subgroup scheme | B ⊆ Q}", with the reducedness hypothesis named where `eq_of_quotientPointsSubgroup_eq` is invoked. Add to §2.1's Checks the negative control "in characteristic `p`, `F⁻¹(B) ⊆ SL₂` contains `B`, has the points of `B`, and is no `P_J`; it is excluded by smoothness". Tested: with the smoothness hypothesis the `SL₂` list is `{B, G} ≃ {∅, S}`, and the `GL₃(𝔽₂)` poset below is unchanged.

## R02 (P3) — Three supplier citations name declarations or sections that do not exist where cited

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:183` ("the unconditional `IsBorelOverAlgClosed.exists_conjugate_eq` from `Borel/Conjugacy/Existence.lean`"); `:143` (indented formula `P_J(k) = TitsSystem.standardParabolic J`); `:197` ("Use the ReductiveGroups 7b pointwise normalizer theorem"); `:50` and `:97` (`Smooth/CharZero.lean:145`).

**Claim:** Each cites an existing declaration, file or supplier section.

**Witness:** At Tau Ceti `358314d4` (the pin of both `lake-manifest.json` files) `Algebra/AlgebraicGroup/Borel/` contains `BaseChange, Basic, Conjugation, Existence, Over, Radical, Torus`, no `Conjugacy/` directory, and no declaration named `exists_conjugate_eq` under `IsBorelOverAlgClosed` (the only Borel conjugacy theorem is `exists_conjugate_eq_of_isBorelOverAlgClosed` at `Borel/Conjugation.lean:161`, with `hcontain`). `standardParabolic` occurs nowhere in the pinned `TauCeti/` (the `TauCeti.TitsSystem.standardParabolicOrderIso` that CFSGBasicProperties cites on main is not at this pin either). Main `ReductiveGroups/README.md:732`–779 (Layer 7b) states intersection, transporter and Levi results and no normalizer theorem. `smoothCommHopfAlgProperty_of_charZero` is the theorem at `CharZero.lean:148` (its docstring starts at 145). The gaps `gap:borel-conjugacy-connected` and `gap:parabolic-pointwise-normalizer` already own the first and third needs, so nothing is unowned; the names are phantoms.

**Repair:** Line 183: "Conjugate them inside `P_K` by `gap:borel-conjugacy-connected` applied to the smooth connected group `P_K`". Line 143: write `P_J(k) = B(k) W_J B(k)` and attribute it to `gap:standard-parabolic-scheme`. Line 197: "Use `gap:parabolic-pointwise-normalizer`" (or own it, R03). Lines 50, 97: `:148`.

## R03 (P3) — One gap asks for what §3.1's own bridge proves, and §2.1 both consumes and re-proves `P_J(k) = B W_J B`

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:59` (`gap:parabolic-pointwise-normalizer`), `:195`–199 (§3.2); `:139`–147 (§2.1).

**Claim:** The pointwise self-normalization `N_{G(k)}(P_J(k)) = P_J(k)` must come from ReductiveGroups; §2.1 consumes the supplier equality `P_J(k) = B(k) W_J B(k)`.

**Witness:** The §3.1 bridge (line 183: "`gBg⁻¹` and `B` are Borel subgroups of the connected group `P_K` … conjugate them inside `P_K` … use `N_G(B)(k)=B(k)`") run with `J = K` gives `g ∈ P_J(k)` for every `g` with `gP_Jg⁻¹ = P_J`; Milne Corollary 17.49 (503f1a7d lines 15077–15084) is exactly this argument and concludes `P = N_G(P)`. So the gap asks the supplier for a two-line corollary of a target this roadmap already proves from `gap:borel-conjugacy-connected` and `gap:borel-pointwise-normalizer`. On the `GL₃(𝔽₂)` instance, the normalizers of the four `P_J` have orders `8, 24, 24, 168 = |P_J|`, as both routes predict. In §2.1, line 141 consumes the equality from the supplier (`gap:standard-parabolic-scheme` at line 67 includes "`P_J(k) = B(k) W_J B(k)`") and lines 143–147 then prove the closedness of `⋃_{w∈W_J} B(k)n_wB(k)` here; one owner should be named.

**Repair:** Delete `gap:parabolic-pointwise-normalizer` from the contracts and §3.2's `*Needs:*`; state §3.2 as "for `g ∈ G(k)` with `gP_Jg⁻¹ = P_J`, the bridge of §3.1 with `K = J` gives `g ∈ P_J(k)` (Milne Cor. 17.49, p. 367)", `*Needs:* 3.1`. In §2.1 either keep the equality as the supplier's (then cut lines 143–147 to a one-sentence remark that the supplier's proof goes through constructibility) or own it here and remove the clause from `gap:standard-parabolic-scheme`.

## R04 (P3) — Shape, Checks and README–Lean agreement

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:21` ("its Hopf-ideal prototype in `Suggested.lean`"), `:79`–81 (`## How to read the build`), `:119`–125 (§1.1, no `**Checks.**` for `standardWeight`), `:85`–95 (§0.1, one Check), `:297` (`## References and proof route`), `:306` ("its paywalled text was not checked here"); `Suggested.lean:10`–12 and `:36`.

**Claim:** The README has the TauCetiRoadmap form and every Lean name appears in it.

**Witness:** `conjugate_eq_of_borel_le` occurs nowhere in the README (grep); the rule is that every Lean name appears there. `standardWeight` is a definition with its four `n = 2` values in prose and no `**Checks.**` list (three discriminating Checks are the floor: for instance that `standardWeight ∅` and `UpperTriangular.weights 3 = (2,1,0)` generate the same ideal although the vectors differ, that `n = 0` gives the single zero weight, and that `J ≠ J'` forbid different adjacent pairs). §0.1's order embedding has one Check. "How to read the build" describes `Suggested.lean` ("a `sorry` is used only for a genuine proof obligation") instead of the layer order and what each layer delivers; "was not checked here" is process narrative. The Lean docstring's title is "Suggested interfaces for flag varieties" rather than "<title>: target signatures", and the namespace is `TauCeti.FlagVarieties` rather than `TauCetiRoadmap.FlagVarieties` (a `TauCeti.*` namespace is the library's).

**Repair:** Name `conjugate_eq_of_borel_le` at line 21; add a `**Checks.**` list to §1.1 (the three above) and two more to §0.1 (inclusion of `B` in `P_{s₁}` reflects `8 ∣ 24` on `𝔽₂`-points; a nonreduced ideal with the points of `B`, as in R01, is not detected); rewrite "How to read the build" as one paragraph on Layers 0–6; `## References`; "Humphreys is cited by locator only (uncertified)"; retitle the docstring and rename the namespace.

## Verified sound

**What was read.** The whole README (306 lines) and `Suggested.lean` (68 lines) at 997db0b2; the worker's gate, change set, citations and signature files; the previous review. Pins: Tau Ceti `358314d4`, Mathlib `f6090c70` in the worktree's `lake-manifest.json`, and the same Tau Ceti revision in the content checkout's manifest. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FlagVarieties'` is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only (`sources.toml` deleted). No LaTeX delimiters, process ids, pull-request numbers, `set_option`, sorry'd data, `lemma`, algorithms or copied passages (checked against the two readable sources).

**Gate and dependency check.** Worker's gate: every counter 0, `OK`. The dependency check run as instructed (`--movable`, candidate order, main content) printed exactly

```text
depcheck: 204 roadmaps, 1657 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. FlagVarieties is at position 104 of the candidate order, directly after ShimuraData (103), its only open-pull-request supplier. The suppliers resolve: ReductiveGroups on main (Layer 3 line 234, 3A line 249, 7 line 627, 7C line 634, 7C.5 line 682, 7b line 732; 7C.5 owns the type-A block-parabolic flag and Grassmannian maps and the covering of `G` by the `B n_w B` through generation by `B` and negative simple root groups; 3A.2 says "no representability theorem for `G/H` is a premise", so `gap:orbit-map-quotient` and `gap:homogeneous-quotient-scheme` are not already planned there); SchubertGeometry on main (Conventions: right quotients `G/P−` with `B−`; S1 items 1–5 incidence and typeA conventions; S2 item 3 the subword/Bruhat criterion); SchemeAndStackFoundations on main (Layer 0 at line 463, §1.1 descent at line 2071); ShimuraData §3.8 at its open head ("represented by a smooth proper `S`-scheme `Par_t(G)` … projective when `S` is affine … the orbit map `gP ↦ gPg⁻¹` identifies `G/P` with `Par_t(G)` … parabolics are self-normalizing"); GroupSchemesOverABase GS7.2 at its open head (`G/B ≅ Bor(G)`), cited only as an owner, never in a `*Needs:*` line.

**Declared gaps.** Eleven, all under `### From TauCetiRoadmap.ReductiveGroups`, each one sentence with hypotheses. Precision and minimality: `borel-conjugacy-connected` (the pin's `Borel/Conjugation.lean:161` has `hcontain`; `UpperTriangular/Borel.lean` is `GL_n` only), `borel-pointwise-normalizer`, `tits-system-of-points`, `tits-standard-parabolic` (no `standardParabolic` at the pin; `TitsSystem/Basic.lean:50` has `simple : Set (N/(B∩N))` and `Bruhat/Basic.lean:100, 170` the cells only), `standard-parabolic-scheme`, `parabolic-predicate` (the only `IsParabolic` at the pin is `Matrix.IsParabolic` on `PSL(2,ℝ)`), `homogeneous-quotient-scheme` (`Fppf/Quotient/Homogeneous/Basic.lean:216` is the sheaf, no representability), `complete-borel-quotient`, `borel-fixed-point-scheme`, `orbit-map-quotient`: each matches its Milne locator's hypotheses (table below). `parabolic-pointwise-normalizer` is redundant with §3.1 (R03). No gap has supplier `none`; no dependency is written as supplied that is a gap (the three phantom names of R02 sit beside declared slugs). The brief records no `design/plan.json`; the `plan.json` side of the slugs is the board's to add at intake, as the previous review noted.

**Elaboration and signatures.** `lake env lean TauCetiRoadmap/FlagVarieties/Suggested.lean` from the worktree: exit 0, two warnings (`sorry` at lines 49 and 59), 5.6 s. The worker's `#check @name` audit covers all three declarations and I compared each elaborated type with the README: `standardWeight : {n} → Set (Fin n) → Fin (n+1) → ℤ` matches line 121; `exists_unique_standardWeight_eq` carries `[Field k] [IsAlgClosed k]`, `I ≤ definingHopfIdeal k (n+1)`, `[IsReduced …]` and concludes `∃! J : Finset (Fin n)` (line 121, "reduced", "exactly one"); `conjugate_eq_of_borel_le` carries `[IsAlgClosed k]`, geometric connectedness of `G`, `IsBorelOverAlgClosed`, `P ≤ B`, `Q ≤ B`, `Q = P.conjugate g` (Scope line 21: "uses only geometric connectedness of the ambient finite-type group"); nothing lost. One-tactic probe on a scratch copy: `simp` makes no progress on the GL theorem; `simp_all` leaves `P = P.conjugate g` and `exact (HopfIdeal.conjugate_one P).symm` is a type mismatch on the Borel theorem; neither closes, so no padding. The five value checks of `standardWeight` on `Fin 2` and `Fin 0` elaborated (`ext i; fin_cases i <;> simp [standardWeight]`). No Lean process left running.

**Pinned declarations opened** (file and line at Tau Ceti `358314d4`): `HopfIdeal.IsBorelOverAlgClosed` `Borel/Basic.lean:148` (`IsAlgClosed k ∧ Minimal (IsBorelCandidate k H) I`; candidate = smooth, geometrically connected, geometrically solvable quotient, `:82`); `HopfIdeal.exists_conjugate_eq_of_isBorelOverAlgClosed` `Borel/Conjugation.lean:161` (`hcontain`); `HopfIdeal.le_of_quotientPointsSubgroup_le`, `eq_of_quotientPointsSubgroup_eq` `HopfIdeal/Points/Separation.lean:58, 84` (finite type and reduced quotients as instance hypotheses, on the smaller subgroup for `le`); `CommHopfAlgCat.quotientPointsSubgroup_antitone` `Points/Order.lean:55`; `HopfIdeal.conjugate`, `conjugate_one` `HopfIdeal/Conjugation.lean:66, 96`; `CommHopfAlgCat.pointConjugation_mem_conjugate_iff` `:292`; `GeneralLinear.weightParabolicRelationSet`, `weightParabolicDefiningHopfIdeal` `Weight/Parabolic/Basic.lean:54, 143` (generated by `X_ij` with `w i < w j`); `GeneralLinear.UpperTriangular.weights`, `definingHopfIdeal` `UpperTriangular/Basic.lean:66, 112` (`w i = n−1−i`; the Borel ideal is the weight ideal of `weights`); `glTitsSystem` `Diagonal/TitsSystem.lean:195` (needs `[Nontrivial kˣ]`); `smoothCommHopfAlgProperty_of_charZero` `Smooth/CharZero.lean:148`; `CommHopfAlgCat.fppfHomogeneousQuotient` `Fppf/Quotient/Homogeneous/Basic.lean:216`. Duplication by object: no subset-indexed block weight exists at the pin (`GeneralLinear/Weight/*` has only `w : Fin N → ℤ`-parametrised `weightParabolic*` and `weightLevi*` declarations), so `standardWeight` is new; nothing in `Suggested.lean` restates a pinned lemma.

**Ownership against open work.** `roadmaps grep` over main and the 441 open heads: "projective homogeneous" occurs only here and in ShimuraData §3.8 (the compact dual, which consumes `Par_t(G)`); "unique standard (parabolic|representative|member)" and `G/P_J` only here; the five board packages under review are unrelated. FlagVarieties is the owner of the Borel-containment, conjugacy-type, homogeneous-space and equivariant-morphism classifications; ShimuraData §3.8 owns `Par_t(G)` and is cited; nothing was moved.

**Source audit: the seeded sample (14 targets) and the flagged locators.** Texts: Milne, *Algebraic Groups* (2017), author page, cache id 503f1a7d, printed page = marker page − 12; Conrad–Feng, *Reductive Groups over Fields* (version of 5 December 2020), author page, cache id a0caf508. Humphreys and Bourbaki: see Not verifiable.

| # | Target | Locator read | Conclusion |
| --- | --- | --- | --- |
| S01 | 0.1 Closed subgroups and rational points | `Separation.lean:58, 84`; `CharZero.lean:148` | hypotheses as stated; Cartier correct, line number off by 3 (R02) |
| S02 | 0.2 Native conjugation and quotient comparison | `Conjugation.lean:66–118, 292`; Milne Prop. 5.22 line 4545 (p. 104); Prop. 7.15 line 6061 (p. 142) | laws exist; universal map and fibre comparison as cited |
| S03 | 0.3 Homogeneous orbit comparison | Milne Prop. 7.11 line 6036 (p. 141), §7.e lines 6031–6100 | orbit map faithfully flat iff quotient; smooth-stabilizer hypothesis is the README's |
| S04 | 1.1 Classification by block weights | Milne Thm. 21.91 lines 18691–18701 (pp. 453–454); pin `Parabolic/Basic.lean:143` | statable, true with `IsReduced`; values below |
| S05 | 2.1 Algebraic realization | Milne Thm. 21.91 proof lines 18704–18717 (p. 454) | concentrator/Bruhat-union construction; README's constructible route sound (row 9) |
| S06 | 2.2 Standard classification | Milne 21.91 line 18700; Conrad–Feng T.1 lines 13449–13457 (p. 305) | "parabolic subgroup containing B": smooth only (R01); inclusion-preserving bijection |
| S07 | 3.1 Standard representative | Milne Thm. 17.9(b) line 14526 (p. 354); Cor. 17.49 proof lines 15077–15084 (p. 367); Conrad–Feng T.1 line 13453 | route matches the source; T.1 is a statement reference as the README says |
| S08 | 3.2 Pointwise normalizers | Milne Thm. 17.48 line 15049, Cor. 17.49 line 15075 (p. 367) | `N_G(P) = P` for `P ⊇ B`; derivable from 3.1 (R03) |
| S09 | 4.1 Containing a Borel implies properness | Milne Thm. 17.9(a) line 14525 (p. 354); Thm. 17.16 proof lines 14610–14612 (p. 356); Thm. 7.18 line 6102 (p. 143: `G` smooth affine, `H` any algebraic subgroup) | properness descends along surjective `G/B → G/H`; gap hypotheses match |
| S10 | 4.2 Projectivity implies containing a Borel | Milne Cor. 17.3 lines 14471–14484 (p. 353: `G` smooth connected, `X` complete nonempty); Thm. 17.16 lines 14613–14615 | fixed point `xP`, `x⁻¹Bx ⊆ P`; gap hypotheses match |
| S11 | 4.3 Classification of projective homogeneous varieties | assembly of S03, S07, S10; Milne Def. 17.15 line 14605 | sound with smooth stabilizers (row 18) |
| S12 | 5.1 Evaluation at the base point | Milne Prop. 5.22 lines 4545–4552 | unique equivariant map from an `H`-fixed point; fixed iff `g⁻¹Pg ⊆ Q` (row 22) |
| S13 | 5.2 Standard parabolics | Milne 17.48/17.49 as S08 | unique `B`-fixed coset (row 13) |
| S14 | 6.1 Model comparisons | enumeration below; pin `UpperTriangular/Basic.lean:66` | values agree |

**Adversarial values.** Finite computations are an independent enumeration of `GL₃(𝔽₂)` (168 elements) in a scratch script, with `P_J` the block upper triangular group of `standardWeight J`, `A = P_{{0}}` (stabilizer of the plane `⟨e₀,e₁⟩`), `C = P_{{1}}` (stabilizer of the line `⟨e₀⟩`), `B = P_∅`.

| Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| 01. Standing scope (3, 13) | trivial group; `Gₘ`; `SL₂` | `S` has 0, 0, 1 elements; labels 1, 1, 2; spaces: point; point; `ℙ¹` and point | consistent |
| 02. Hopf-ideal order (27) | `GL₂`, `B ⊂ G` | `I(G) = 0 ⊂ (X₁₀) = I(B)`; `P ≤ B` in Lean means `V(P) ⊇ B` | `OrderDual` direction right |
| 03. Left cosets (32) | `S₃`, `H = ⟨(12)⟩`, `g = (123)` | `gH = {(123),(13)}`, `Hg = {(123),(23)}`; `QuotientGroup.leftRel`: `x⁻¹y ∈ H` | `gH` is the pinned convention |
| 04. `standardWeight` (121; Lean 43) | `n = 2`, `J = ∅, {0}, {1}, univ`; `n = 0` | `(0,−1,−2)`, `(0,0,−1)`, `(0,−1,−1)`, `(0,0,0)`; constant `0` | elaborated examples pass; README agrees |
| 05. Weight ideal vs Borel ideal | `UpperTriangular.weights 3 = (2,1,0)` vs `standardWeight ∅ = (0,−1,−2)` | both have `w i < w j` iff `i > j`: same relation set | `hIB` is the right carrier |
| 06. `∃!` uniqueness | `J = {0}` vs `{1}`, `n = 2` | forbidden adjacent pair `(2,1)` resp. `(1,0)`; generators differ | injective |
| 07. Headline 1, nonreduced control (R01) | `SL₂`, char `p`, `H_m = F^{−m}(B)` | ideals `(c^{p^m})`, all `⊆ (c)`, pairwise distinct; `|{Q ⊇ B}| = ∞` vs `|Set S| = 2` | smooth hypothesis required; char 0 fine by Cartier |
| 08. §2.1 orders (147) | `GL₃(𝔽₂)`, four `J` | `|P_J| = 8, 24, 24, 168`; `|W_J| = 1, 2, 2, 6` | matches |
| 09. §2.1 Bruhat union | `J = {0}` | cells of sizes 8 and 16, union 24 = `|A|` | union is the parabolic |
| 10. §2.2 order isomorphism | four subsets | `8 < 24, 24 < 168`; `A ⊄ C`, `C ⊄ A` | same poset both sides |
| 11. §2.2 intersection and join | `A, C` | `|A ∩ C| = 8 = |B|`; ideal sum `(X₂₀,X₂₁)+(X₁₀,X₂₀) = I(B)`; `|⟨A,C⟩| = 168`, `|A ∪ C| = 40` | join is generated, not the union |
| 12. §3.1 witness (189) | `g = [[1,0,0],[1,1,0],[0,1,1]]` | `g e₁ = e₁+e₂`; `g⁻¹e₁ = e₁−e₂+e₃ = e₁+e₂+e₃` in char 2; `gStab⟨e₁⟩g⁻¹ = Stab⟨e₁+e₂⟩` (enumerated) | directions differ as stated |
| 13. §3.2 normalizers | four `P_J` on `𝔽₂` | `|N(P_J)| = 8, 24, 24, 168 = |P_J|` | self-normalizing; R03 |
| 14. `conjugate_eq_of_borel_le` (Lean 59) | `P = Q = B`, `g` unipotent; `P = B, Q = G`; `P = Q = G`; constant `S₃` with `B = 1`, `P = ⟨(12)⟩`, `Q = (23)P(23) = ⟨(13)⟩` | first two: `hconj` false; third: true; `S₃`: every hypothesis but connectedness holds and `P ≠ Q` | connectedness necessary and present; holds for nonreduced `G` through `G_red` |
| 15. §0.1 nonreduced control (93) | `μ_p` vs `1`; `F⁻¹(B)` vs `B` | same points; lengths `p` vs 1; `c^p = 0` vs `c = 0` | reducedness in `Separation.lean:84` needed |
| 16. §0.3 stabilizers (103) | `GL₂` on `ℙ¹` at `[e₁]`; Frobenius-twisted `SL₂` | `c = 0`, dim 3; `c^p = 0`, nonreduced | smooth-stabilizer hypothesis of headline 4 necessary |
| 17. Headline 3 (9) | `SL₂`: `H = B, G, T`; `H = F⁻¹(B)` | (parabolic, proper, projective) = (t,t,t), (t,t,t), (f,f,f); `G/F⁻¹(B)` proper with `H` nonsmooth | smooth hypothesis necessary, present |
| 18. Headline 4 (10) | `SL₂` on `ℙ¹`, base points `[1:0]`, `[0:1]`; on a point | stabilizers `B`, `nBn⁻¹`, both type `∅`; `H = G`, type `S` | independence of `x` is conjugacy |
| 19. §4.1 descent (203) | `SL₂/B ⊂ ℙ¹`; `GL₂/T ⊂ ℙ¹×ℙ¹` | image all of `ℙ¹`; misses the diagonal, not closed | properness needs the Borel |
| 20. §4.2 fixed point (217) | `B` on `ℙ¹`; `Gₘ` on itself | `{[e₁]}`; `∅` | hypothesis prevents the false case |
| 21. Headline 5 and §5.2 | `P_J`-fixed cosets of `G/P_K` on `𝔽₂`, rows `K = ∅,{0},{1},S` | `[1,0,0,0]; [1,1,0,0]; [1,0,1,0]; [1,1,1,1]` = `[J ⊆ K]`; `B`-fixed count 1 on each | all 16 directions |
| 22. §5.1 evaluation (241) | `SL₂`, `P = Q = B`, `g = e, n`; `Gₘ`, `P = Q = 1` | `g⁻¹Bg ⊆ B`: true, false; `Gₘ`-equivariant endomorphisms `x ↦ xa` | no false uniqueness for `Q = 1` |
| 23. §6.1 small `n` (273) | `GL₁` (`n = 0`); torus | `Fin 0`, one `J`, weight `0`, `P = G`, a point; `S = ∅` | endpoints consistent |
| 24. `glTitsSystem` hypothesis | `k = 𝔽₂` | `kˣ` trivial; instance fails | GL Tits system only for `|k| > 2`; alg. closed `k` fine |
| 25. ShimuraData `Par_t` (205) | `SL₂`, `P = B` | `Par_t = ℙ¹ = SL₂/B` | same object, earlier owner |

The nonabelian `S₃` row (14) and the cyclic `Gₘ` rows (20, 22) were tried; `p = 2` enters rows 07–13, 15–17, 21; the only inverses taken are of invertible matrices.

**Headline inventory.**

| Headline | README | In `Suggested.lean` | Statable at the pins |
| --- | --- | --- | --- |
| 1. `J ↦ P_J` order isomorphism | 7, §2.2 | `GL_{n+1}` form `exists_unique_standardWeight_eq` | general `G`: no (no Tits system on `G(k)`, no `P_J`); docstring says so |
| 2. unique standard conjugate | 8, §3.1 | uniqueness half `conjugate_eq_of_borel_le` | existence half needs the parabolic predicate and `P_J`; docstring says so |
| 3. parabolic ⇔ projective | 9, §4.2 | no | needs a represented quotient scheme; docstring says so |
| 4. projective homogeneous varieties | 10, §4.3 | no | needs the quotient and stabilizer comparison; docstring says so |
| 5. equivariant morphisms ⇔ `J ⊆ K` | 11, §5.2 | no | needs `G/P_J` schemes; docstring says so |

## Not verifiable

- **Humphreys, *Linear Algebraic Groups*:** paywalled; not in the sources cache (the only Humphreys text there is *Reflection Groups and Coxeter Groups*, df121192). Sections §§11–12, 17.6, 19, 21–23, 24–28, 29.1–29.3, 30.1 are cited by locator alone (uncertified); their numbering was not checked.
- **Bourbaki, *Lie*, Ch. IV §2.5 Theorem 3** (in `gap:tits-standard-parabolic`): paywalled; not in the cache. Cited by locator alone.
- **ShimuraData §3.8 and GroupSchemesOverABase GS7** were read at their open heads through the roadmap service; their own acceptance is not this review's.
- **`plan.json`:** no design or package exists on the board for this roadmap, so the `gaps` list that the intake reads could not be compared with the README's slugs.

## Source issues

- **Misprint** in Milne 2017 (503f1a7d) at Proposition 7.15, printed p. 142: the smooth/finite clause names the morphism `G/H' → G/H` for `H ⊆ H'`; it should be `G/H → G/H'`; affects a stated result.
- **Misprint** in Milne 2017 (503f1a7d) at Corollary 17.49 proof, printed p. 367: Borel conjugacy inside `P°` is credited to 17.10, which is conjugacy of maximal tori; it should be Theorem 17.9(b); affects the proof.
