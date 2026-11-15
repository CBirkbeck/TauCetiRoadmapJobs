# Review of EllipticCurveModularityImaginaryQuadratic (pull request #1048 at 3a57165)

**Verdict:** needs changes

Incremental re-review of the 139 lines changed since `d07b13b` (README only; `Suggested.lean` unchanged), plus the pull request's title and description against this head. One finding, P3; the gate fails on it.

## R01 (P3) — TeX subscript braces outside a code span in §5.1 (gate `tex`)

**Location:** `TauCetiRoadmap/EllipticCurveModularityImaginaryQuadratic/README.md` lines 1478–1480: "with u a generator of 𝔽_p^× has projective order p−1, and in the supersingular case a generator of 𝔽_{p²}^× has image of order (p²−1)/(p−1)=p+1 in PGL₂(𝔽_p)".

**Claim:** the passage added by the repair of the previous R02 is in house style.

**Witness:** gate at this head, re-run: `tex=1 … FAIL`, `tex: line 1480: of 𝔽_{p²}^× has image of order …`. The rule refuses `_{` outside code spans; lines 310 and 424 carry `_{` inside code spans and pass.

**Repair:** write the two groups as code spans without braces: "with u a generator of `𝔽_p^×` has projective order p−1, and in the supersingular case a generator of `𝔽_(p²)^×` has image of order (p²−1)/(p−1)=p+1 in PGL₂(𝔽_p)". The replacement contains neither `_{` nor `^{`, so the rule that refused line 1480 has nothing to match; the mathematics is unchanged.

## Previous findings

- R01 — repaired: lines 1484–1486 and 1505–1506 now cite "Hermite's theorem, Mathlib `NumberField.finite_of_discr_bdd` in `Mathlib.NumberTheory.NumberField.Discriminant.Basic`"; the two auxiliary names are gone; `#check` succeeds at the pin.
- R02 — repaired: lines 1476–1480 cite "FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.2–R07.5.3, built on R07.5.1"; the `*Needs:*` line (1504–1505) and supplier row (153) carry them; row 147 drops §2.3. The new sentence introduced R01 above.
- R03 — repaired: lines 1946–1951 and 2097–2099 name PotentialAutomorphyInfrastructure §2.26 `corrected_rank_two_large_image` with FaltingsFinitenessAndIsogenyTheorems R28.6.2–R28.6.3 as a sufficient input; Scope (46–48) says why the all-but-finitely-many form is owned here.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.1 route, exceptional images, as now cited from R07.5.2–R07.5.3 | p = 5, 7, 11; ordinary case (b) and (c) of R07.5.2 | projective orders p−1, p+1: (4, 6), (6, 8), (10, 12); maximal element orders of A₄, S₄, A₅: 3, 4, 5. p = 5: 4 ≤ 5, not excluded; p = 7: 6 > 5 | "once p≥7" is sharp; in case (c) the image `(* *; 0 1)` of order p(p−1) still contains `diag(u,1)` | R01 (style only) |
| §5.1 route, supersingular element | generator of the non-split Cartan, p = 7 | Cartan cyclic of order p²−1 = 48, scalars of order p−1 = 6, quotient order 48/6 = 8 = p+1 | agrees with R07.5.3(c) (cyclic of order p²−1, e = 1) | none |
| §5.1 Hermite input `NumberField.finite_of_discr_bdd` | k = ℚ, S = {2, 3} | quadratic fields ℚ(√d), d ∈ {−1, ±2, ±3, ±6}: 7 fields, absolute discriminants 4, 8, 8, 12, 3, 24, 24 ≤ 24 | finite set inside `{K : |discr K| ≤ N}.Finite` with N = 24 | none |
| §7.2 alternative supplier (PotentialAutomorphyInfrastructure §2.26) | non-CM E; `y²=x³−x` over ℚ; d = 2, p = 101 | non-CM: over every finite k′, `V_ℓ` semisimple with commutant ℚ_ℓ, so irreducible: strongly irreducible. CM curve: reducible over ℚ(i), §2.26 not applicable, as it must be. Bound 2dp/(p²−1) = 404/10200 < 1 | density-one set minus the primes ≤ max{100, 2d+1} is nonempty; §2.26 gives `SL₂(F_l)` over the normal closure, the group §7.2 uses | none |
| `nonCM_elliptic_large_residual_primes` (§5.1, `Suggested.lean` l.88), cited by the changed text | elaboration at the pins | type as in the previous review: geometric non-CM hypothesis, `∃ N, ∀ p prime, N < p → ∀ b g, ∃ σ, …`; warning `declaration uses sorry` only | statement untouched and equal to the README's | none |

The rows for the untouched statements stand as in the previous review, of `d07b13b`.

