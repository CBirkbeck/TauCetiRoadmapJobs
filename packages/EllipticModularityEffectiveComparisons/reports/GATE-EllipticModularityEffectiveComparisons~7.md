# GATE-EllipticModularityEffectiveComparisons~7: answers to the human review of `aa5fb55`

The review (CBirkbeck, 2026-11-08T12:21:13Z) makes three points: F01 (the re-plan of EllipticCurveModularityPartII) is H01, F02 (the §1.1 locator) is H02, and F03 (the §4.18 and §4.21 locators) is H03.
- Its "Previous findings" entry R01 restates F01.
- Its "Verified sound" section raises nothing new.
- The text was treated as data. It contains no instruction addressed to the worker beyond its findings, and nothing suspicious was found in it or in the files read.

One commit: `1c8a2cc` "EllipticModularityEffectiveComparisons: review repairs (source locators re-pointed from page breaks and headers to cited lines)". It touches `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md` only, with 19 insertions and 19 deletions, all inside locator parentheses. No statement, hypothesis or route changed. `Suggested.lean` is byte-identical to `aa5fb55`.

## H01 (CBirkbeck) — answered

The duplication still holds at the current heads. The review itself states that no repair inside this folder exists: importing every target from EllipticCurveModularityPartII would leave this roadmap with no target. So the choice between closing #1810 and closing #1491 stays with a human, and the folder is not emptied here. The review's facts were rechecked, with one correction to its first option.

**The facts hold.**
- **Sibling.** EllipticCurveModularityPartII is still at `95f7c2f`. Its `README.md` line 7 still claims "the six comparison layers below".
- **Consumers.** Occurrences of the sibling's name and of this folder's name at the current heads:

  | Consumer | Head | Sibling | This folder |
  | --- | --- | --- | --- |
  | ErdosProgressionPowers | `aaab8ad` | 17 | 0 |
  | AdelicImagesAndModularCurves | `9037f3d` | 1 | 0 |
  | EllipticCurvePeriodsAndModularParametrizations | `7a356fe` | 6 | 0 |
  | FaltingsFinitenessAndIsogenyTheoremsPartII | `f49680f` | 10 | 0 |
  | KatoEulerSystems | `903763b` | 5 | 0 |
  | RankOneConverse | `9b5c88a` | 8 | 0 |

  ErdosProgressionPowers's contract heading "From TauCetiRoadmap.EllipticCurveModularityPartII" is at its line 648.
- **Mentions in prose.** `roadmaps grep --fixed EllipticModularityEffectiveComparisons` over main and the open heads finds this folder's name elsewhere only in prose: ModularSymbolsPadicLFunctions line 2695, FaltingsFinitenessAndIsogenyTheorems line 2928 and EllipticCurveModularityPartII line 1058.
- **Merge order.** `ORDER.txt` lists ErdosProgressionPowers at 55, the sibling at 273 and this folder at 283. The other consumers are KatoEulerSystems at 335, FaltingsFinitenessAndIsogenyTheoremsPartII at 364 and RankOneConverse at 372.

**Correction: under either option, ErdosProgressionPowers moves.** The review's first option says that closing #1810 changes nothing else. That is not quite right. ErdosProgressionPowers at 55 already sits above its supplier, the sibling at 273. The dependency check run on its README at `aaab8ad` prints:

    moved: ErdosProgressionPowers moved in the merge order from #55 to #273, right after its last supplier EllipticCurveModularityPartII (…)

