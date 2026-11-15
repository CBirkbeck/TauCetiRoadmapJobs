# Review of SmallRamificationAndAbelianVarietyBaseCases (pull request #970 at 62c25a3)

**Verdict:** accepted

Incremental re-review of the 37 lines changed since `92d13bb`, plus the pull request's title and description. No finding.

## Previous findings

- R01 — repaired: `Suggested.lean:125` “`variable {F : Type*} [Field F] [Finite F] [TopologicalSpace F] [DiscreteTopology F]`”; no `Fintype` remains in the folder; the gate's `statement-hygiene` is 0.
- R02 — repaired: description, summary block: “abelian varieties with good reduction everywhere over ℚ, ℚ(i), ℚ(√−3) or ℚ(√5) have dimension zero”; “over the quadratic fields, Raynaud's uniqueness and Fontaine's different bound first determine the finite flat p-groups”.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| Scope (`README.md:35–39`): `δ(E)` against the Galois mean slope | `E = ℚ₃(∛3)`, closure M of degree 6 | `d(E) = v(3π²) = 5`, `δ = 5/3`; `d(M) = 2·5 + 1 = 11`, slope `11/6`; supplier §3.3 Check has `11/6` | Values as stated; the two differ for non-Galois E |
| §1.1 jump sum = integral of PadicExtensionFamilies §2.3 (`README.md:296–311`) | tame Galois, index e, residue degree f; `ℚ₃(√3)` | integral: `(1 − 1/e)·1`; jump sum: `(1/e − 1/(ef))·0 + (1 − 1/e)·1`; both `1/2` for `ℚ₃(√3)` | Agree; supplier formula with `E = M` gives `[M:K](1 − 1/|G^u|)` |
| §1.1 `δ(E)` = supplier `galoisMeanSlope` for Galois E | `c = f·d`, `n = ef` | supplier: `c(M/K)/[M:K] = fd/(ef) = d/e`; here: `d/e` | Equal when `M = E` |
| §1.1 local-to-global formula imported from PadicExtensionFamilies §§7.1–7.3 (`README.md:326–337`) | `ℚ(√−3)`; cubic subfield of `ℚ(ζ₉)`; `ℚ` | `3^{1/2} = √3`; `81^{1/3} = 3^{4/3}`; empty product `1` | Supplier §7.1 gives `rootDiscr F` for Galois F, §7.2 the local identity, §7.3 the product |
| §5.0b local component (`README.md:1870–1875`) | indecomposable 2-dimensional local representation at `v ∤ p`: reducible, irreducible | reducible indecomposable: special; irreducible: supercuspidal; both square-integrable | Now agrees with §5.0c (`README.md:1963`) |
| `tate_no_levelOne_char_two`, `serre_no_levelOne_char_three`, `not_isLevelOneResidual_of_mem_two_three_five_seven` (changed binder) | elaborated types at this head | each carries `[Field F] [Finite F] [TopologicalSpace F] [DiscreteTopology F]` and its `CharP`; conclusions unchanged | README “F finite and discrete” (`:833`) matches |

The rows for untouched statements stand as in the previous review, of `92d13bb`.

- Gate at `62c25a3`: every check 0, `build=0`, `outside-folder=0`, `stray-files=0`: OK. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check: `depcheck: 245 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD or CYCLE line. PadicExtensionFamilies is on main and does not cite this roadmap.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `declaration uses sorry` warnings (lines 61, 72, 98, 143, 148, 153, 188, 209, 233, 236, 239, 242, 245) and nothing else. The only Lean change is the binder on line 125; the predicates `IsUnramifiedAt`, `IsOdd`, `IsLevelOneResidual` do not mention finiteness and the three theorems keep it, so the headline list and the one-tactic probe stand as at `92d13bb`.
- Cross-roadmap citations resolved for the changed passages: 4, all on main (PadicExtensionFamilies `README.md:863` §2.3, `:1157` §3.3, `:1990–2069` §§7.1–7.3; its Check at `:1186` for `ℚ₃(∛3)`).
- Source locators: the diff changes none; no target of the seeded sample (1.2, 1.3, 1.4, 1.6, 3.1, 3.2, 3.4, 3.5, 4.3, 4.4, 4.6, 4.8, 5.1, 5.11, 6.1) falls in a changed passage. The Carayol and Snowden locators beside the reworded sentence of §5.0b are unchanged.
- Pull request text: title and description agree with the head (the roadmap is added, six layers at `README.md:231–2585`; Fontaine over the four fields at `Suggested.lean:209–211`; Schoof's five pairs, `Suggested.lean:233–245`; characteristics 2, 3, 5, 7 at `:153`; consumers R26.1, R26.5, R33.4 at `README.md:13`; weight fourteen in characteristic eleven at `:2457`; folder holds `README.md`, `Suggested.lean`, `metadata.toml`; nothing changed outside it).
- Overlap check: read ClassicalSerreModularity, PotentialModularityAndCompatibleSystems, EllipticCurveModularityPartIIGL2TypeAbelianVarieties, FiniteFlatGroupsAndIntegralPadicHodgeTheory, GL2ModularityLifting, ClassicalArithmeticCompletion, PadicExtensionFamilies, AnalyticNumberTheoryPartI; the Galois mean slope, its integral and the Galois root-discriminant product are owned by PadicExtensionFamilies §§2.3, 3.3, 7.1–7.3 and cited here; `δ(E) = d/e` for arbitrary finite `E/ℚ_p` is owned here (PadicExtensionFamilies §0.3 has the mean `m`, with `δ = 1 − 1/e + m`, and no `d/e`); the other owners stand as at `92d13bb`.
- Source independence: 3 passages compared with 0 sources (changed passages only; they cite a sibling roadmap, not a source, and share no run of words with its §§2.3, 3.3, 7.2 beyond formulas); arrangement not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- none in the changed passages; the four items of the review of `b7abeaa` (Odlyzko's displayed formulas, Bosch–Lütkebohmert–Raynaud and Neukirch–Schmidt–Wingberg, Carayol, Dieulefait–Pacetti Definition 1.10) concern untouched text and stand.

## Source issues

- none

## For the human reviewers

- none
