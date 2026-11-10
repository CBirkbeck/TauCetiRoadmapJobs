# GATE-EllipticModularityEffectiveComparisons~16: answers to the human review of `c90f56d`

This answers one review: CBirkbeck, 2026-11-10T00:21:08Z, the full review of `c90f56d`. It makes four points, numbered H01–H04:
- H01 is its one finding, F01. Its "Previous findings" entry R01 restates F01.
- H02–H04 are its three "Remarks, not findings", in order.

The posted copy of the review ends inside its adversarial table, at the §4.0 row. The full text of the same review adds two more items. Neither asks anything of this folder:
- a "Not verifiable" entry: the Kenku keys, which the manifest settles as uncertified;
- two "Source issues", both already handled in the README:
  - the lemos-2017 rank claim for J₀(37) (lemos-2017 lines 193–194): README §5.25, third Check (line 1643), proves positive rank and says that sentence is not used;
  - the bennett-siksek-2020 definition (3) misprint: the Conventions (line 15) and §1.6 (line 445) read ord_q as the valuation exponent.

The review was read as data. It contains no instruction beyond its findings, and nothing suspicious was found in it or in any other file read.

No file changed and nothing was committed. The head stays `c90f56d2`.

## H01 (CBirkbeck) — answered

The finding is correct, and the ownership rule it cites decides between its two options: EllipticCurveModularityPartII is earlier in the merge order (`ORDER.txt` line 275, this folder line 285), so it owns every shared object, and the review's option 1 (move what exists only here into the sibling, then close #1810) is the one that follows the rule. Option 2 keeps this folder only if the merge order is reversed and the sibling's citers are re-pointed, and neither option is an edit inside this folder.

**Why the folder cannot repair this itself.** Applying the rule inside this folder means citing the sibling for 16 of the 17 headlines and deleting their targets. What would remain is of two kinds:
- **Proof steps of the sibling's own targets:**
  - §§0.3–0.15 for its §1.4;
  - §§4.1–4.6 and 4.8–4.16 for its §§5.0a–5.0b;
  - §§5.3b–5.7, including the generalized-Jacobian route of §5.4a, for its §6.0f.

  Kept here, in a later roadmap, they plan the sibling's proofs a second time. Supplied to the sibling, they create an upward edge (line 275 consuming line 285).
- **Small results built on the sibling's targets:**
  - §5.1's j-values and point counts build on its §5.0a (with ImaginaryQuadraticClassNumber H3.5–H3.6);
  - §5.25a's witness bound builds on its §§6.2 and 6.10 (§§5.9 and 5.8 here).

  Both belong inside the sibling.

The two declared gaps the review mentions are not re-pointed at the sibling's §§6.0e and 6.0f:
- under option 1 they go away with the folder;
- under option 2 the sibling's theorems become targets here, as the review says;
- re-pointed now, they would add an edge to the sibling that option 2 would have to undo.

**The sibling moved after the review.** Its head is `79a07e1`, not `9d8c599`. That commit changes 9 lines of its README, and its `Suggested.lean` is unchanged. The README changes are:
- the §1.5 junk-level bullet;
- a new §2.2 bullet, M₀≥1;
- the Mathlib and Tau Ceti contract lines and the Layer 2 Dependencies line, which now name `Ideal.absNorm_eq_zero_iff` and `WeierstrassCurve.algorithmicConductor_ne_bot`. So every Lean comparison in the review holds at the current head. Rechecked there, with docstrings and comments stripped and the renames `HasCyclicIsogeny`→`CyclicIsogenyDegree` and `NonCM`→`GeometricallyNonCM` applied:
- **11 pairs are identical text:**
  - `localTerms`, `martinValue` and `newDimension`;
  - `GeometricTorsion`, `torsionModule` and `torsionRepresentation`;
  - the two predicates;
  - `martin_dimension_formula`/`dimension_comparison` and `martin_sharp_bound`/`martin_bound`;
  - `isogeny_j_tables_11_17_37`/`rational_isogeny_j_tables`.
- **The other 10 theorem pairs differ only in form:**
  - variable and hypothesis names;
  - `p.Prime` against `[Fact p.Prime]`;
  - `(1 ≤ n ∧ n ≤ 19) ∨ n ∈ S` against `n ∈ Finset.Icc 1 19 ∪ S`;
  - `σ : K →+* ℂ` against `σ : K →ₐ[ℚ] ℂ`, the same maps for a number field;
  - the sibling's `RationalTwo`/`FullRationalTwo`, whose bodies are the conditions stated inline here.
