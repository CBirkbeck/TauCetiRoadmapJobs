# Review of CohomologyComparisons (pull request #1064 at bee1248)

**Verdict:** accepted

Incremental re-review of the 77 lines changed since a99732e (`README.md` 69 lines in §§Scope, Conventions, supplier contracts, 0.1, 2.5, 2.24, 5.12, 6.2, 6.12–6.13 and References; `Suggested.lean` 8 docstring lines). The gate at this head passes every check (build=0, residue=0, depcheck=0); the dependency check run by me reports no problem; `lake env lean` on `Suggested.lean` exits 0 with no output; no file outside the folder changes. All six findings of the previous review are repaired. Three P3 notes on the repairs, nothing blocking.

## R01 (P3) — §2.24 cites §AI.2.3 for a theorem AInfCohomology states in §AI.2.2

Location: `README.md` line 580 ("full faithfulness of Fargues's functor … which is AInfCohomology §AI.2.3 in the form PartIII §7.13 states over `O_C`"), line 597 (`*Needs:*` "AInfCohomology §AI.2.3 for the full faithfulness of Fargues's functor") and the supplier contract at line 63.

Claim: at the AInfCohomology head, `AInf.fargues_full_faithfulness` ("the functor from finite free BKF modules to pairs `(T,Ξ)` is fully faithful") is stated in §AI.2.2 (its README line 1749, before the §AI.2.3 heading at line 1755); §AI.2.3 states the classification `AInf.fargues_classification` (line 1846), which implies full faithfulness but is the stronger equivalence. The previous review's R02 pointed at §AI.2.3; the precise owner of the statement §2.24's route uses is §AI.2.2.

Witness: AInfCohomology README lines 1650 (`### AI.2.2 Breuil–Kisin–Fargues modules and lattice pairs`), 1749, 1755, 1846.

Repair: in the three places write "AInfCohomology §AI.2.2 (`AInf.fargues_full_faithfulness`)", or "§§AI.2.2–AI.2.3" where the equivalence is also meant; no other change.

## R02 (P3) — One Guo–Reinecke page locator off by one

Location: `README.md` line 595 ("Construction 3.9 and Theorem 3.12, p.32").

Claim: Construction 3.9 (realization functors) begins on page 31 of the cited arXiv v3 text; Theorem 3.12 is on page 32.

Witness: gr (3c49a5f2) line 1488 (file page 31, "Construction 3.9 (Realization functors)"), line 1525 (page 32, "Theorem 3.12"); the page marker at line 1473 opens page 31.

Repair: "Construction 3.9, p.31; Theorem 3.12, p.32".

## R03 (P3) — `Suggested.lean` docstring says in one sentence that the file states theorems and that it states none

Location: `Suggested.lean` lines 6–8 ("it states the headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`; it states no theorem because none is statable at the pins").

Claim: the first clause describes what an acceptance test does in general, the second what this file does; read as one sentence they contradict each other. Line 8 is also 127 characters wide, against the 100-character house width of the rest of the file.

Witness: lines 6–8 against the empty namespace at lines 38–42.

Repair: "This file is the roadmap's acceptance test, meant to state the headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`. It states none, because none is statable at the pins; the list below says what each lacks." wrapped at 100 characters.

## Previous findings

