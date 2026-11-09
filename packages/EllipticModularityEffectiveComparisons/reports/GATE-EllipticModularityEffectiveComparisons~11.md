# GATE-EllipticModularityEffectiveComparisons~11: answers to the human review of `b3472ae`

This answers one review: CBirkbeck, 2026-11-09T12:43:47Z. It makes five points, numbered here H01–H05:
- H01 is its one finding, F01.
- H02–H04 are its three "Remarks, not findings".
- H05 is its "Source issues" entry.

Other parts of the review:
- Its "Previous findings" section restates F01 (R01) and confirms that R02 was repaired, so it needs no separate answer.
- Its "Not verifiable" entries ask for nothing. The table that lemos-2017 cites as [6, p.98] is not needed: the README locates the seven values at lemos-2017 lines 197–202, and the §5.25 Checks recompute them on explicit curves. The Kenku items stay settled as uncertified.
- The review was read as data. It contains no instruction to the worker beyond its findings, and nothing suspicious was found in it or in the files read.

The repairs are one commit, `c001b88` ("EllipticModularityEffectiveComparisons: review repairs (§5.25 Check: J₀(37) has positive rank; §5.1 redundant noncuspidal dropped)"), on top of `b3472ae`. It changes only `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, by two lines. It is not pushed. `Suggested.lean` is byte-identical to `b3472ae`.

## H01 (CBirkbeck) — answered

The duplication is real and no edit inside this folder removes it. But the merge order does not decide which roadmap owns these objects:
- Neither roadmap names the other as a supplier.
- This roadmap's last supplier is AnabelianGeometryAndNonabelianChabauty, at `ORDER.txt` line 175. The sibling's is ComputationalNumberTheory, at line 265.
- So either roadmap can come first without breaking a supply edge. The present order (sibling at 273, this folder at 283) comes from bulk re-orderings that swapped the pair three times and never recorded an ownership decision.

**What the finding gets right, rechecked at the current heads.**
- EllipticCurveModularityPartII is at `1604bab`. Its README line 7 still reads "this Part II owns the six comparison layers below".
- Its `Suggested.lean` states `NonCM` (line 144), `HasCyclicIsogeny` (line 152), `noncm_prime_isogeny_degrees` (line 165) and `rational_isogeny_j_tables` (line 230). Their bodies match `GeometricallyNonCM`, `CyclicIsogenyDegree`, `non_cm_prime_isogeny_degrees` and `isogeny_j_tables_11_17_37` here.
- Six roadmaps cite the sibling as a supplier (`roadmaps grep --fixed --readme-only`):
  - ErdosProgressionPowers (EC.0–EC.6);
  - FaltingsFinitenessAndIsogenyTheoremsPartII (§6.0f);
  - KatoEulerSystems and RankOneConverse (§6.0e);
  - EllipticCurvePeriodsAndModularParametrizations (§§5.0a–5.0b);
  - AdelicImagesAndModularCurves (README lines 404–405: §§5.0a–5.0b, 6.0b, 6.0f).

  The other hits are substring matches of EllipticCurveModularityPartIIGL2TypeAbelianVarieties, or lists of the sibling as a consumer.
- ErdosProgressionPowers is at `ORDER.txt` line 53, above its own supplier. Its own dependency check prints `moved: ErdosProgressionPowers moved in the merge order from #53 to #273, right after its last supplier EllipticCurveModularityPartII`. So the consumers do point at the sibling, as the review says.

**Why the order does not settle it.**
- This README names the sibling only in Downstream consumers (README line 1707), and the sibling's README does not name this folder.
- The roadmaps named in this README, with their `ORDER.txt` lines:
  - the last supplier is AnabelianGeometryAndNonabelianChabauty, line 175;
  - the sibling, line 273, is named only as a supplier of downstream roadmaps;
  - FaltingsFinitenessAndIsogenyTheoremsPartII, line 365, is a consumer.
- The sibling's latest supplier contract is "From TauCetiRoadmap.Chebotarev and TauCetiRoadmap.ComputationalNumberTheory", and ComputationalNumberTheory is at line 265.
- Positions in `ORDER.txt` (this folder, sibling), by commit:

| Commit | Message | This folder | Sibling | First |
| --- | --- | --- | --- | --- |
| `fc36883c` (10-23) | insert this folder after its last supplier | 160 | 161 | this folder |
| `acbb4745` (10-28) | bulk move "after their last suppliers" | 283 | 226 | sibling |
| `ea2e9977` (10-28) | bulk move "after their last suppliers" | 279 | 372 | this folder |
| `03fc5acb` (10-29) | "repair every upward edge" | 262 | 179 | sibling |
| `0f144b08` (11-08) | "the analytic-number-theory cluster precedes the roadmaps that import it" | 283 | 272 | sibling |
| now (`df9dca82`) | — | 283 | 273 | sibling |

  None of these commits mentions the other roadmap of the pair. The package report (`reports/PKG-EllipticModularityEffectiveComparisons.md`, "Duplication removals and direction of supply") wrote this folder as the earlier owner. It did so because the order then put the sibling immediately after this folder.

**What each option needs.**
- **Close #1810.** Nothing more: the consumers and the present order already use the sibling.
- **Close #1491.** The four consumers in README line 1707 are re-pointed to the counterparts listed there. Owners are found for what only the sibling plans: its §1.8 majorants, the §6.0e rank-zero theorem (the one KatoEulerSystems and RankOneConverse cite), the §6.0f minimal period subvariety, and ErdosProgressionPowers's `FullRationalTwo`. This folder also moves up in the order. Its suppliers allow anywhere after line 175, and no roadmap lists this folder as a supplier.

**Why this folder is not edited.**
- Deleting every target that has a sibling counterpart deletes Layers 0–5, which is the first option, not a repair.
- The other edit available here would point `gap:modular-rank-zero` at the sibling's §6.0e and `gap:quantitative-abelian-periods` at its §6.0f. That would make this folder a consumer of the sibling, fix the order in the first option's direction and rule out the second option. It is left to the decision.

## H02 (CBirkbeck) — answered

The pull-request description is outside this job's files. At `c001b88`, `Suggested.lean` declares 17 theorems and 10 definitions. The definitions are `localTerms`, `martinValue`, `newDimension`, `GeometricTorsion`, `CyclicIsogenyDegree`, `torsionModule` (an instance), `torsionRepresentation`, `GeometricallyNonCM`, `SplitNormalizerImage` and `NonsplitNormalizerImage`. The description should give these counts in place of "fourteen" and "nine".

## H03 (CBirkbeck) — answered

`design/plan.json` is outside this job. Neither file in this folder contains `all-embedding-frobenius`. The README uses seven gap slugs: plan.json's eight without that one. So the intake withdraws that entry.

## H04 (CBirkbeck) — applied

README line 1197: "j(E) is the j-value of a noncuspidal rational point of Y₀(r)" → "j(E) is the j-value of a rational point of Y₀(r)". Two other lines were checked:
- Line 1635 had no such redundancy. Its "noncuspidal rational points" are points of X₀(r), and its sentence about Y₀(r) already reads "a rational point of Y₀(r)".
- Line 1184 keeps "the noncuspidal rational point set Y₀(r)(ℚ) on the smooth projective X₀(r)". There the adjective introduces the notation.

## H05 (CBirkbeck) — answered

The README never used the source's claim, at lemos-2017 lines 193–194, that the Jacobian of X₀(37) has rank zero:
- §5.25's route (line 1635) goes through a nonzero rank-zero new quotient, using a factor with nonzero central value and `gap:modular-rank-zero`.
- The route ends by saying that it uses no rank-zero assertion for the whole Jacobian.

A new Check (README line 1643) now records the counterexample:
- y²+y=x³−x has Δ=37, so it has conductor 37. By modularity it is, up to isogeny, a quotient of that Jacobian.
- It has #E(𝔽₂)=5 and #E(𝔽₃)=7, so its rational torsion is trivial.
- The rational point (0,0) therefore has infinite order, so the Jacobian has positive rank.

## Build, gate and dependency check

- **Build.** `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested` reports "Build completed successfully (9205 jobs)". The only warnings are 17 "declaration uses `sorry`", at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286 and 298.
- **Gate** at `c001b88`:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- **Dependency check** (`--depcheck … --movable`, board order, content checkout at `db5e748`):

      depcheck: 236 roadmaps, 2281 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line for this roadmap. An earlier run in this job printed "237 roadmaps, 2310 edges, 0 problem(s)" on the pre-edit README. Both edits add no roadmap name, so the different totals come from the content checkout between the runs, not from this README.
- **`roadmaps resolve`** on the README lists no cross-roadmap citation and no Lean name found nowhere.

## Lean signatures

