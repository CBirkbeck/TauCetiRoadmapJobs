# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at b9f5936)

**Verdict:** accepted

This is an incremental re-review of the 6 lines changed since e7b134f. The diff changes three ILO14 locators in `README.md` and leaves `Suggested.lean` unchanged.

- R02 and R03 are repaired exactly as requested. The new Conventions page range is also correct.
- R01 (double ownership of §§6.11, 6.12, 7.1 and 7.3 with PurityForFlatCohomology) is still open in PurityForFlatCohomology. The repair reply marks it "Not actionable in this package", and that reason holds, so it is settled here (see below).
- The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with `sorry` as the only warning.

**For the human approver.** The R01 repair still has to be made in PurityForFlatCohomology before either pull request merges. Its latest board review accepted head d3f15fd without asking for it. The merge order also lists PurityForFlatCohomology first (`ORDER.txt` line 220, versus line 390 for this roadmap).

## Findings

None.

## Previous findings

- R01 — not repaired, settled: `README.md:23` makes this roadmap the owner of §§5.6–5.7, 6.3, 6.9, 6.11, 6.12, 7.1 and 7.3. PurityForFlatCohomology at d3f15fd still states §1.4 (`:1107`) and §1.5 (`:1160`). The reply to PRREVIEW~22 (H01) marks this "Not actionable in this package", with a correct reason (below).
- R02 — repaired: `README.md:826` now reads "(ILO14, Exposé XIII, Théorème 1.1.1(i), p. 195 (printed), proved in §2 (2.1–2.2, via Théorème 2.2.2), pp. 195–197 (printed); ILO14 lines 9260, 9288, 9331; …)".
- R03 — repaired: `README.md:1112` now reads "… Définitions 1.2.3.1, 1.3.1, 1.4.1 and Remarque 1.4.2, pp. 259–263 (printed); ILO14 lines 12346, 12427".

## Verified sound

### Why R01 is settled

The repair reply to PRREVIEW~22 says: "Not actionable in this package: every edit the finding asks for is in PurityForFlatCohomology's README". The reason holds, for three reasons:

- **R01 asked for no change here.** Its repair listed four edits, all in `TauCetiRoadmap/PurityForFlatCohomology/README.md`, under the words "no edit in this folder". This folder already has the ownership that repair assumes (`README.md:23`, and the consumer line `:1656`).
- **There is no repair in this folder.** The only possible one is to give §§6.11–7.3 to PurityForFlatCohomology, which would not remove the double owner. PurityForFlatCohomology §1.4(a) (`:1111`) and (b) (`:1114`) state Gabber's affine Lefschetz theorem and the dualizing property with no supplier: they "are the substance of this target" (`:1133`). Those are this roadmap's §§5.6–5.7 and 6.3/6.9, which are built on its Layers 0–4.
- **The sibling has not moved.** `gh pr view 1840` reports head d3f15fd, the checkout read here. Its `:206–207` and `:3471–3472` still say this roadmap "is to import" §§1.4–1.5. Its *Needs* line at `:1201` cites its own §1.5. PRREVIEW-PurityForFlatCohomology~13 accepted that head and never mentions this roadmap.

PRREVIEW~22 tested R01's repair: after edits 3–4, PurityForFlatCohomology moves to just after this roadmap and the dependency check reports `0 problem(s)`.

### Gate, dependency check, build and diff (run on this head)

- **Gate.** `tauceti-roadmap gate … --base origin/main` printed the line below and exited 0. The worker's `gate.md` adds `build=0`.

  `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check.** With `--movable --pr 1743`, the full output is: `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Build.** `lake env lean` on `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/Suggested.lean` exited 0 in 31 s. Its only warnings are nine "declaration uses `sorry`", at lines 84, 107, 200, 244, 281, 301, 316, 339 and 361, the same lines as in PRREVIEW~22.
- **Diff.** `git diff e7b134f9 b9f59364 --stat` shows `README.md | 6 +++---` and nothing else. The outside-folder diff against `origin/main` is empty, and the gate reports `outside-folder=0`.
- **Binders.** I elaborated one scratch file that imports the module and runs `#check @` on all 12 declarations. For each one, the instance binders and named hypotheses match the signature in this round's elaborated-signatures listing. (Two apparent mismatches were the `⊗[…]` notation read as a bracket.) The Lean file is unchanged, so nothing else changed.

### The three changed locators, read in ILO14 (arXiv v1)