- R01 — repaired: the two `<a id=…>` anchors and the two "Stable target identifier" lines are gone (`grep` for `<a id=`, "Stable target identifier" and `CP.6/` in the README returns 0); gate residue=0. The only remaining mentions of the `CP.6/` ids are CompletedCohomologyPartII README lines 633 and 1223, that roadmap's own repair.
- R02 — repaired: §2.24 (lines 576–597) now imports PrismaticCohomologyPartIII §§7.1, 7.5 (`Prismatic.FCrystal.PrismaticFCrystal`), §§7.8–7.9 (`Prismatic.FCrystal.etaleRealization`), §7.10 (`Prismatic.FCrystal.crystallineRealization`), §7.13 and §7.22, keeps as targets only the analytic category, its embedding (GR Props 3.7–3.8), `analyticToPerfect` (Thm 5.10), the perfect-complex and analytic forms of Thm 6.4, `perfectRelativeCohomology` (Cor 6.14), Thm 9.15 and the relative Theorem A; the `Spf O_K` Check is now an agreement statement with §§7.22 and 7.13; the `*Needs:*` line adds PartIII §7.0 (`Prismatic.Beilinson.square`) for GR Proposition 4.20 and AInfCohomology AI.2 for Fargues's functor; the supplier contract (line 63) and Layer 2 Dependencies (line 605) are extended. Every cited PartIII section exists at its head with the cited content (see Verified sound). The one residual imprecision is the §AI.2.3 pointer (R01 above).
- R03 — repaired: §0.1 (lines 93–119) names the supplied objects (`AInf.cyclotomic`, `AInf.cyclotomic_factorization`, `AInf.cyclotomic_kernel`, `AInf.tildeTheta`, `AInf.tildeTheta_apply`, `AInf.tildeTheta_ker`, `AInf.residue`, `AInf.residue_periods`, PadicPeriodRings §1.5 for the `B_dR⁺` uniformizer, Mathlib `WittVector.frobeniusPoly` for `wφ=Fw`), deletes the ten duplicated table rows and the component theorems, and says the assembly of the commuting diagram is the only new content. All eight AInf names exist at the AInfCohomology head and the Mathlib names at the pin.
- R04 — repaired: the Conventions paragraph at line 27 states that the roadmap's own backticked names are intended interface names, that `Suggested.lean` declares none of them, and that supplier names are declared where the cited roadmap or library says. Gate readme-ids-missing=0.
- R05 — repaired: the docstring title is "p-adic cohomology comparisons: target signatures" and the sentence about "discharging" is gone; the new sentence is R03 above (wording only).
- R06 — repaired: (a) §6.2 line 1160 cites the Annals numbering and printed pages (Theorem 3.2.1 p.975, Corollary 3.2.2 p.976, Lemma 3.2.4 p.977, Corollary 3.2.6 pp.977–978, Definition 3.2.7 p.978, Proposition 3.2.8 p.979), each verified against scholzetorsion (ebac854f) lines 1183, 1208, 1241, 1269, 1307, 1320 with file page + 944 = printed page; the References entry adds "§3.2 (canonical subgroups), pp.975–979". (b) §5.12 line 1078 quotes §CR.3.5's actual title "Computations and tests" (CrystallineCohomology head line 3209). (c) §2.5 line 372 adds "valid for `Σ` sufficiently large", explains the enlargement through BMS Lemma 13.7, and says no normal form is asserted otherwise; the locator (line 374) adds Lemma 13.7, p.106 (bms line 5217, file page 106) and cites Lemma 13.12(ii).

## Verified sound

**Gate and direction.** `gate.md` at bee1248: every scanner 0, build=0, OK. Dependency check run by me on this head:

    depcheck: 205 roadmaps, 1440 edges, 0 problem(s)

CohomologyComparisons is at merge-order line 161; the suppliers the repairs add are earlier (AInfCohomology 53, PrismaticCohomologyPartIII 56). `git diff --stat origin/main...HEAD` outside the roadmap folder is empty.

