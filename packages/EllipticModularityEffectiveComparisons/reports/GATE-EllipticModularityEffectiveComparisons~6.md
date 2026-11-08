# GATE-EllipticModularityEffectiveComparisons~6: answers to the human review of `aa5fb55`

The review (CBirkbeck, 2026-11-08T06:28:05Z) makes one point: finding F01, the re-plan of EllipticCurveModularityPartII. That is H01.
- Its "Previous findings" entry R01 restates F01.
- Its "Verified sound", "Not verifiable" and "Source issues" sections raise nothing new.
- It contains no instruction addressed to the worker beyond its finding, and nothing in it or in the files read was suspicious.

No file changed this round, so there is no commit. The branch head stays at `aa5fb55`.

## H01 (CBirkbeck) — answered

The duplication holds at the current heads, and no repair is possible inside this folder: importing every planned target from EllipticCurveModularityPartII would leave this roadmap with no target of its own. The folder is left unchanged, and the choice between the review's two options (close #1810, or close #1491 and keep this folder) stays with a human. The evidence below confirms the review's facts and adds what the second option would also have to cover.

**The review's facts hold unchanged at these heads.**
- EllipticCurveModularityPartII is still at `95f7c2f`. Its `README.md` line 7 says "this Part II owns the six comparison layers below", and its `Suggested.lean` line 174 declares `GeometricTorsion` on the same carrier as this folder's line 149.
- Its `README.md` line 1058 names ErdosProgressionPowers's "generic comparison contract" EllipticModularityEffectiveComparisons and says the sibling's Layers 1–6 provide it. So the sibling already claims this folder's scope by name, although ErdosProgressionPowers at `5a2de2e` no longer uses that name (0 occurrences).
- Merge order: the sibling is at line 194, ErdosProgressionPowers at 195 and this folder at 284.
- The consumer heads are as the review states: ErdosProgressionPowers `5a2de2e` (line 82; contract heading at line 647, rows at 654–660), AdelicImagesAndModularCurves `9037f3d`, EllipticCurvePeriodsAndModularParametrizations `7a356fe` and FaltingsFinitenessAndIsogenyTheoremsPartII `f49680f`.

**Every Lean headline here has a counterpart in the sibling.** Three of them have no Lean twin in the sibling's `Suggested.lean`, so they were checked against its README this round:
- `kraus_prime_power_congruence` (line 118) is the "filtered-form version" in sibling §4.3 (line 436). Both have L=lcm(N,4), primes q with 6q≤μ(L), good-prime congruences a_q≡q+1 mod Pᵐ, the bad-prime condition (q+1)(a_q−1)∈Pᵐ for q∣2N with q²∤4N, and the conclusion at every q∤2N.
- `four_divisible_isogeny_realization` (line 135) is sibling §4.6 (line 466): an isogeny of degree one or two onto a curve with full rational two-torsion.
  - The only difference is that ours quantifies over odd primes not dividing Δ(W) of a chosen integral model. That set differs from the good odd primes in finitely many primes, which the Chebotarev route allows (README line 763).
- `split_normalizer_exclusion` (line 238) is the elliptic-curve form of sibling §6.0f's split-cartan-rational-points (line 751). That is stated for p≥11, p≠13; ours for p>11, p≠13. The sibling's range contains ours, so its statement implies ours.
  - bilu-parent-rebolledo lines 104–105 (Theorem 1.1) read "p> 11"; its line 99 gives the Gross-vector range as 11⩽p⩽10¹⁴. The two roadmaps therefore differ at p=11 only.

**The review's list of what keeping this folder would require is incomplete.** `roadmaps grep` for the sibling's name over main and the 478 open heads finds six roadmaps that cite it as a supplier, not four:
- ErdosProgressionPowers (195), for EC.0–EC.6.
- AdelicImagesAndModularCurves, for §§5.0a–5.0b, 6.0b and 6.0f. It is not in the merge order.
- EllipticCurvePeriodsAndModularParametrizations, for §§5.0a–5.0b. It is not in the merge order.
- FaltingsFinitenessAndIsogenyTheoremsPartII (365), for §6.0f.
- KatoEulerSystems (336, head `903763b`), for §6.0e. Its contract is "From EllipticCurveModularityPartII" at line 471.
- RankOneConverse (373, head `9b5c88a`), for §6.0e. Its contract is at line 151.

Three more roadmaps mention the sibling in prose only: EllipticLegendreCharacterInterfaces (lines 11 and 640), EisensteinIdealAndRationalTorsion (line 13) and EllipticCurveModularityWild3Adic (line 1376).

If #1491 is closed and this folder kept, besides re-pointing the six consumers, three sibling items would need an owner. None has one here:
- **§1.8, the numerical majorants** (sibling line 290), which ErdosProgressionPowers EC.2 consumes. "Majorant" occurs here only in the remark at `README.md` line 464.
- **§6.0f, the minimal period subvariety A_ω with Cartier's smoothness theorem on its existence route**, which FaltingsFinitenessAndIsogenyTheoremsPartII lines 362–364 and 561 consume.
- **§6.0e, unconditional finiteness of A_f(ℚ) when L(f,1)≠0** (sibling line 693), which KatoEulerSystems and RankOneConverse consume. This folder does not own it: it declares it as `gap:modular-rank-zero` to be supplied by EulerSystemsAndKolyvaginSystems (`README.md` line 116), and uses it at lines 971–1047, 1131, 1304, 1322, 1434–1438 and 1630–1634.