| README line | Cited | What the source has at that place | Verdict |
| --- | --- | --- | --- |
| `:33` Conventions | XVII §§1–3, pp. 258–280; line 12339 | §1 opens at line 12319, under running head "258" (line 12257). Line 12339 (the immediate-specialization transition map) is on p. 259 (head at line 12328). §4 opens at line 13504, on p. 280 (head at line 13492). | Correct |
| `:826` §4.1 | XIII Théorème 1.1.1(i), p. 195; §2 (2.1–2.2, via 2.2.2), pp. 195–197; lines 9260, 9288, 9331 | Théorème 1.1.1 is at line 9260 (footer "195" at line 9291). Its hypotheses are exactly the README's: X noetherian quasi-excellent, f of finite type, n ≥ 1 invertible on X, F a constructible ℤ/n-sheaf. Clause (i) (line 9263) is the conclusion. §2 opens at line 9288 (p. 195), Théorème 2.2.2 is at line 9331 (p. 196), and §2.3 starts at line 9352 (p. 197). | Correct |
| `:1112` §6.1 | XVII §§1.2–1.4, pp. 259–263; lines 12346, 12427 | §1.2 is at line 12346 (p. 259). Déf 1.2.3.1 is at line 12427 (p. 261, head at line 12426). Déf 1.3.1 and 1.4.1 are at lines 12531 and 12534 (p. 262, head at line 12494). Rem 1.4.2 is at line 12562 (p. 263, head at line 12561). | Correct |

§4.2 cites §4.1, so I checked that it stays consistent with the new §4.1 locator. Its locator (XIII Théorème 1.1.1, 1.1.2 and §3, pp. 195 and 198–204) agrees: §3 opens at line 9421, on p. 198 (head at line 9388), and §4 opens at line 9692, on p. 204.

### Seeded sample

This round's sample is §§0.3, 0.4, 0.6, 1.5, 3.4, 4.1, 4.2, 5.3, 5.5, 6.7, 7.3, 8.3, 8.4, 8.5 and 8.6.

- **§4.1** falls in the changed passages. I checked it above against the theorem, the page and the hypotheses: it matches.
- **§4.2** depends on §4.1. Its locator agrees, as above.
- **Earlier rounds** verified these at their locators:
  - §5.3 and §8.3 in PRREVIEW~21;
  - §8.4, §8.5 (`etaleCohomology_tilt` against CS24 Theorem 2.2.7) and §8.6 in PRREVIEW~22;
  - the §0.6 locator in PRREVIEW~22.
- **§§0.3, 0.4, 1.5, 3.4, 5.5, 6.7 and 7.3** are untouched by the diff and were not re-read in this incremental round.

### Adversarial table

New rows, for the statements whose text the diff changes:

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| Conventions: shift | discrete module M; M[2] | H^i(M[2]) = H^{i+2}(M), nonzero only at i + 2 = 0, so i = −2 | Holds ("degree −2") |
| Conventions: trait witness | strictly henselian trait, n invertible, uniformizer π | H¹(η, Λ(1)) = K^×/K^{×n} ≅ ℤ/n by the valuation. H¹(X, Λ(1)) = H¹(s, Λ(1)) = 0 and H²(X, Λ(1)) = 0, since s is separably closed. So the boundary is an isomorphism onto H²_s(Λ(1)) and [π] ↦ v(π) = 1 is a generator. | Holds |
| Conventions: surface witness | regular strictly local, d = 2 | H⁴_x(Λ(2)) ≅ Λ (purity, H^{2d}_x(Λ(d)) with d = 2): degree 4, twist 2 | Holds |
| §4.1 | n = 1 | Λ = ℤ/1 = 0, every sheaf is 0, and R^q f_*F = 0 is constructible | Holds (trivially) |
| §4.1 | j : 𝔾_m → 𝔸¹_k, k = k̄, ℓ ≠ char k, F = ℤ/ℓ | R⁰j_*ℤ/ℓ = ℤ/ℓ. R¹j_*ℤ/ℓ = i_{0*}ℤ/ℓ(−1), with stalk H¹ of the fraction field of k{t} = Hom(Ẑ′(1), ℤ/ℓ). R^{≥2} = 0, since cd_ℓ = 1. All constructible; stalk ranks at 0 are (1, 1). | Holds; matches the §4.2 Example for r = 1 |
| §4.1, n invertible | n = p = char k, f : 𝔸¹_k → Spec k | R¹f_*ℤ/p = k[t]/(F − 1)k[t] is infinite over 𝔽_p, so not constructible | Hypothesis needed (§4.2 Check) |
| §4.1, quasi-excellence | ILO XIX 2.2 (ILO14 line 17123) | R¹j_*ℤ/2 is not constructible | Hypothesis needed (§4.1 Check) |
| §6.1, c = 1 | strict trait over ℤ[1/n], K = Λ, η̄ ⇝ s | RΓ_η̄(Λ) = Λ[0]. RΓ_s(Λ)(1)[2] has H⁰ = H²_s(Λ)(1) = Λ(−1)(1) = Λ. sp in degree 0 is Λ → Λ, sending 1 to the Kummer generator. | Degrees and twists agree |
| §6.1, c = 0 | ȳ ≅ x̄ | twist (0), shift [0]; transport along the isomorphism | Holds |
| §6.1, factor 1/[s̃:s] | n = 3, residue characteristic p = 2, [s̃:s] = 2 | p ∤ n because n is invertible on X, so 2 is a unit in ℤ/3: 1/2 = 2, since 2·2 = 4 ≡ 1 | Defined |
| §6.1, n ≥ 2 | n = 1 | Λ = 0 and every RΓ is 0; the README excludes this case, as XVII does | Consistent |

