# GATE-EllipticModularityEffectiveComparisons~12: answers to the human review of `c001b88`

This answers one review: CBirkbeck, 2026-11-09T16:25:23Z. It makes five points, numbered here H01–H05:
- H01 is its one finding, F01.
- H02–H04 are its three "Remarks, not findings". H04 is also the line-1184 note in its "Verified sound" section.
- H05 is its "Source issues" entry.

Other parts of the review:
- Its "Previous findings" entry (R01) restates F01.
- Its "Not verifiable" entries ask for nothing. The README locates the seven j-values at lemos-2017 lines 197–202 and does not cite the table lemos-2017 calls [6, p.98]. The Kenku keys stay settled as uncertified.
- The review was read as data. It contains no instruction to the worker beyond its findings, and nothing suspicious was found in it or in any file read.

The repairs are one commit on top of `c001b88`: `ba802e5` ("EllipticModularityEffectiveComparisons: review repairs (Y₀(r)(ℚ) and Y_s⁺(p)(ℤ) defined at first use, redundant noncuspidal dropped)"). It changes two lines of `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`. It is not pushed. `Suggested.lean` is byte-identical to `c001b88`.

## H01 (CBirkbeck) — answered

The finding is correct. At the sibling's head `ac022ff9`, all 17 theorems of `Suggested.lean` have a counterpart there, either a Lean statement or a README target (table below). No edit inside this folder carries out either option, so the decision stays with a human.

The point "a concession gives no reason the finding is wrong" is right: no such reason exists. Under the ownership rule the earlier roadmap in `ORDER.txt` is the owner, so the sibling (line 275) owns these targets and this folder (line 285) must cite them. Applying that rule here deletes every target in the folder, which is option 1 done by an empty pull request. Option 2 needs the sibling closed and the order changed. Both are actions outside this folder.

**The two roadmaps compared, at this head and at the sibling's `ac022ff9`.**
- The sibling's README line 7 still reads "this Part II owns the six comparison layers below".
- The layers correspond as follows:
  - Layer 0 here is the sibling's §§1.1–1.4.
  - Layer 1 here is its Layer 2.
  - Layer 2 here is its §§1.5–1.7.
  - Layer 3 here is its Layers 3–4.
  - Layer 4 here is its Layer 5.
  - Layer 5 here is its Layer 6.
- Theorem by theorem:

| Here (`Suggested.lean` line) | Sibling at `ac022ff9` | Relation |
| --- | --- | --- |
| `martin_dimension_formula` (83), `martin_sharp_bound` (88), with `localTerms`, `martinValue`, `newDimension` | `dimension_comparison` (99), `martin_bound` (104) and the same three definitions | bodies identical apart from the theorem names (diff of lines 53–94 here against 69–110 there) |
| `newform_integral_of_small_primes` (97) | `rationality_of_small_prime_coefficients` (175) | same target, §3.2 there |
| `integral_ideal_sturm` (108) | `integral_sturm_congruence` (186) | same target, §4.2 there |
| `kraus_prime_power_congruence` (122) | README §4.3, filtered-form paragraph | README target there |
| `four_divisible_isogeny_realization` (139) | README §4.6 | README target there |
| `prime_cyclic_isogeny_degrees` (186), `rational_cyclic_isogeny_degrees` (192) | `prime_isogeny_degrees` (213), `cyclic_isogeny_degrees` (225) | same lists |
| `rational_two_uniform_irreducibility` (198), `full_two_uniform_irreducibility` (205) | `rational_two_irreducible` (246), `full_two_irreducible` (239) | the sibling's add absolute irreducibility |
| `exceptional_prime_isogeny_j` (243) | README §5.0a, "degrees 19,43,67,163 force geometric CM" | the sibling has no j-values −96³, …, −640320³ |
| `non_cm_prime_isogeny_degrees` (252), `GeometricallyNonCM` (215), `CyclicIsogenyDegree` (158) | `noncm_prime_isogeny_degrees` (219), `NonCM` (198), `HasCyclicIsogeny` (206) | bodies identical token for token |
| `split_normalizer_exclusion` (259) | README §6.0f (Bilu–Parent–Rebolledo on X₀⁺(pᵐ)) | the sibling's Lean docstring calls the theorem not statable; here it is stated in moduli form |
| `proper_image_nonsplit` (267), `cyclic_isogeny_integral_j` (277), `lemos_uniform_surjectivity` (298) | `nonsplit_of_not_surjective` (276), `lemos_integral_j` (284), `lemos_surjectivity` (293) | same targets; the nonsplit predicates differ in carrier, cyclic subgroup of order p²−1 here and subfield of order p² there |
| `isogeny_j_tables_11_17_37` (286) | `rational_isogeny_j_tables` (257) | bodies identical up to the predicate name |

