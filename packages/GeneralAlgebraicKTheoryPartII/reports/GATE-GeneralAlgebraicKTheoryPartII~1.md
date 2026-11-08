# GATE-GeneralAlgebraicKTheoryPartII~1: answers to the human review

One review comment (roed-math, 2026-11-06), six points. Repairs are in commit `7f6a44de` on top of `90bcf29`. Line numbers refer to `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md` at `7f6a44de`. The other roadmaps were read at the heads the review links: ChromaticHomotopyTheory `5055602`, RefinedTraceMethods `b713d26`, HabiroCohomologyFoundationsPartII `61e97fe`, StableHomotopyKTheoryPartII `86c5ced`, HomotopySpheres `52ebd6f`.

## H01 (roed-math) — applied differently

§6.1a (line 1669) now builds E(A) by base change, E(A)=E(k)⊗_𝕎(k)𝕎(A) completed at 𝔪, where 𝕎(A)=S_(W(A)) (bsy line 753, Construction 2.34; line 800, Lemma 2.37). It cites the owner of the spherical Witt vectors in its Needs, and new supplier contracts record both inputs (lines 222–228). That owner is HabiroCohomologyFoundationsPartII §0.1, not RefinedTraceMethods §6.1: §0.1 constructs "the unique p-complete connective E∞ spherical lift S_B of a perfect p-complete δ-ring B … by spherical Witt vectors", and it comes before this roadmap in the merge order (318 vs 319). RefinedTraceMethods §6.1 only takes spherical lifts as hypotheses and proves étale lifting; PrismaticCohomology §0.65 supplies W(A) as a perfect δ-ring, and Scope (line 15) names StableHomotopyKTheoryPartII §4.8 as the finite-field case.

## H02 (roed-math) — applied

§4.15 (line 917) and §4.16 (line 933) now state only the existential bound. The "m=n+1 using the Carmeli–Schlank–Yanovski height bound" clauses, the CSY Postnikov step and the csy Theorem 5.4.4 locator are gone. The dependency is confirmed in the source: csy Theorem 5.4.4 (1)⇒(2) is proved from Corollary 5.3.7 (csy line 4045), which is deduced from §5.3's ∞-semiadditivity (csy line 3976). lmmt says Remark 2.12 "will not be used in the sequel" (lmmt line 432), and no section here that cites §4.15 or §4.16 (§§4.38, 4.42, 4.43, 4.45, 5.1, 10.1, 10.2, 10.5) uses more than some m. A new Check shows every admissible m satisfies m≥n+1: K(ℤ/p,n) has reduced K(n)-homology of rank p−1 (csy line 3655, Corollary 5.1.9). Scope (line 7) assigns the sharp value to ChromaticHomotopyTheory, after its §4.2.

## H03 (roed-math) — applied

The new target §4.30a "Real Bott localization at positive height" (line 1194) proves that ko→KO is a T(n)-equivalence for every prime and n≥1, and that A→A[b⁻¹]=A⊗_ko KO is one for every E₁ ko-algebra A (lmmt line 978, Corollary 4.19 proof). Its Checks show the claim fails at n=0 and fails if a is inverted instead of b. §8.6 (line 2091) previously used this as an unstated step ("The ko→KO Bott localization is an equivalence on the adjacent heights…"); its route and Needs now cite §4.30a. The target sits beside the tmf analogue §4.30, inside the range §§4.18–4.33 that ChromaticHomotopyTheory imports.

## H04 (roed-math) — applied differently

The diagnosis is correct: RefinedTraceMethods states none of the ten contracts. Its §4.6 is relative localizing motives over a rigid base, and its §4.10 is the absolute K-theory unit. But turning them into hypotheses would leave theorems unproved, so eight are resolved here and two are re-pointed:

- **Owned here.** The three linear-motive contracts become the target §8.1a (line 1989, cmnn20 §3). The THH all-cyclic assembly is proved inside §10.4 (line 2373) from RefinedTraceMethods §§2.8 and 2.10.
- **Not needed.** The projection-formula contract is dropped, because cmnn20 Theorem 4.4 needs only naturality of K₀→K′₀ (cmnn20 line 840). The filtered-colimits-of-rings clause in §9.7 was only a contrast and its proof never used it, so the clause is removed.
- **Derived.** §9.6 (line 2267) derives TC(ℤ[1/p])^∧p=0 because THH(ℤ[1/p]) is a ℤ[1/p]-module. It derives L_K(1)TC(ℤ)≠0 from RefinedTraceMethods §4.17's henselian rigidity applied to ℤ_p, together with §6.5's redshift for Hℤ_p (height 0).
- **Re-pointed.** The two TC/p colimit contracts now point at RefinedTraceMethods §4.17. At its head, §4.17's henselian-rigidity proof route already says it "uses that TC/p commutes with all colimits of connective cyclotomic spectra and with sifted colimits of connective E₁-rings", so RefinedTraceMethods has to state them for its own route whatever this roadmap does.

## H05 (roed-math) — answered

Confirmed at HomotopySpheres `52ebd6f`: §3B has reduced words, the word filtration, the James map, the connected James equivalence and the length-two James–Hopf map (3B.1–3B.5), and mentions the stable splitting only in a 3B.4 check. So, as the review's fallback allows, gap:stable-james-splitting (line 192) stays as stated. It agrees in content with ChromaticHomotopyTheory's contract of the same id. If HomotopySpheres §3B adds the target, §§4.33 and 7.7 cite it and the contract is deleted.

## H06 (roed-math) — applied

In Downstream consumers (line 2416), the old sentence "ChromaticHomotopyTheory Layers 3–6 and 8–10 must import §§4.1–4.29 …; its Layers 12–13 must import §§4.30–4.34 …; … must import §6.2" is replaced by "ChromaticHomotopyTheory Layers 0–6 import §§4.2–4.16 and 4.18–4.33, including §4.30a (its Layers 4–5 name §§4.3–4.4, 4.14 and 4.20–4.24); its Part II imports §§5.2, 5.5 and 6.5". Each range was checked against ChromaticHomotopyTheory's supplier paragraph, its Layer 4 Dependencies, its §5.1 Needs and its Part II text. The same stale claim in Scope (line 7, that ChromaticHomotopyTheory consumes §6.1a and §6.2) now refers to that list.

## Build

`lake build TauCetiRoadmap.GeneralAlgebraicKTheoryPartII.Suggested`: `✔ [8954/8954] Built TauCetiRoadmap.GeneralAlgebraicKTheoryPartII.Suggested (5.1s)` / `Build completed successfully (8954 jobs).` `Suggested.lean` is unchanged. It declares nothing; its docstring explains why no headline theorem is statable at the pins. There were therefore no declarations to `#check`, and no elaborated signature to compare.

## Gate

