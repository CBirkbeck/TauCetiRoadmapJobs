# Review of EllipticModularityEffectiveComparisons (pull request #1810 at aa5fb55)

**Verdict:** rejected

This is an incremental re-review of the 4 lines changed since 3e1809c (2 insertions, 2 deletions, both in `README.md`: the Scope paragraph at line 11 and the Downstream consumers paragraph at line 1696). `Suggested.lean` is byte-identical to 3e1809c and to 2a7d458. The change repairs the stale part of the previous R01 (the consumer's contract is now described as EC.0–EC.6 with a section-by-section correspondence) and introduces no new problem: every section it cites, here and in the four consumers and the sibling, resolves at the head named below. The substance of R01 is untouched and cannot be touched inside this folder: EllipticCurveModularityPartII is still open, still earlier in the merge order, and still the roadmap every consumer cites. The round-5 repair report answers H01 by agreeing that the duplication holds and leaving the choice to a human; that reason resolves nothing in the folder, so the finding is raised again. The gate passes with the targeted build, the dependency check shows 0 problems, and elaboration gives exactly the 14 `sorry` warnings.

## R01 (P1) — Re-plans EllipticCurveModularityPartII, an open roadmap pull request earlier in the merge order

Re-raised: H01 (GATE-EllipticModularityEffectiveComparisons~5).

**Location.** `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, Layers 0–5; line 1696 now states the correspondence itself: "ErdosProgressionPowers consumes these comparisons through its supplier contract “From TauCetiRoadmap.EllipticCurveModularityPartII”, seven items labelled EC.0–EC.6, and cites EllipticCurveModularityPartII, which plans the same results". Also `Suggested.lean` lines 49–135 and 149–265.

**Claim.** Layers 0–5 own Martin's newspace formula and sharp bound, the removed-prime exponent bound, Kraus's thresholds and realizations, the Mazur–Kenku classifications with the two uniform irreducibility bounds, Lemos's surjectivity theorem, the quantitative isogeny bound and the `GeometricTorsion` carrier.

**Witness.**
- `roadmaps list` shows #1491 EllipticCurveModularityPartII open at head 95f7c2f (unchanged since the previous review); its README line 7 says "this Part II owns the six comparison layers below", and its `Suggested.lean` line 174 declares `GeometricTorsion` on the same carrier as this folder's line 149.
- The merge order lists it at line 194, ErdosProgressionPowers at 195 and this folder at 284.
- ErdosProgressionPowers (head 5a2de2e, one commit later than at the previous review) line 82: "owned by EllipticCurveModularityPartII Layers 1–6; the contract EC.0–EC.6"; its table at lines 654–660 cites the sibling's §§1.4, 2.2, 1.5–1.8, 4.7, 5.4–5.5, 6.18 and 5.1.
- AdelicImagesAndModularCurves (9037f3d) lines 343–347 and 404–405, EllipticCurvePeriodsAndModularParametrizations (7a356fe) lines 92, 299, 1838 and FaltingsFinitenessAndIsogenyTheoremsPartII (f49680f) lines 13, 132, 362–364, 951–953 cite the sibling; none of the three mentions this folder (0 occurrences).
- The round-5 repair report (H01) lists the section-by-section correspondence of every layer here to a sibling section and concludes "No headline of this folder is absent from the sibling."

**Why the settled reason fails.** H01 says the decision "stays with a human". That is true, but it leaves the folder as submitted in breach of the binding rule that what another roadmap plans is imported, never planned again; the finding stands until a human closes one of the two pull requests. The new line 1696 makes the breach explicit rather than removing it.

**Repair.** None inside this folder. A human decides:
- **Close #1810.** The consumers and the merge order already point at #1491.
- **Close #1491 and keep this folder.** Then re-point the four consumers to the counterpart sections line 1696 now lists (EC.0 §0.16, EC.1 §1.6, EC.2 §§2.1–2.3, EC.3 §3.17, EC.4 §§4.21–4.22, EC.5 §5.28, EC.6 §4.0; §§4.7, 5.1, 4.17, 5.25, 5.3a for the other three), move this folder before ErdosProgressionPowers (its last supplier AnabelianGeometryAndNonabelianChabauty is at line 172), and give an owner to the sibling's §1.8 majorants and §6.0f minimal period subvariety, which line 1696 says have no counterpart here and which ErdosProgressionPowers (EC.2) and FaltingsFinitenessAndIsogenyTheoremsPartII (lines 362–364) consume.

## Previous findings

- R01 — partly repaired: the stale clause is gone; line 1696 now reads "seven items labelled EC.0–EC.6 … The counterparts here, with the same hypotheses, are: EC.0 … §0.16 … EC.6 … §4.0". The re-plan itself is unchanged: #1491 open at 95f7c2f, merge order 194/195/284, all four consumers cite the sibling. Raised again above.

## Verified sound

**Gate, dependency check, build.**
- **Gate.** Rerun with `--build` against `origin/main`: `OK`, exit 0, every scanner 0, `depcheck=0`, `outside-folder=0`, `build=0`. This matches the worker's gate at aa5fb55.
- **Dependency check.** With `--movable` against the board's order and the content checkout:

      depcheck: 244 roadmaps, 2465 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line. The diff adds no `*Needs:*` edge; the sibling it names in prose is earlier in the order (194 < 284), so even as a citation it is not upward.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** `lake env lean` on `Suggested.lean` reports exactly 14 `declaration uses sorry` warnings at lines 79, 84, 93, 104, 118, 135, 182, 188, 194, 201, 238, 246, 256 and 265, and nothing else. Pins: Mathlib f6090c70, Tau Ceti 358314d4.
- **Signatures and padding probe.** `git diff 2a7d4581 HEAD` on `Suggested.lean` is empty, so the `#check @name` elaboration of all 24 declarations and the one-tactic probe of PRREVIEW~3 were run on these bytes: every type equals its README statement, no section binder lost, nothing closed in one tactic. The worker's `signatures.md` again lists 24 declarations with 0 dropped binders.

**The changed paragraph, resolved at every cited head.**
- ErdosProgressionPowers 5a2de2e, contract heading line 647, rows 654–660: EC.0 §1.4 (12g₀⁺(N)≤N+1), EC.1 §2.2, EC.2 §§1.5–1.8, EC.3 §4.7, EC.4 §§5.4–5.5, EC.5 §6.18, EC.6 §5.1 (`GeometricTorsion`, `torsionRepresentation`, `FullRationalTwo`: exactly four rational points killed by 2). Line 1696 describes exactly these seven.
- "With the same hypotheses", checked row by row against this README: §0.16 (line 358: every positive N, weight two, trivial character) = EC.0; §1.6 (line 443: ℓ≥3, E[ℓ] irreducible, p≠ℓ, p∥M, ℓ ∣ ord_p Δ) = EC.1; §§2.1–2.3 define the sharp F, G, H and the README correctly says the §1.8 majorants are absent (sibling line 288 "Sharp thresholds and numerical majorants"; "majorant" occurs here only in a remark); §3.17 (line 775: full rational two-torsion, ℓ≥5, irreducible of Serre weight two, prime-to-ℓ conductor N, ℓ>H(N)) = EC.3; §4.21 (ℓ≥11, one rational two-point) and §4.22 (ℓ≥5, full two-torsion) = EC.4; §5.28 (line 1676: End_ℚ̄(E)=ℤ, rational cyclic isogeny of degree >1, p>37) = EC.5; §4.0 (line 812) uses `GeometricTorsion`, `torsionModule`, `torsionRepresentation`, declared at `Suggested.lean` lines 149, 160, 165, and the full-two-torsion condition is written in place at lines 142 and 203 as `Nat.card (AddSubgroup.torsionBy E.toAffine.Point (2 : ℤ)) = 4`, as line 1696 says.
- AdelicImagesAndModularCurves 9037f3d lines 343–347: EM2 §5.0a (Mazur), §5.0b (Kenku), §6.0b (j-images of Y₀(11), Y₀(17), Y₀(37)), §6.0f (isogeny-degree bound over a number field); table rows 404–405 the same. EllipticCurvePeriodsAndModularParametrizations 7a356fe lines 92, 299, 1838, 1888, 1892: §§5.0a–5.0b only. FaltingsFinitenessAndIsogenyTheoremsPartII f49680f lines 13, 362–364, 951–953: §6.0f for the quadratic isogeny estimate and the minimal period subvariety. Line 1696 states exactly these.
- Sibling 95f7c2f headings: §1.8 at 288, §5.0a at 523, §5.0b at 553, §5.1 at 565, §6.0b at 650, §6.0f at 727; §6.0f (lines 729–745) contains both the bound B(d,H)=10⁷d²(max{H,985}+4 log d)² and the minimal period subvariety A_ω, so the counterpart §5.3a here and "no counterpart" for A_ω are both right.
- Counterpart headings here: §0.16 at 356, §1.6 at 441, §§2.1–2.3 at 466/490/514, §3.17 at 773, §4.0 at 810, §4.7 at 925, §4.17 at 1049, §4.21 at 1097, §4.22 at 1109, §5.1 at 1180, §5.3a at 1232, §5.25 at 1624, §5.28 at 1674: all exist.
- Scope line 11: "the roadmaps that consume such comparisons, and the supplier they cite, are listed under Downstream consumers" is true of line 1696. The readme-ids scanner is 0: every backticked name in the new text is declared.

**Ownership against open work.** The overlap scan lists no open pull request that changes this roadmap and no dropped id in either direction; closest is #1491 (0.50), which is R01. The sibling checkouts of the four consumers were read at the heads above.

**Declared gaps.** The diff touches no `gap:` token; the eight slugs under `## Exact supplier contracts` are unchanged and equal the plan's `gaps`.

**Sampled locators.** None of this round's 15 seeded targets falls in a changed passage. I read four at their locators anyway:
- **§0.1.** martin-2003 lines 77–88, p.2, Definitions 1A–1D: s(p)=1−1/p, s(p²)=1−1/p−1/p², s(p^α)=(1−1/p)(1−1/p²) for α≥3; ν∞(p²)=p−2, ν∞(p^α)=p^(α/2−2)(p−1)² for even α≥4, 0 for odd α; ν₂ at 2,4,8 = −1,−1,1, then 0; p≡1 mod 4: 0,−1,0; p≡3 mod 4: −2,1,0; ν₃ likewise with 3,9,27 and the mod-3 classes. The README's `localTerms` table at line 138 is identical entry by entry.
- **§0.8.** martin-2003 line 747, Lemma 16, p.14: for every prime p, g₀⁺(p,2)≤(p+1)/12 with equality iff p≡11 mod 12. Matches.
- **§4.19.** No source needed: with T≠T′ of order 2, the composite E/T→E→E/T′ has degree 4 and kernel {P : [2]P∈T′ after the dual}, which contains no copy of E[2] since T∩T′=0, so it is cyclic.
- **§5.2.** serre-1981 line 2530, Lemme 18′, printed p.397: the inertia group of H=PG_ℓ at ℓ contains an element of order ≥(ℓ−1)/4; its proof (lines 2533–2560, pp.397–398) treats the Tate case and potential good reduction with e∈{1,2,3,4,6} and uses ℓ≠2,3, matching the hypothesis p≥5.

The other sampled targets were verified or computed in PRREVIEW~3 to ~5 and are carried below.

**Adversarial pass.** Rows for the changed statements carry values computed in this review; the untouched statements carry the rows of PRREVIEW~3, ~4 and ~5, whose text and Lean statements the diff leaves unchanged.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Line 1696: EC.0–EC.6 ↔ §§0.16, 1.6, 2.1–2.3, 3.17, 4.21–4.22, 5.28, 4.0 | the seven rows of ErdosProgressionPowers lines 654–660 | each row's statement and hypotheses equal the counterpart's "Throughout this subsection" line (values listed above); EC.2's §1.8 majorants absent here, as stated | sound | none |
| Line 1696: EC.6 full two-torsion "stated in place" | `Suggested.lean` 142, 203 | `Nat.card (torsionBy … 2) = 4` in both; the consumer's `FullRationalTwo` is "exactly four rational points killed by 2": 4 = 4 | sound | none |
| Line 1696: AIMC cites §§5.0a–5.0b, 6.0b, 6.0f | AIMC 343–347, 404–405 | the four sections named, with Mazur, Kenku, the three j-images and the degree bound 10⁷d²(max{h_F,985}+4 log d)² | sound | none |
| Line 1696: ECP cites §§5.0a–5.0b | ECP 92, 299, 1838, 1888, 1892 | only §§5.0a–5.0b occur (5 lines) | sound | none |
| Line 1696: FFIT-II cites §6.0f for the bound and A_ω; A_ω has no counterpart here | FFIT-II 13, 362, 951; grep here | §6.0f cited for both; "period subvariety" and "A_ω" occur 0 times in this README | sound | none |
| Line 1696: counterparts §§4.7, 5.1, 4.17, 5.25, 5.3a | headings at 925, 1180, 1049, 1624, 1232 | Mazur prime degrees; CM exceptions {11,19,43,67,163} ↔ sibling §5.0a's non-CM refinement; Kenku composite; j-tables at 11, 17, 37; B(d,h_F) bound | sound | none |
| Line 1696: ErdosProgressionPowers "cites EllipticCurveModularityPartII … as their supplier" | EPP 82, 647 | both name the sibling; 0 occurrences of this folder's name | sound (it is R01) | none in-folder |
| Scope line 11 | line 1696 | consumers and supplier listed there, as promised | sound | none |
| §0.1 `localTerms` (sampled) | p=2,e=3; p=7,e=2; p=5,e=4 | (1−1/2)(1−1/4)=3/8, v∞=0, v2=1, v3=−2, m=0; s=1−1/7−1/49=41/49, v∞=5, v2=1, v3=−1, m=0; v∞=5⁰·16=16, v2=0, v3=0; all equal Martin's Definitions 1A–1D | sound | none |
| §0.8 (sampled) | p=11, 13, 23, 2 | 12·1=12=p+1 at 11; g=0 at 13 (0<14); g=2 at 23 (24=24); g=0 at 2 (0<3) | sound | none |
| §4.19 (sampled) | T=⟨(0,0)⟩, T′=⟨(a,0)⟩ on y²=x(x−a)(x−b) | degree 2·2=4; kernel meets E[2] of E′ in the image of T′ only (T∩T′=0), so no (ℤ/2)² inside: cyclic | sound | none |
| §5.2 (sampled) | p=5, 17, 37 | (p−1)/4 = 1, 4, 9; Serre's parenthesis: for p>17 the order exceeds 4 | sound | none |
| §0.10, §§0.12–0.14, §0.16, §§1.2–1.3, §2.3, §3.7, §3.7a, §3.10, §3.17, §4.7, §§4.10–4.15, §§4.17, 4.21, 4.22, §5.1, §5.3a, §5.3b, §§5.7–5.28, the four Lean predicates and the Conventions | as in PRREVIEW~3, ~4, ~5 | the rows of those reports with their values (N≤4000 equality set {35} ∪ {primes ≡11 mod 12}; H(1)=1, H(4)=4, H(11)=13+4√3; 10⁷·985²=9 702 250 000 000; genera 3,5,7,8,8 at 39,65,91,125,169; p=23 Check g=2, dim J₀(23)♯=3; etc.); no text or Lean statement among them changed | sound (carried) | none |

## Not verifiable

- kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-169-corrigendum and kenku-1982 (§§4.10–4.17): settled as uncertified (paywalled); banwait-najman-padurariu lines 56–59 was read for §4.15 in PRREVIEW~5.
- The computer verifications behind Martin's tables beyond N=4000, Lemos's database runs and BPR's Proposition 5.9 are unchanged by this head and were not rerun.

## Source issues

- none new at this head. (The bilu-parent-rebolledo line 768 note of PRREVIEW~5 was answered in the round-5 repair report, H04, and is not repeated.)