The merge-order move is feasible: this folder's suppliers end at AnabelianGeometryAndNonabelianChabauty (172), the others are at 166 or earlier, and five of them are on main (Chebotarev among the completed roadmaps). Moving the folder above ErdosProgressionPowers (195) is therefore possible. The other three consumers in the order (336, 365 and 373) already come after 284.

**Why no edit was made.** The binding rule applied inside this folder would replace each target by a citation of the sibling section listed in the round-5 correspondence, which was rechecked above for the three Lean headlines without a sibling twin. That leaves no target here. An empty roadmap is the first option carried out badly, and closing a pull request is outside this job. Adding the three missing items now would widen the scope and deepen the duplication while the sibling stays earlier in the order.

## Build, gate and dependency check

- `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested` gives "Build completed successfully (9205 jobs)". The only warnings are the 14 "declaration uses `sorry`", at lines 79, 84, 93, 104, 118, 135, 182, 188, 194, 201, 238, 246, 256 and 265.
- The gate at `aa5fb55` (exit 0) prints:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- `gate --depcheck … --movable` prints:

      depcheck: 244 roadmaps, 2465 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.

## Lean signatures

`Suggested.lean` is byte-identical to `2a7d458` (`git diff 2a7d4581 HEAD` on it has 0 lines). The worker's `signatures.md` gives the elaborated types of these exact bytes: 24 declarations, 0 with a dropped section binder. The file has no `variable`, `include` or `set_option` line. No new `#check @name` file was elaborated, because no declaration changed. The three signatures compared above (lines 118, 135 and 238) match their README statements at lines 691, 763 and 1352.

## Ownership, citations and sources

- No construction was added and no notion moved down.
- No later roadmap is cited as a supplier: the six consumers named above occur here only under Downstream consumers or in this report.
- Ownership against open work was checked by object, with the sibling checkouts and `roadmaps grep` over main and the 478 open heads. No citation uses the numbering of an open revision.
- No source was added, and `needs-references.toml` was not written.

## Adversarial pass

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `kraus_prime_power_congruence` (here) ↔ sibling §4.3 | N=11 | L=44, μ(44)=44·(3/2)·(12/11)=72, so q≤12 on both sides. Good primes q∤22: {3,5,7} on both. Bad primes q∣22: q=2 has 4∣44 and is excluded on both; q=11 has 121∤44 and is kept on both | same prime sets | none |
| `four_divisible_isogeny_realization` ↔ sibling §4.6 | E: y²=x³+x, Δ=−64 | #E(𝔽₃)=4 and #E(𝔽₅)=4; for q≡3 mod 4, #E(𝔽_q)=q+1≡0 mod 4; for q≡1 mod 4, x²+1 splits, giving full 2-torsion mod q. Only the point (0,0) is a rational 2-point. Its quotient by ⟨(0,0)⟩ is y²=x³−4x=x(x−2)(x+2), with full rational 2-torsion, degree 2 | both give the same degree-2 isogeny | none |
| `split_normalizer_exclusion` ↔ sibling §6.0f | p=11, 13, 17 | ours: excluded, excluded, covered; sibling: covered, excluded, covered. bilu-parent-rebolledo lines 104–105 read p>11 | sibling ⊇ ours; differ only at p=11 | none |
| §1.8 majorants (sibling only) | N=11, N=1 | at N=11, F♯=(√2+1)²=3+2√2≈5.83<F_K=9 and G♯=(√12+1)²=13+4√3≈19.93<G_K=169; at N=1, g⁺=0 gives F♯=F_K=1 | not stated here | none (human decision) |
| §6.0e ↔ `gap:modular-rank-zero` (line 116) | 11a1, 37a1 | 11a1: L(E,1)≈0.2538≠0 and E(ℚ)≅ℤ/5, finite, on both sides. 37a1: L(E,1)=0 (rank 1), so the hypothesis fails on both sides | same statement; owned there, a declared gap here | none (human decision) |
| Supplier-consumer count of the sibling | `roadmaps grep` hits per roadmap | ErdosProgressionPowers 18, FaltingsFinitenessAndIsogenyTheoremsPartII 10, RankOneConverse 8, KatoEulerSystems 7, EllipticCurvePeriodsAndModularParametrizations 6, AdelicImagesAndModularCurves 2; prose only: EllipticLegendreCharacterInterfaces 2, EisensteinIdealAndRationalTorsion 2, EllipticCurveModularityWild3Adic 1 | six suppliers-of, not four | reported |
| Merge-order feasibility of "keep this folder" | supplier positions | maximum is 172 (AnabelianGeometryAndNonabelianChabauty); next 166, 163, 162, 160; 172<195 | a move above ErdosProgressionPowers is feasible | none in-folder |
| `README.md` line 1696 consumer paragraph | KatoEulerSystems, RankOneConverse | both consume sibling §6.0e, which is not a residual comparison, and this folder treats it as a supplier gap | omission from line 1696 is accurate | none |