- Gate, re-run at this head: `set_option=0 blob=0 latex=0 tex=1 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL` (the worker's run also has `build=0`); the one failure is R01.
- Dependency check: `depcheck: 241 roadmaps, 2266 edges, 0 problem(s)`; no UPWARD or CYCLE line. Merge order: PotentialAutomorphyInfrastructure 199, this roadmap 201, ModularityAndLanglandsExtensions 203. No file changed outside the folder.
- Elaboration of `Suggested.lean` with `lake env lean`: three `declaration uses sorry` warnings (lines 45, 73, 88), nothing else. The diff changes no Lean statement, so no one-tactic probe was re-run.
- Library declaration opened at the pin: `NumberField.finite_of_discr_bdd` (`Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:494`), `∀ (A) [Field A] [CharZero A] (N : ℕ), {K | |discr K| ≤ N}.Finite`.
- Cross-roadmap citations of the changed passages resolved at the open heads: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.1 (its line 7578), R07.5.2 `ordinaryTorsionInertia` (7612), R07.5.3 `supersingularTorsionInertia` (7647); PotentialAutomorphyInfrastructure §2.26 `corrected_rank_two_large_image` (1124–1126: strongly irreducible rank-two weakly compatible system, density-one set, normal closure, no regularity hypothesis); FaltingsFinitenessAndIsogenyTheorems R28.6.2 (2696), R28.6.3 (2724); ModularityAndLanglandsExtensions §2.18 (1121–1124, uses the finite exceptional set of §5.1).
- Regrouped headings: thirteen former `###` subsections (3.3, 4.2, 4.4, 5.3, 6.2–6.4, 6.6, 7.2, 7.4, 8.2, 8.3, 8.5) are now run-in labels with their numbers kept; every internal "§k.n" and the section citations from EllipticCurveModularityTotallyReal, HeegnerPointEulerSystems, ModularityAndLanglandsExtensions and AdelicImagesAndModularCurves still resolve (`roadmaps resolve` on the first two: none found nowhere); no internal anchor points at a renamed heading. The nine new group-intro sentences were read against the sections they point to (§§3.1, 4.4, 5.2, 5.3, 6.3–6.6, 7.4, 8.1–8.6) and agree with them.
- Source locators falling in the changed groups, re-read in the cached text: OpenAI Lemma 4.4 p.9 (`openai line 376`), Lemma 7.1 p.16 (`662`), Corollary 7.6 p.20 (`832`), Lemma 8.1 p.21 (`881`), Lemma 9.2 p.25 (`1100`).
- Pull request title and description against this head: every sentence of the summary block and of the prose checked (endpoint and its local assertions, README 11–23; `switch_five`, `switch_three`, README 777–783; seed without modularity over ℚ, 162–165; consumers, 2386–2404; three Lean theorems and one definition; build and dependency claims); none contradicted, no unstated removal, renumbering or supplier change.
- Overlap check: read EllipticCurveModularityTotallyReal, PotentialModularityAndCompatibleSystems, ModularityAndLanglandsExtensions (scope and their citations of this roadmap); nothing shared: the first imports Layers 1–4, §0.2 and §8.1 by name, the third consumes §§0.2, 0.3, 5.1, 5.3. The other two lists are empty.
- Source independence: changed passages only; 12 passages (nine group intros, three repaired passages of §§5.1 and 7.2) compared with 1 source (`openai`), none shared, longest common run three words in a heading; largest share `openai`, 38 of 58 parenthesised locators; contents not compared again (the diff adds, removes or reorders no layer); Serre's text could not be read.
- Remark on untouched text: the layer titles and order run parallel to the most-cited source's sections (Layers 3–8 ↔ §§4–9, Layers 1–2 ↔ §3); the regrouping of this change merges subsections so that Layers 4 and 6–8 no longer match that source's subsections one to one.

## Not verifiable

- Serre, Invent. Math. 15 (1972), DOI `10.1007/BF01405086`, §4.2 Théorème 2 p.294 and Propositions 11–12 behind R07.5.2–R07.5.3: paywalled, no legal copy in the cache; cited by locator.

## Source issues

- none

## For the human reviewers

- Scope: the source with 38 of 58 locators, and of the headline `imaginary_quadratic_modularity`, is a preprint dated 4 October 2026 held in a GitHub repository (README References, first entry); the README gives no journal reference for it.
- Licence: that preprint is read from `github.com/openai/math` at a fixed revision; the repository's licence was not read in this review.
- Arrangement: this incremental round did not compare the layers with that preprint's contents again; by number, Layers 3–8 ↔ its §§4–9 in the same order, Layers 1–2 ↔ §3, Layer 0 has no counterpart.
- Not tested: Serre 1972 could not be read; the wording of §5.1's route was not compared with it.