**Lean.** `lake env lean TauCetiRoadmap/CohomologyComparisons/Suggested.lean` at the pins: exit 0, no output. The file still declares nothing (the signature scan's one "declaration" is the `and` in the docstring, not a declaration), so the binder check and the one-tactic probe have nothing to test. Statability at the pins was settled in the previous review and the diff adds no carrier: nothing changed in Mathlib or Tau Ceti between the two heads (same `lake-manifest.json`).

**Supplier citations the repairs introduce, resolved at the heads.**

- PrismaticCohomologyPartIII (#1070): §7.1 line 1042 (crystals in vector bundles and in perfect complexes on a p-adic formal scheme, with unit, tensor, dual, pullback, base change), §7.5 line 1146 (`Prismatic.FCrystal.PrismaticFCrystal`, F-crystals in vector bundles and in perfect complexes, line 1158), §7.8 line 1222 (Laurent F-crystals are `ℤ_p`-local systems, `X` bounded), §7.9 line 1237 (`Prismatic.FCrystal.etaleRealization`, line 1247; "for F-crystals of perfect complexes the same formula gives `T`"), §7.10 line 1264 (part (1) for a quasi-syntomic `F_p`-scheme `Z`: `Vect^φ(Z_Δ,O_Δ) = Vect^φ(Z_crys)`; `Prismatic.FCrystal.crystallineRealization` line 1275), §7.13 line 1334 (F-crystals over `O_C` are BKF modules; Fargues's functor `M ↦ (T,F)`, full faithfulness used, owned by AInfCohomology AI.2), §7.22 line 1529 (`Spf O_K` equivalence with lattices in crystalline representations, BS23 Theorem 5.6), §7.0 line 928 (`Prismatic.Beilinson.square`, line 940). The README's one-clause descriptions of each (line 63 and §2.24) match these statements, including §7.10's quasi-syntomic characteristic-p hypothesis.
- AInfCohomology (#1044): §AI.0.1 line 521 holds `AInf.cyclotomic` (523), `AInf.cyclotomic_factorization` `μ=ξ·φ⁻¹(μ)` (532), `AInf.cyclotomic_kernel` (534), `AInf.tildeTheta` (544), `AInf.tildeTheta_apply` (550), `AInf.tildeTheta_ker` (552); §AI.0:integral.1 line 749 holds `AInf.residue` (751, "specialize Mathlib's Witt functor to `O_C^♭→k`") and `AInf.residue_periods` `μ↦0`, `ξ,ξ̃↦p` (757). §AI.2.2 line 1749 `AInf.fargues_full_faithfulness`; §AI.2.3 line 1846 `AInf.fargues_classification` (R01).
- CrystallineCohomology (#857) line 3209: `### CR.3.5 Computations and tests`.
- PadicPeriodRings (#940) §1.5 line 217: identifies Mathlib `BDeRhamPlus`/`BDeRham` with the completion of `A_inf[1/p]` at `ker θ` and its localisation, complete DVR structure, `t` a uniformizer via the primitive kernel; the §0.1 claim that the image of `ξ` is a uniformizer is the "primitive kernel" step there.
- Mathlib at the pin: `WittVector.frobeniusPoly` (`RingTheory/WittVector/Frobenius.lean:100`), `WittVector.IsPoly.map` (`IsPoly.lean:314`, the lemma that gives `map g ∘ f = f ∘ map g` for every polynomial map, hence `wφ=Fw` for `w = WittVector.map`), `PreTilt` (`RingTheory/Perfection.lean:633`), `PreTilt.untilt` (`Perfectoid/Untilt.lean:49`). The README names `frobeniusPoly` rather than `IsPoly.map`; both support the claim.

**Source locators of the changed passages, read at the text.** gr (3c49a5f2, arXiv 2203.09490v3): Theorem A line 97 p.3; Remark 1.4 line 151 p.4 (embedding, `Spf O_K` equivalence, non-extending example via DLMS Ex. 3.35); Remark 1.7 line 182 p.4 (composition with the embedding recovers BS23 Construction 4.8); Definition 3.5 line 1398 p.29; Proposition 3.7 line 1449 p.30 (fully faithful restriction); Proposition 3.8 line 1461 p.30 (equivalence for `Spf O_K`); Construction 3.9 line 1488 p.31 (R02); Theorem 3.12 line 1525 p.32; Construction 4.2 line 1714 p.35 (lattice realization to pairs `(M,Ξ)`); Theorem 4.8 line 1970 p.39; Theorem 4.15 line 2119 p.42; Proposition 4.20 line 2245 p.45 (descent of `M[1/p]` from the perfectoid cover); Theorem 5.10 line 2518 p.51; Theorem 6.4 line 2875 p.57 (for a quasi-syntomic scheme `Z` of characteristic `p`: `D^{(φ)}_perf(Z_Δ)≃D^{(φ)}_perf(Z_crys)`, `Vect^{an,(φ)}(Z_Δ)≃Isoc^{(φ)}(Z_crys)`, Frobenius-equivariant `RΓ` comparison, exactly as §2.24 restates it); Corollary 6.14 line 3111 p.61; Theorem 9.15 line 4654 p.92. bms (285f7d20): Lemma 13.7 line 5217 p.106 (enlarging `Σ`, descent data `(A, R_A, Σ_A)` with `Σ_A` carried into `Σ`); Lemma 13.12(ii) line 5405 pp.110–111 ("if Σ is sufficiently large"). scholzetorsion (ebac854f): the six §3.2 locators above.

**Seeded sample.** None of the fifteen sampled targets (1.11, 2.4, 2.7, 2.11, 2.17, 2.18, 3.5, 3.7, 5.2, 5.3, 5.5, 6.1, 6.7, 6.9, 6.11a) lies in a changed passage; the previous review read 2.17, 5.2 and 6.1 at their locators. Beyond the brief, seven of the others were spot-checked at the text: 2.4 bms Lemma 13.11 line 5359 p.109 (`R_A⊗̂_A B_dR⁺` is `ξ`-adically complete and flat); 2.7 Proposition 13.15 line 5512 p.112 and Corollary 13.16 line 5568 p.113; 2.11 Theorem 13.1 line 5088 p.104; 3.5 Theorem 14.6(i) line 5923 p.121 (crystalline comparison for a discretely valued `K` with perfect residue field, `H^i_ét(X_C,ℚ_p)` crystalline); 5.3 Theorem 14.5(iii) lines 5893–5903 pp.120–121 (degree-`i` torsion-freeness gives `H^i_{A_inf}≅BKF(T)` and the `φ`-compatible inclusion into `H^i_crys`, equality needs degree `i+1`: the README's two levels of conclusion are the source's); 5.5 Theorem 14.6(ii) line 5927 p.121; 6.7 bettsstix (7aa79403) Proposition 3.20(8) line 1425 and its proof paragraph line 1449, both p.28 (reduction to a line bundle and `r=1`, zero section of the total space). All match.

**Ownership.** `roadmaps grep -i 'analytic prismatic F'` over main and the 433 open pull requests hits only this roadmap: no other roadmap builds analytic prismatic F-crystals. The names §0.1 no longer declares (`muOf`, `xiOf`, `xiTildeOf`, `ainfToBdRPlus`, `wittReduction`, `fontaineThetaTilde`, `Ainf O p`, `ainfFrobenius`, `epsRoot`, `residueOfTilt`) and `PerfectPrismaticFCrystal` are cited by no roadmap on main or in any open pull request and nowhere else in this README. §6.3 (lines 1210, 1232–1234) uses `analyticToPerfect` and `perfectCrystallineRealization` as §2.24 now defines them (into PartIII's `D^φ_perf`, then restriction and the Theorem 6.4 identification).

**Adversarial pass.** Rows for statements the diff leaves untouched are carried from the previous report (PRREVIEW-CohomologyComparisons~1, its table of 38 rows: §0.1 identities and wrong models, §0.4, §1.10, §1.11/§3.7, §2.14, §2.15, §2.18, §2.19, §2.20, §3.4/§3.5, §3.8, §4.1, §4.5, §4.7, §5.2, §5.6, §5.8, §5.12, §6.1, §6.2, §6.3, §6.5, §6.6, §6.8, §6.11, §6.11a, §6.15), unchanged at this head. New rows for the changed statements:

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §0.1 standard entries satisfy `AInf.cyclotomic_factorization` | `ε` primitive; `ε=1` | `(Σ_{i<p}[ε^{1/p}]^i)([ε^{1/p}]−1)=[ε]−1` both sides; at `ε=1`: `p·0 = 0` | identity holds for every `ε`, as the README says | none |
| §0.1 delayed system `ε′=ε^p` | primitive `ε` | `ε′^{1/p}=ε`, untilt `=1`, so first-root condition fails; `ε′^{1/p²}=ε^{1/p}`, untilt `ζ_p≠1` | Check correct | none |
| §0.1 `wφ=Fw` via `WittVector.map` | `x=[a]`, `a∈O^♭` | `w(φ[a])=w[a^p]=[ā^p]=F[ā]=F(w[a])` | holds; `IsPoly.map` gives the general case | none |
| §0.1 `w` and `θ` differ on `ξ` | residue field `k`, `p≠0` in `W(k)` | `w(ξ)=p`, `θ(ξ)=0` | Check discriminates | none |
| §2.5 normal form needs `Σ` large | `Σ={T_1,…,T_d}` only vs. `Σ⊇Σ_A` after Lemma 13.7 | without enlargement no lift `R_A→D_Σ(R)` is provided (bms line 5410 constructs it from `Σ_A`); with it `D_Σ(R)≅(R_A⊗̂B_dR⁺)[[X_u−ũ]]`, `u∉{T_i}` | hypothesis now stated | none |
| §2.24 embedding `Vect^φ(Y_Δ,O_Δ)→AnalyticPrismaticFCrystal Y` | `Y=Spf O_K`; general `Y` with a bundle on `Spec A∖V(p,I)` that does not extend (GR Rem. 1.4) | point: equivalence (GR 3.8, via BMS Lemma 4.6 extension over `Spec A_inf∖V(p,ξ̃)`); general: fully faithful, not essentially surjective | Check pair correct | none |
| §2.24 étale realization agrees on the embedded subcategory | F-crystal `E` on `Spec A` | `T(E)=E⊗_A A[1/I]^∧_p`; `Spec A[1/I]⊂Spec A∖V(p,I)`, so restricting first changes nothing | Check correct, GR Rem. 1.7 | none |
| §2.24 Theorem 6.4 applied to `Y_{p=0}` | `Y` smooth formal over `O_K`, `K` complete discretely valued, `k` perfect | `W(k)` quasi-syntomic (`L_{k/F_p}=0`), `O_K` lci over `W(k)`, `Y` smooth, `p` a nonzerodivisor: `L_{Y_{p=0}/F_p}=L_{Y/ℤ_p}⊗^L F_p` has amplitude `[−1,0]` | `Y_{p=0}` is a quasi-syntomic `F_p`-scheme, hypothesis of 6.4 met (GR use it the same way, Constr. 3.9(ii)) | none |
| §2.24 realization rank | rank `r` analytic F-crystal | `T` locally free of rank `r` (GR Constr. 3.9(i)); `E′` of rank `r` | consistent with §6.3 line 1210 | none |
| §5.12 `ℤ/p²` vs `k⊕k` | `n=1,2` | lengths `1,2` vs `2,2` | previous row unchanged, title fix only | none |
| §6.2 Annals numbering | file page 31 | printed 975 (ebac854f line 1158) | offset 944 constant across §3.2 | none |

## Not verifiable

- none. Every text consulted this round is the arXiv, Annals open PDF or author-page copy already in the cache.

## Source issues

- none new this round. The hypothesis gap in Scholze, *On torsion in the cohomology of locally symmetric varieties*, Corollary 3.2.6, printed pp.977–978, recorded by the previous review, stands and is not repeated here.