**What each option involves at the current heads** (this adds to GATE~11's account).
- **Close #1810.** Three other roadmaps list this folder by name, and each list would then name a closed roadmap. Each list is a downstream-consumers list, not a supply edge:
  - ModularSymbolsPadicLFunctions (#968) README line 2695;
  - FaltingsFinitenessAndIsogenyTheorems (#1004) line 2928;
  - ImaginaryQuadraticClassNumber (#1914) line 205.

  Some content here is absent from the sibling and would have to move into the sibling's pull request to be kept:
  - the §5.1 point counts and j-values of Y₀(r)(ℚ) at r=19, 43, 67, 163;
  - the finer proof decompositions of Martin's bound (§§0.3–0.15), of Mazur's theorem (§§4.1–4.6), of Kenku's levels (§§4.8–4.15) and of the split-Cartan theorem (§§5.3b–5.7). The sibling plans the last of these in one paragraph, §6.0f at its README line 806, which covers the modular-unit integrality, the height bounds and the Gross-vector criterion.
- **Close #1491.** ErdosProgressionPowers (`3e1048c`) names the sibling 18 times and this folder 0 times. Its EC.0–EC.6 and the other consumers in README line 1707 would be re-pointed. Owners are still needed for what only the sibling has:
  - its §1.8 majorants;
  - §6.0e rank zero;
  - the §6.0f minimal period subvariety;
  - the removed-prime Lean statements `norm_bound`, `removed_prime_bound` and `deletionLevel` (README targets only here, Layer 1);
  - `FullRationalTwo` and `RationalTwo`.

## H02 (CBirkbeck) — answered

The pull-request description is outside this job's files. At this head `Suggested.lean` declares 17 theorems and 10 definitions, so the description should say seventeen and ten in place of "fourteen" and "nine":
- definitions: `localTerms`, `martinValue`, `newDimension`, `GeometricTorsion`, `CyclicIsogenyDegree`, `torsionModule` (an instance), `torsionRepresentation`, `GeometricallyNonCM`, `SplitNormalizerImage`, `NonsplitNormalizerImage`;
- theorems: the 17 build warnings at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286 and 298.

## H03 (CBirkbeck) — answered

`design/plan.json` is outside this job. Neither file in this folder contains `all-embedding-frobenius` (0 matches in each). The README uses seven gap slugs, which are plan.json's eight without that one, so the intake withdraws that entry:
- chen-winding-comparison;
- mixed-cusp-charts;
- modular-rank-zero;
- optimized-elliptic-weight-two;
- positive-characteristic-support;
- quantitative-abelian-periods;
- weight-two-local-reduction.

## H04 (CBirkbeck) — applied

README line 1184: "prove that the noncuspidal rational point set Y₀(r)(ℚ) on the smooth projective X₀(r) consists of exactly one point P_r" → "prove that Y₀(r)(ℚ), the set of noncuspidal rational points of the smooth projective X₀(r), consists of exactly one point P_r". Y₀(r) first appears in the README on this line, so the clause is now a definition, not a redundant qualifier.

The same defect was at line 1275, the first and only use of Y_s⁺(p): "every prime p>3 and integral noncuspidal point P∈Y_s⁺(p)(ℤ)" → "every prime p>3 and every P∈Y_s⁺(p)(ℤ), the set of noncuspidal rational points of X_s⁺(p) with integral j-invariant".
- This is bilu-parent-rebolledo's meaning. Line 328 states Theorem 3.1 for P∈Y_split(p)(ℤ). Line 686 applies it once j(P)∈ℤ is known.
- Line 1305 needs no change. It has a noncuspidal point of X₀⁺(p²) and a point of Y₀(p²) above it.

## H05 (CBirkbeck) — answered

This is already recorded at `c001b88`. The §5.25 Check at README line 1643 gives the counterexample to lemos-2017 lines 193–194: y²+y=x³−x has Δ=37, trivial torsion and the point (0,0) of infinite order, so J₀(37)(ℚ) has positive rank. The §5.25 route (line 1635) uses a rank-zero new quotient and says it uses no rank-zero assertion for the whole Jacobian. So the source error does not reach the roadmap, and nothing further was changed.

## Build, gate and dependency check

- **Build.** `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested` reports "Build completed successfully (9205 jobs)". The only warnings are 17 "declaration uses `sorry`", at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286 and 298.
- **Gate** at `ba802e5`:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- **Dependency check** (`--depcheck … --movable`, board order, content checkout at `1bea835`):

      depcheck: 235 roadmaps, 2261 edges, 0 problem(s)

  It prints no UPWARD, CYCLE or `moved:` line for this roadmap.
- **`roadmaps resolve`** on the README lists no cross-roadmap citation and no Lean name found nowhere.
- **Diff scope.** `git diff c001b88` touches only the README, 2 lines. `git diff --stat origin/main...HEAD` lists only the folder's three files.

## Lean signatures

`Suggested.lean` is unchanged (`git diff c001b88 -- …/Suggested.lean` is empty), so the worker's `signatures.md` is current: 27 declarations, none with a dropped section binder. The file has no `variable`, `include` or `set_option`. No new `#check` file was elaborated, because no declaration changed.

The four declarations that F01 compares were read against README §§5.1 and 5.25 and against the sibling's bodies, as in the H01 table: `GeometricallyNonCM`, `CyclicIsogenyDegree`, `non_cm_prime_isogeny_degrees` and `isogeny_j_tables_11_17_37`.

## Ownership, citations and sources

- **No new object or citation.** The two edits add no target, no object and no cross-roadmap citation. No notion moved down, and no later roadmap is cited.
- **Ownership against the open pull requests** was checked for F01's objects: the sibling checkout at `ac022ff9` and `roadmaps grep --fixed --readme-only 'EllipticModularityEffectiveComparisons'`. The only second owner is the sibling. `overlaps.md` lists no open pull request that changes this roadmap, no dropped id and no revision-only id.
- **Sources.** No new source. The H04 wording rests on bilu-parent-rebolledo lines 228–236, 328 and 686, which are in the existing manifest key. `needs-references.toml` was not written.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Line 1184: Y₀(r)(ℚ) defined as the noncuspidal rational points of X₀(r) | r=19, 43, 67, 163; misreading Y₀ as X₀ | genus 1+μ/12−ν₂/4−ν₃/3−ν∞/2 with μ=r+1, ν₂=0 (r≡3 mod 4), ν₃=2 (r≡1 mod 3), ν∞=2 gives g=1, 3, 5, 13. At r=19, X₀(19)(ℚ) has 3 points and 2 rational cusps, so Y₀(19)(ℚ)={P₁₉} with j=−884736=−96³. Read as X₀(19)(ℚ), the count would be 3, not the table's 1 | the definition is needed and consistent with the table and with Check line 1205 (3−2=1) | wording |
| Line 1275: Y_s⁺(p)(ℤ) = noncuspidal rational points of X_s⁺(p) with integral j | p=5, 17; j=0; j=1/2; p=3 | RHS at p=5 is 48.0329 and at p=17 is 83.7895, matching Checks lines 1281–1282. j=0: height 0 ≤ 48.03. j=1/2 is not integral, so it is excluded, as Check line 1283 requires. p=3 fails p>3 | holds. bilu-parent-rebolledo line 328 gives Y_split(p)(ℤ), lines 235–236 define Y as X without its cusps, line 686 applies the theorem once j(P)∈ℤ | wording |
| The same definition, both inclusions | ℚ-point P of Y with j(P)∈ℤ; ℤ-point of Y | the integral model is proper over ℤ, so P extends to a ℤ-section. Its j-image is the ℤ-point j(P) of ℙ¹, which avoids ∞ at every prime, so the section avoids j⁻¹(∞), the cusps. Conversely a ℤ-point of Y maps under j to 𝔸¹(ℤ)=ℤ | equality of sets | none |
| H01: coverage of the 17 theorems by the sibling | the diff of Martin's declarations; definition bodies at sibling lines 198, 206 against 215, 158 here; the j-table bodies | Martin's block differs only in two theorem names. `NonCM`=`GeometricallyNonCM` and `HasCyclicIsogeny`=`CyclicIsogenyDegree` token for token. The seven j-values are equal: −24729001, −32768, −121, −297756989/2, −882216989/131072, −162677523113838677, −9317 | 17 of 17 have counterparts; 4 are README-only there, one weaker there (§5.0a without the j-values) | none (decision) |
| H01: merge order | `ORDER.txt` | ErdosProgressionPowers 53, ModularCurvesPartII 71, AnabelianGeometryAndNonabelianChabauty 176, ComputationalNumberTheory 267, sibling 275, this folder 285 | the sibling is earlier, so it is the owner under the rule | none (decision) |
| H02: declaration counts | grep of `Suggested.lean` declarations | 17 `theorem`; 10 definitions (7 `def`, 2 `abbrev`, 1 `instance`); 27 in all, as in `signatures.md` | description outdated | none (outside job) |
| H05: §5.25 Check line 1643 | [0,0,1,−1,0] | b₂=0, b₄=−2, b₆=1, b₈=−1; Δ=−8(−8)−27=37; c₄=48, so 37∤c₄; #E(𝔽₂)=5, #E(𝔽₃)=7; torsion trivial; (0,0)≠O | positive rank; Check correct | none |