`Suggested.lean` is unchanged (`git diff b3472ae -- …/Suggested.lean` is empty). The worker's `signatures.md` therefore gives the current elaborated types: 27 declarations, and none appears to have lost a section binder. The file has no `variable`, `include` or `set_option`. The three statements nearest the edited text were compared with §§5.1 and 5.25, and they match in generality: `exceptional_prime_isogeny_j`, `non_cm_prime_isogeny_degrees` and `isogeny_j_tables_11_17_37`. No new `#check` file was elaborated, because the Lean file did not change.

## Ownership, citations and sources

- **No new object or citation.** Neither edit adds a target, an object or a cross-roadmap citation, so no new ownership question arises. No notion moved down, and no later roadmap is cited.
- **Downstream consumers paragraph (line 1707).** It was rechecked at the current heads: sibling `1604bab`, ErdosProgressionPowers `3e1048c` and AdelicImagesAndModularCurves `9037f3d`. Every section it names exists there: sibling §1.8, §§5.0a–5.0b, §6.0b and §6.0f, and EC.0–EC.6.
- **Open pull requests.** `overlaps.md` lists no open pull request that changes this roadmap and no dropped id. Ownership against the open roadmap pull requests was checked for F01's objects with `roadmaps grep`, as above.
- **Sources.** No new source. The one new locator, lemos-2017 lines 193–194, is in the existing manifest key. `needs-references.toml` was not written.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| New §5.25 Check: the Jacobian of X₀(37) has positive rank | [0,0,1,−1,0] (y²+y=x³−x) | b₂=0, b₄=−2, b₆=1, b₈=−1, so Δ=64−27=37, c₄=48 and j=110592/37. Over 𝔽₂: x=0,1 each give y=0,1, so #E=5. Over 𝔽₃: x³−x=0 for all three x, and y²+y=0 has y=0,2, so #E=7. At (0,0): 0+0=0−0 | torsion has order dividing 7 (the prime 3), and its odd part divides 5 (the prime 2), so it is trivial; (0,0)≠O has infinite order and the quotient has rank ≥1 | Check added |
| The same Check: full torsion is not used at p=2 | [1,20,0,−3,−2], Δ=1156923 (odd) | (−1/4,1/8) lies on the curve, and 2y+a₁x+a₃=1/4−1/4=0, so it is a rational 2-torsion point. Its x has 2-adic valuation −2, so it reduces to O mod 2 | reduction at 2 is not injective on 2-torsion even at good reduction, so the Check uses p=2 only for the odd part | wording of the Check |
| §5.25 route against the Check | rank-zero quotient against the whole Jacobian | the route uses a factor with nonzero central value and says it uses no rank-zero assertion for the whole Jacobian; with rank ≥1, a whole-Jacobian route would fail | consistent | none |
| §5.25 level-37 values, unchanged | [1,1,1,−8,6], [1,1,1,−208083,−36621194] | c₄=385 and Δ=−6125 give j=−9317=−7·11³; c₄=9987985 and Δ=−6125 give j=−162677523113838677=−7·137³·2083³ | match lemos-2017 lines 197–202 | none |
| Pattern scan: other rank-zero claims about modular Jacobians (lines 953–957, 973–1021, 1193, 1635, 1441) | levels 11, 17, 19 and the genus-one levels 14, 15, 20, 21, 24, 27, 32, 36, 49; levels 39, 65, 91, 125, 169 | genus-one levels claim rank zero of the elliptic curve X₀(N) itself (11a, 17a, 19a and the nine are rank-zero curves; X₀(19) has 3 rational points, 2 cusps). Levels 39–169 claim it only for a new quotient whose factors have nonzero central value | no whole-Jacobian rank-zero claim at positive-rank levels | none |
| §5.1 line 1197, wording | r=19 | X₀(19)(ℚ) has 3 points and 2 rational cusps, so Y₀(19)(ℚ)={P₁₉} with j(P₁₉)=−884736=−96³. The curve [0,0,1,−38,90] has c₄=1824, Δ=−6859 and j=−884736 | meaning unchanged: Y₀(r) already excludes cusps | wording |
| Order claim in H01 | `ORDER.txt` at `df9dca82` | AnabelianGeometryAndNonabelianChabauty 175, ComputationalNumberTheory 265, sibling 273, this folder 283, ErdosProgressionPowers 53. This README's highest-placed named roadmap that is not a consumer: line 175. The sibling's: line 265 | both relative orders satisfy every supply edge | none (answer only) |