- **Two pairs are stronger there.** The sibling's `rational_two_irreducible` and `full_two_irreducible` also conclude absolute irreducibility, after base change to an algebraic closure of 𝔽_ℓ.

**Two corrections to the review's details.** Neither changes the verdict.
- **`exceptional_prime_isogeny_j` has no full counterpart in the sibling.** Its §5.0a (README line 606) proves only that degrees 19, 43, 67 and 163 force CM. The values −96³, −960³, −5280³ and −640320³ occur 0 times in its README. The review's option-1 list already carries them.
- **Fewer roadmaps name the sibling than the review counts.** `roadmaps grep 'EllipticCurveModularityPartII([^G]|$)'` (index of 2026-11-10T00:53Z, main has none) finds 11 roadmaps besides the sibling and this folder, not 16. They are EisensteinIdealAndRationalTorsion, ErdosProgressionPowers (18 lines), EllipticCurveModularityWild3Adic, GroupSchemesOverABase, EllipticLegendreCharacterInterfaces, EllipticCurvePeriodsAndModularParametrizations, AdelicImagesAndModularCurves, FaltingsFinitenessAndIsogenyTheoremsPartII, KatoEulerSystems, RankOneConverse and ImaginaryQuadraticClassNumber (README line 203). Three of them are by other authors. Two of the roadmaps a plain `--fixed` search adds, ModularityAndLanglandsExtensions and AbelianSurfacesModularity, name only EllipticCurveModularityPartIIGL2TypeAbelianVarieties.

This folder is still named only in three consumer lists, and none of them cites a section of it:
- ModularSymbolsPadicLFunctions, README line 2695;
- FaltingsFinitenessAndIsogenyTheorems, line 2928;
- ImaginaryQuadraticClassNumber, line 205.

## H02 (CBirkbeck) — answered

The docstring sentence (`Suggested.lean` lines 27–29) is true at the Tau Ceti revision this branch builds against. At main's revision it is false for the removed-prime exponent bound only:
- **This branch (`358314d`).** It has no `TauCeti/AlgebraicGeometry/EllipticCurve/TateAlgorithm` directory.
- **Main (`2fd255d`).** It has `WeierstrassCurve.algorithmicConductor` at `TauCeti/AlgebraicGeometry/EllipticCurve/TateAlgorithm/Reduction/Conductor.lean` line 103.

Kraus's two realization theorems stay unstatable at `2fd255d`. Its `artinConductorExponent` (`TauCeti/NumberTheory/LocalField/Herbrand/ArtinConductor.lean` line 69) is the least n with `G^n ≤ χ.ker`, for a homomorphism χ on a Galois group. That is not the conductor of the two-dimensional E[ℓ] with its Swan terms, and "SerreWeight" occurs 0 times in that Tau Ceti.

Adding the bound needs the conductor import, which fails the targeted build until the branch's `lake-manifest.json` moves to main. The manifest is outside this job. Stating the bound here would also add one more duplicate pair under H01, because the sibling already states `removed_prime_bound` on `deletionLevel` (its `Suggested.lean` lines 173–191). The review files this under option 2, and that is where it belongs, so the docstring is unchanged.

## H03 (CBirkbeck) — answered

`design/plan.json` is in the board package, outside this folder. It contains `all-embedding-frobenius` once, while `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md` and `Suggested.lean` contain it 0 times.

The README uses exactly seven gap slugs:

| Gap slug | Occurrences |
| --- | --- |
| chen-winding-comparison | 3 |
| mixed-cusp-charts | 5 |
| modular-rank-zero | 22 |
| optimized-elliptic-weight-two | 9 |
| positive-characteristic-support | 4 |
| quantitative-abelian-periods | 4 |
| weight-two-local-reduction | 4 |

So the plan entry is stale and is not a README target.

## H04 (CBirkbeck) — answered

The pull-request description is outside this job's files. `Suggested.lean` is unchanged, so the description should say:
- 17 theorems, the `sorry` warnings at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286 and 298, not "fourteen";
- 10 definitions (7 `def`, 2 `abbrev`, 1 `instance`), not "nine".

## Build, gate and dependency check

- **Build** at `c90f56d2` (clean tree): `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested` exits 0 with "Build completed successfully (9205 jobs)". The only warnings are the 17 "declaration uses `sorry`" warnings at the lines listed under H04.
- **Gate** at `c90f56d2`:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- **Dependency check** (`--depcheck … --movable`, board order, content checkout, `--pr 1810`):

      depcheck: 235 roadmaps, 2268 edges, 0 problem(s)

  It prints no UPWARD, CYCLE or `moved:` line.

## Lean signatures