- **First option (close #1810).** ErdosProgressionPowers moves to right after the sibling, which the worker does at its submission.
- **Second option (close #1491).** ErdosProgressionPowers would have to move after this folder, to 283 or later, as the review says.

**Unchanged from the last two rounds.**
- `gap:modular-rank-zero` (`README.md` line 116) is kept. Citing sibling §6.0e for it now would break under the second option and does not matter under the first.
- Under the second option, three sibling items have no owner here: §1.8, §6.0f's minimal period subvariety and §6.0e.

## H02 (CBirkbeck) — applied

The point is right. bennett-siksek-2020 lines 198–203 give the congruence λ∣(p+1∓c_p), the divisibility ℓ∣Norm(p+1∓c_p) and the bound ℓ≤(√p+1)^(2[K:ℚ]). None of these lines says that p+1∓c_p≠0, yet the bound on ℓ needs it.

**Line 383 (§1.1).**
- Old: "(bennett-siksek-2020, Lemma 2.2 proof, p.359; explicit nonvanishing step, bennett-siksek-2020 line 198.)"
- New: "(bennett-siksek-2020, proof of Lemma 2.2, p.359, bennett-siksek-2020 lines 198–203, where the nonvanishing of α is used to bound ℓ by the norm but is not stated; this subsection supplies it.)"

**Same defect elsewhere in Layer 1.** Three more locators named only the first line of a passage:
- line 407 (§1.3): the bound itself is on line 203, so "line 202" → "lines 202–203";
- line 431 (§1.5): line 204 gives only [K:ℚ]≤g₀⁺(M₀), and Martin's inequality is on lines 205–206, so "line 204" → "lines 204–207";
- line 443 (§1.6): the passage cites Theorem 3 (line 184), Lemma 2.1(ii) (line 193) and Lemma 2.2 (lines 195–197), so "line 195" → "lines 184–197".

## H03 (CBirkbeck) — applied

The point is right. bennett-siksek-2020 line 329 is the page-9 marker. Lines 334–335 say only that a rational 2-point and ℓ≥11 give irreducible E[ℓ], citing Mazur. They construct no 2ℓ-isogeny.

**The two cited lines.**
- **Line 1063 (§4.18).** Old: "(bennett-siksek-2020, §3, one rational two-point irreducibility use, p.363, bennett-siksek-2020 line 329.)" New: "(EllipticCurves Layer 1, the quotient by a finite Galois-stable subgroup; Layer 2, the structure of E[N] over a separably closed field.)"
  - Both items are on main: EllipticCurves `README.md` line 548 (the Vélu quotient by a finite Galois-stable subgroup) and line 649 (`E[N] ≃+ (ZMod N)²`).
  - Both were already in §4.18's *Needs:* line.
- **Line 1099 (§4.21).** Old: "(bennett-siksek-2020, §3, p.363, bennett-siksek-2020 line 329.)" New: "(bennett-siksek-2020, proof of Lemma 3.5, p.363, bennett-siksek-2020 lines 334–335.)"
- **Line 1111 (§4.22), same pattern.** "Lemma 3.3, pp.361–362, … lines 294–296" → "proof of Lemma 3.3, p.362, … lines 294–295". The application to full 2-torsion with ℓ≥7 is in the proof, which is on p.362.

**The same defect elsewhere.** Every "<source> line N" locator in the README was checked mechanically against its line-numbered source. Twelve more named a page marker, a running header or a different passage from the one claimed. All twelve now name the lines that hold the cited content:

| README line | Old | New | What is there |
| --- | --- | --- | --- |
| 202 (§0.4) | martin-2003 line 449 (μ∗1=δ) | lines 452–479 | λ=μ∗μ, equation (16), and the convolution of each term |
| 250 (§0.7) | martin-2003 line 772 (running header) | line 773 | Corollary 18 |
| 334 (§0.14) | martin-2003 line 824 (page marker), "p.16" | lines 823 and 834–835, "pp.15–16" | Lemma 22 and the direct check for N<1548 |
| 578 (§3.3) | kraus-1997 line 239 (definition (7)), "pp.1144–1145" | lines 321–337, "p.1145" | g₀⁺≥1 gives F>μ/6, so l≠p |
| 590 (§3.4) | kraus-1997 line 301 (page marker), "pp.1144–1145" | lines 342–363, "p.1145" | the norm of a_l−a_l(E) or a_l∓(l+1) and its bound |
| 602 (§3.5) | kraus-1997 line 301 (page marker), "pp.1144–1145" | lines 307–373, "p.1145" | the whole proof of Théorème 3 |
| 679 (§3.9) | kraus-1997 line 1145 (running header) | lines 1146–1173 | the operators V_l, V′_l and the congruence of F and G |
| 715 (§3.12) | kraus-1997 line 269 (definition (8)) | lines 397–408 | (10) and p>G give l≠p in the proof of Théorème 4 |
| 787 (§3.18) | kraus-1997 line 200 (condition (a)) | lines 200–212 | conditions (a)–(c) and the p≥11 reading of (c) |
| 1039 (§4.16) | banwait-najman-padurariu line 210 (page marker) | lines 228–274 | §2, Mazur's strategy, Lemmas 2.1–2.2 |
| 1404 (§5.11) | darmon-merel line 614 (page marker) | lines 640–666 | the winding element e, I_e, L(f,1)=⟨f,e_A⟩≠0 |
| 1576 (§5.22) | lemos-2017 line 249 | lines 249–260 | the integrality argument and the five sets S_r∩ℤ |

The mechanical check now reports no locator on a page marker or a running header.

## Build, gate and dependency check

- **Build.** `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested` gives "Build completed successfully (9205 jobs)". The only warnings are the 14 "declaration uses `sorry`", at lines 79, 84, 93, 104, 118, 135, 182, 188, 194, 201, 238, 246, 256 and 265.
- **Gate** at `1c8a2cc`:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- **Dependency check** (`--depcheck … --movable`, board order, content checkout):

      depcheck: 236 roadmaps, 2419 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line for this roadmap.

## Lean signatures

`Suggested.lean` did not change: `git diff aa5fb55 HEAD` on it is empty. The worker's `signatures.md` gives the elaborated types of these bytes: 24 declarations, none with a dropped section binder. The file has no `variable`, `include` or `set_option`. No new `#check @name` file was elaborated, because no declaration changed. No README statement that a Lean declaration mirrors was edited; only the locators in parentheses changed.

## Ownership, citations and sources

- **Ownership.** No construction was added and no notion moved down. Ownership against open work was checked by object for H01: the sibling checkouts plus `roadmaps grep` over main and the open heads.
- **Citations.**
  - The one new cross-roadmap citation is EllipticCurves Layers 1–2 in §4.18, which is on main at `1d4e7ce` and was already in that section's *Needs:*.
  - No later roadmap is cited as a supplier.
  - No citation uses the numbering of an open revision.
- **Sources.**
  - No source was added; every new locator is in a text the manifest already records.
  - `needs-references.toml` was not written.
  - `sources.toml` is outside this job's editable files. Its entries record works and sections, not the changed line numbers.

## Adversarial pass

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 α=p+1−sc≠0 | p=2, s=1, c=2√2; p=4, c=4; p=1, c=2 | 3−2√2≈0.172≠0; 5−4=1≠0; at p=1, 1+1−2=0 with \|c\|=2=2√1, which is why p≥2 is required. If α=0 then \|σ(c)\|=p+1, and p+1−2√p=(√p−1)²>0 for p≥2 | sound | locator only |
| §1.3 norm bound | K=ℚ, p=2, c=2 | \|3−2\|=1≤(√2+1)²≈5.83 | sound | locator only |
| §1.5 exponent replacement | L=11, g=1, d=1, p=2 | (√2+1)²≈5.83 ≤ (√2+1)^(12/6)≈5.83: equality, since 12g=L+1 | sound | locator only |
| §3.4 norm of a_q−b | good case: \|σ(a_q)−b\|≤4√q; q=3 | 4√3≈6.93≤(√3+1)²≈7.46; multiplicative: q+1+2√q=(√q+1)² exactly | sound | locator only |
| §3.3 F>B | N=11: I=12, B=2, g=1 | F=(√2+1)²≈5.83>2 | sound | locator only |
| §3.12 G>B | N=11: I(44)=72, B=12 | G=(√12+1)²≈19.93>12 | sound | locator only |
| §4.18 2ℓ-isogeny | ℓ=3 and ℓ=11, rational P of order 2, stable line L | ⟨P⟩⊕L≅ℤ/2×ℤ/3≅ℤ/6 and ℤ/2×ℤ/11≅ℤ/22, cyclic since gcd(2,ℓ)=1; ℓ=2 is excluded (ℤ/2×ℤ/2 is not cyclic) | sound | locator now EllipticCurves Layers 1–2 |
| §4.21 ℓ≥11 | ℓ=7, 11, 13 | 14 is in the §4.17 list (cutoff cannot be 7); 22 and 26 are absent from {1,…,19,21,25,27,37,43,67,163} | sound | locator only |
| §4.22 ℓ≥5 | ℓ=3, 5, 7 | 12 in the list, matching the ℓ=3 Check y²=x(x+5)(x+32) with (4,36): 4·9·36=1296=36²; 20 and 28 absent | sound | locator only |
| §5.11 orientation | ∫₀^{i∞}f(τ)dτ with τ=iy | =i∫₀^∞f(iy)dy=iL(f,1)/(2π), so 2πi∫f dτ=−L(f,1). darmon-merel line 660 omits the sign; the README's "−L(f,1)" and "iL(f,1)/(2π)" are the computed values | sound; the source's sign slip is already handled by "with the orientation convention above" | locator only |
| H01 merge-order claim | depcheck of ErdosProgressionPowers at `aaab8ad` | `moved: … from #55 to #273` | the first option also moves ErdosProgressionPowers | reported |