`gate GeneralAlgebraicKTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Direction check (`gate --depcheck … --movable`): `depcheck: 239 roadmaps, 2352 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. The two new edges are HabiroCohomologyFoundationsPartII and PrismaticCohomology, both earlier in the merge order. `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere.

## Ownership, moves and sources

- **Moved down.** ChromaticHomotopyTheory §5.1's positive-height real Bott comparison (later in the order: 320) is now §4.30a here, because §8.6 needs it.
- **Owned here after search.** The A-linear weakly additive motives (§8.1a) and the all-cyclic THH assembly (§10.4). Searches for "weakly additive", "Mot_κ", "noncommutative motive", "Or_Cyc"/cyclic-subgroup assembly, "LRRV" and THH assembly found no owner on main or at any open head. The TC/p colimit statements appear only inside RefinedTraceMethods §4.17's proof route.
- **Spherical Witt vectors.** By object they appear in HabiroCohomologyFoundationsPartII §0.1 (the general construction), StableHomotopyKTheoryPartII §4.8 (finite fields, by étale lifting) and RefinedTraceMethods §§6.1 and 7.6 (as hypotheses). §0.1 is cited as the owner.
- **Sources.** No new source key. Every new locator uses a manifest key and was checked in its cached text: lmmt lines 409, 432, 437, 978, 1097, 1197; csy lines 3655, 3930, 3976, 4045; bsy lines 389, 753, 800; cmnn20 lines 622, 669, 695, 740, 758, 826, 840. Nothing was added to `needs-references.toml`. Ownership against the open pull requests was checked with `roadmaps grep` over all 466 open heads.

## Adversarial pass on every added or changed statement

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §4.15 space statement, existential m | K(ℤ/p,n), n=1,2, p=2,3; K(ℤ/p,n+1); contractible X | K(n)₀ rank on K(ℤ/p,n) is p^(binom(n,n))=p, so reduced rank p−1 = 1 (p=2), 2 (p=3) ≠ 0 ⇒ m≥n+1; on K(ℤ/p,n+1) the rank is p^0=1, reduced 0; Σ∞(*)=0 | consistent with m≥2 at n=1; sharp bound not needed | lower-bound Check added; sharp clause removed |
| §4.15 map statement | f=id; BC_p→* at n=1 | identity fibers = points; BC_p→* is only 1-connective and K(1)⊗Σ∞BC_p≠0 | consistent | basepoint clause made explicit |
| §4.16 | f=id; Σ^nHℤ/p→0; Hℤ→0 | S[1/p]⊗H𝔽_p=0, T(i)⊗H𝔽_p=0 ⇒ L_n^(p,f)-equivalence with n-connective fiber; Σ∞Ω∞ gives Σ∞K(ℤ/p,n), T(n)-nonacyclic ⇒ m≥n+1; Hℤ→0 is not an L_n^(p,f)-equivalence (Hℤ[1/p]≠0) | consistent | sharp clause removed; Check replaced |
| §4.30a ko→KO, n≥1 | n=0,1,2; p=2,3 | cofiber τ≤−1KO bounded above ⇒ zero v_n-periodic groups for n≥1; n=0: π₋₈KO[1/p]=ℤ[1/p] vs π₋₈ko=0 | holds for n≥1 only | new target, n=0 negative Check |
| §4.30a A→A[b⁻¹] | A=0, ko, KO, KU, H𝔽_p, H𝔽_q (q≠p) | 0→0; ko→KO; KO, KU: b already a unit (c(b)=u⁴), identity; H𝔽_p, H𝔽_q: b↦0 so A[b⁻¹]=0, T(n)⊗A=0 for n≥1 but S[1/p]⊗H𝔽_q=H𝔽_q≠0 | holds for n≥1; fails at n=0 | Checks added |
| §4.30a wrong model (invert a) | p=2 | a²=4b, ηa=0 ⇒ ko[a⁻¹]=KO[1/2], π_*=ℤ[1/2][a^(±1)]; T(1)⊗KO[1/2]=0 at p=2 vs T(1)⊗ko≠0 (KU detected by T(1)) | wrong model excluded | Check added |
| §8.6 via §4.30a | A=ko, A=0; i=2,3 | i=2: L_T(2)K(ko)≃L_T(2)K(KO); i=3: ht(ko)=1 ⇒ L_T(3)K(A)=0 by §6.1; A=0: 0→0 | consistent with existing Checks | route and Needs cite §4.30a |
| §6.1a E(A)=E(k)⊗_𝕎(k)𝕎(A), 𝔪-completed | A=k, A=0, A=L algebraically closed; wrong model: base change over S_p^∧ | A=k gives E(k); 𝕎(0)=0 gives 0; π_*(E(A)/𝔪)=A[u^(±1)], π₀E(L)/𝔪=L; over S_p^∧ with k=A=𝔽_(p²): π₀=W(k)⊗_(ℤ_p)W(k)=W(k)×W(k), rank 2 ≠ 1 | base change must be over 𝕎(k) | route rewritten |
| PrismaticCohomology §0.65 contract | A=𝔽_p, 𝔽_p[t^(1/p^∞)] | W(𝔽_p)=ℤ_p, identity Frobenius; Witt Frobenius bijective with reduction A | matches supplier Checks | contract added |
| HabiroCohomologyFoundationsPartII §0.1 contract | A=𝔽_p at p=2,3; A=0 | 𝕎(𝔽_p)=S_p^∧, π₁=ℤ/2 at p=2, 0 at p=3; 𝕎(0)=0 | matches supplier Examples | contract added |
| §8.1a Mot_κ(A), K′₀ | A=0; A=Hk; X→Y→Z; triangle ring R; h_0 before localization | Mot_κ(0)=0, K₀=K′₀=0; [k]↦1, [Σk]=−1; [Y]=[X]+[Z] via Ex(M); π₀Kconn(F_κPerf R)=0, π₀Kconn(Σ_κPerf R)=ℤ vs π₋₁Kconn(Perf R)=0 ⇒ not split exact; π₀Hom(h_(Perf A),h_0)=π₀S=ℤ before, 0 after | all consistent; the wrong models (all exact sequences imposed; no zero generator) are excluded | new target |
| §8.3 route via §8.1a | G=1; A→A×A; KO→KU | transfer id hits 1; (a,b)↦a+b sends (1,0)↦1; [KU]=2 in K₀(KO)⊗ℚ, a rational unit (cmnn20 Example 5.9) | consistent | route and Needs rewritten |
| §9.6 vanishing | p=2,3 | p invertible on THH(ℤ[1/p]) ⇒ TC(ℤ[1/p])/p=0; rationally THH(ℤ[1/p])⊗ℚ=ℚ≠0 | consistent | derived, contract removed |
| §9.6 nonvanishing | p=2,3; 𝔽_p | ℤ_p/p=𝔽_p perfect ⇒ K/p≃TC/p in degrees ≥0; fiber bounded (π₋₁TC(𝔽_p)=ℤ_p vs K₋₁(𝔽_p)=0); ht(Hℤ_p)=0 ⇒ ht K(ℤ_p)=1 ⇒ L_T(1)K(ℤ_p)≠0; agrees with lmmt line 1097 at odd p (L_K(1)TC(ℤ)≃L_K(1)S⊕ΣL_K(1)S⊕Σ³KU_p≠0) | consistent at all p | derived, contract removed |
| §9.7 (contrast clause removed) | r=1,2; union | stage values L_K(1)TC=0 (K(ℤ/p^r)-module); union ≠0 by §9.6 | consistent | statement narrowed to the counterexample |
| §10.4 THH assembly | G=1, ℤ, C₂×C₂, S₃; R=0, S | G=1, ℤ: terminal orbit; C₂×C₂: four summands Σ∞_+BG, identity summand Σ∞_+(EG×_G E_Cyc G)≃Σ∞_+BG; S₃: LBS₃=BS₃⊔BC₂⊔BC₃, all from cyclic subgroups; omitting a C₂ loses a summand; R=0 gives 0 | consistent | THH step owned here, Check added |
| Downstream consumers (ChromaticHomotopyTheory) | its supplier paragraph, Layer 4 Dependencies, §5.1 Needs, Part II text | §§4.2–4.16, 4.18–4.33; §§4.3–4.4, 4.14, 4.20–4.24; §4.3; §§5.2, 5.5, 6.5 (+§§4.4, 4.6, 4.19 in Part II Checks) | matches its head | sentence replaced |

## Coordination the replies should mention

- ChromaticHomotopyTheory must follow H02 and H03. Its supplier paragraph imports "§§4.13–4.16 … including the sharp bound m=n+1", and its Check "At n=1 the sharp bound is 2" relies on it; the sharp value now belongs after its own §4.2. Its §5.1 restates §4.30a.
- RefinedTraceMethods must state the two TC/p colimit statements, which its §4.17 route already uses. Its Downstream consumers line still says this roadmap uses its localizing motives; after H04 it uses §§2.6, 2.8–2.10, 4.9–4.11 and 4.17 instead.
- HomotopySpheres decides whether §3B takes on the stable James splitting (H05).
- Outside this review: ChromaticHomotopyTheory's Part II asks this roadmap for gap:bhls-purity-comparison (§5.2, trace for ℤ-homotopy fixed-point rings) and gap:bhls-bp-redshift (§6.5, BP⟨h⟩ model). §§5.2 and 6.5 here do not state either. Nothing was changed for them, because no reviewer raised them.
- The review also asks for the label to go back to `awaiting-review`; that is a GitHub action for the worker.