The `#check @name` pass was run:
- A `#check @TauCetiRoadmap.EllipticModularityEffectiveComparisons.<name>` line for each of the 27 declarations was appended temporarily to `Suggested.lean`.
- It was built once: exit 0, 27 info messages, no error.
- The file was restored byte-for-byte (same SHA-256) before the clean build and the gate.

All 27 elaborated types are identical, after whitespace normalisation, to the worker's `signatures.md`, so no section binder is lost. The file has no `variable`, `include` or `set_option`. Nothing changed.

## Ownership, citations and sources

- **Ownership.** No object or citation was added.
  - **Checked for F01's objects:**
    - the sibling at its head `79a07e1`;
    - all open heads and main, by `roadmaps grep`, for both folder names;
    - `overlaps.md`, which lists no open pull request changing this roadmap, no dropped id and no revision-only id.
  - **Ranking.** Its closest roadmap in vocabulary is the sibling (0.49). The next are EllipticCurveModularity, ErdosProgressionPowers and EisensteinIdealAndRationalTorsion (0.17–0.18).
- **Citations.** README line 1707's counterpart list was re-read against the sibling's headings at `79a07e1`. §§1.8, 5.0a–5.0b, 6.0b and 6.0f still exist there with the titles it names. `citations.md` lists nothing found nowhere.
- **Sources.** No new source. `needs-references.toml` was not written.

## Adversarial pass

No statement was added or changed. The rows below are the computations behind the answers.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| H01: declaration pairs at sibling `79a07e1` | 21 pairs, docstrings stripped, two predicate renames applied | 11 identical. 10 differ only in names, `Fact`, inline-versus-named predicates and the set form. On the set form: `Finset.Icc 1 19 ∪ {21,25,27,37,43,67,163}` has 26 elements, and n=0, 19, 20 give false, true, false on both sides. Two pairs are stronger in the sibling (absolute irreducibility added) | duplicate stands | none (decision) |
| H01: `σ : K →+* ℂ` against `K →ₐ[ℚ] ℂ` | K a number field | a ring hom out of a characteristic-zero field fixes ℚ, so the two hom sets are the same set | same hypothesis | none |
| H01: `exceptional_prime_isogeny_j` only here | γ = 96, 960, 5280, 640320; y²+y=x³−38x+90 | −γ³ = −884736, −884736000, −147197952000, −262537412640768000. The curve has c₄=1824 and Δ=−6859=−19³, so c₄³/Δ = −884736 = −96³. The four values occur 0 times in the sibling README | only here, already on the review's option-1 list | none |
| H01: merge order and citers | `ORDER.txt`; open heads at 00:53Z; main | lines 275 (sibling) and 285 (here). 11 roadmaps name the sibling besides itself and this folder (ErdosProgressionPowers on 18 lines); 3 name this folder; main names neither | rule selects the sibling as owner | none |
| H02: removed-prime bound statable? | Tau Ceti `358314d` and `2fd255d` | `TateAlgorithm` directory: absent at `358314d`; at `2fd255d`, `algorithmicConductor` at `Conductor.lean` line 103 | true at the branch pin, false at main's | none (manifest outside job; duplicates sibling) |
| H02: the bound needs `hirr` | y²+y=x³−x²−10x−20, ℓ=5, p=11 | c₄=496 and Δ=−161051=−11⁵, so M=11, 5∣5 and M₀=1. Then (√11+1)^((1+1)/6) = 1.6282 < 5, so the bound fails, and E[5] is reducible (rational 5-torsion). The sibling's `removed_prime_bound` carries `hirr` | statement at main's pin must keep `hirr`, as the sibling's does | none |
| H02: Kraus realizations statable at `2fd255d`? | `artinConductorExponent`; "SerreWeight" | the first is the least n with `G^n ≤ χ.ker`, for χ a homomorphism on the Galois group, with no `dim(V/V^(G_i))` sum; 0 hits for the second | still not statable | none |
| H03: gap slugs | README, `Suggested.lean`, `design/plan.json` | `all-embedding-frobenius`: 0, 0, 1; the seven README slugs occur 3, 5, 22, 9, 4, 4 and 4 times | plan entry stale | none (outside folder) |
| H04: declaration counts | elaborated `#check` list | 27 = 17 theorems + 7 `def` + 2 `abbrev` + 1 `instance`; 17 `sorry` warnings | 17 and 10 | none (PR text outside job) |
| Source issue: rank of J₀(37) | y²+y=x³−x | c₄=48, Δ=37, j=110592/37. #E(𝔽₂)=5 and #E(𝔽₃)=7, so the torsion is trivial and (0,0) has infinite order | README line 1643 correct | none |