Rows carried forward for statements the diff leaves untouched, with the values given in PRREVIEW~22:
- `etaleCohomology_tilt`:
  - 𝔽_p with ϖ = 0, G = ℤ/ℓ, ℓ = p included: H⁰ = H¹ = ℤ/ℓ on both sides;
  - 𝒪_C with ϖ = p^(1/p): G in degree 0 only;
  - `hUV` fails for (Spec C, Spec 𝒪_(C^♭));
  - naturality for ·ℓ on ℤ/ℓ²;
  - the `CharP` exclusion at A = 0 (p ∣ 1 is false);
  - the coordinate-zero map, with kernel (ϖ^♭);
  - the `IsIntegralPerfectoid` description on the zero ring, 𝔽_p and ℤ_p.
- The §0.6 and §3.1 locators.

Rows carried forward from PRREVIEW~21, with the values given in that report:
- 2.1: ℙ¹_L over K.
- 2.3: discriminant 2 is a nonsquare mod 3.
- 2.4: dim E × E = 2.
- 3.2: Λ ⊕ Λ(−1)[−1] on both sides.
- 3.3: (t, t − 1) = (1).
- 3.5: the equaliser is the diagonal.
- 3.6: H² = Λ(−1) ≠ 0.
- 5.1: 2 ≠ 1.
- 5.2: Nagata's example.
- 5.3: no square root of 1 + t over k(t).
- 5.6: ℓ[u] = 0, and the cup-product sign.
- 5.7 / `affineLefschetz_strictlyLocal`: H³(U) = ℤ/ℓ(−2).
- 5.8 / `cohomologicalDimension_le_of_strictlyLocal`: H⁰ ≠ 0 at d = 0, excluded by `hd`.
- 5.9 / `cohomologicalDimension_fractionRing_eq`: ℓ = 2 excluded by `hreal`.
- 6.4: H²_x(Λ(1)) = Λ.
- 6.11: μ₆[2] = μ₂[2] ⊕ μ₃[2].
- 6.12: H²_x(Λ) = Λ(−1).
- 7.1: H^{>1}(η) = 0.
- 7.3: 0 → ℤ/ℓ(−1), not onto.
- 8.2: the limit is a singleton.
- 8.3: 4 idempotents versus 2.
- `cohenGabber_equalCharacteristic`: separable degree 3 at p = 2.
- `cohenGabber_equivariant`: Nat.card 2 is not a unit in characteristic 2.
- `cohenGabber_mixedCharacteristic`: p x^(p−1) vanishes on the p-fibre.
- `partialAlgebraization_equalCharacteristic`: 0 + 1 = 1.
- `partialAlgebraization_mixedCharacteristic`: 2 v₃(b₀) = 1 is impossible.

### Cross-roadmap citations, overlaps and gaps

- **Citations.** The diff adds no cross-roadmap citation and no Lean name. The changed Conventions line keeps EtaleCohomologyFoundations §F.0.3, which is unchanged.
- **Citation leads.** There are the same seven as in PRREVIEW~22:
  - PerfectoidQuotientsPartII is at merge-order line 219, before this roadmap's line 390.
  - The six `ClassicalAlgebraic.*` and `VanishingCycles.*` names are EtaleCohomologyFoundations targets, resolved in PRREVIEW~21.
- **Overlaps.** No other open pull request changes this roadmap, and none drops an id it cites or defines one only in a revision. PurityForFlatCohomology, the fifth-closest roadmap in vocabulary, is the R01 sibling covered above.
- **Declared gaps.** The diff leaves all five gap slugs untouched.
- **Pull-request description.** It still says `Suggested.lean` states nine headline theorems, which matches the nine `theorem` declarations. Its sentence that PurityForFlatCohomology §§1.4–1.5 "are to be replaced there by citations of these sections" is accurate about what that roadmap still states at d3f15fd.

### Remarks on untouched text (no change requested)

- `README.md:1684` gives the author of published Exposé XIII (ILO-final-XIII) as "L. Illusie". The cached text names Fabrice Orgogozo (ILO-final-XIII lines 6 and 23), as does arXiv v1 (ILO14 line 9257).
- `README.md:58` still uses the shorthand `Sheaf.H` next to `CategoryTheory.Sheaf.H`, as noted in PRREVIEW~21.

## Not verifiable

- **Ill03, Epp73 and Ser65** are settled as uncertified and are cited by locator.
- **Published Exposé XVII of ILO** is not in the sources cache. The Conventions and §6.1 page ranges were checked in arXiv v1 (ILO14), which is the version the README cites for them.

## Source issues

- none
