# Review of CohomologyComparisonsPartII (pull request #1364 at c9807db)

**Verdict:** accepted

Incremental re-review of the 17 changed lines since 8858e49 (10 insertions, 7 deletions, all in `TauCetiRoadmap/CohomologyComparisonsPartII/README.md`; `Suggested.lean` unchanged; no file changed outside the folder). No finding: 0 P1, 0 P2, 0 P3. As in the previous review, the verdict is conditional on the 34 declared supplier contracts and is readiness for a human's final approval, not approval.

## Previous findings

The previous report (head 8858e49) recorded no finding (0 P1, 0 P2, 0 P3), so there is nothing to account for under R01, R02, …. The change set is not a repair of an AI finding; it extends the rigid syntomic fibre of Layer 2 to every integer weight and adds a boundary rescaling identity in §3.4, both of which the consumer PadicHodgeRegulators (at its open head) requests under its own gaps `rigid-negative-weights` and `normalized-syntomic-boundary`.

## Verified sound

### Gate, dependency check, elaboration

The worker's gate at c9807db reports every check passed (`set_option=0 … build=0 OK`). Independently ran the prescribed dependency check with `--movable` against the supplied merge order and main content tree:

```text
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Independently elaborated `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean` with `lake env lean` from the pinned worktree: exit 0, no error, no warning. The file is unchanged since the previous review: one `import Mathlib`, the module docstring naming the eleven headline groups as not statable at the pins, the namespace, and zero declarations. Hence zero signatures to compare and zero sorried statements to probe for padding; nothing in the diff adds or removes a headline. `git diff --stat origin/main...HEAD` outside the folder is empty. The 34 contract slugs in the README's `## Exact supplier contracts` equal the 34 `gaps` slugs of `packages/CohomologyComparisonsPartII/design/plan.json` (checked by script: no slug in either direction is missing); the diff touches no contract.

### The changed passages, line by line

| README line | Change | What was checked |
|---|---|---|
| 326 (§2.1) | sp_r for every integer r, F^r=F^0 for r≤0, hypothesis r∈ℤ | The `relative-hodge` contract (README line 92) already requests F^rRΓ_dR(T/L) for r∈ℤ from normal-crossings compactifications, so the supplier of F^r for r<0 is named. BesserI Definition 5.1 (BesserI line 652–655) defines Fil^k only for k∈ℤ≥0 as RΓ(Y,Ω^{≥k}(log D)); Ω^{≥k}=Ω^{≥0} for k<0, so F^r=F^0 for r≤0 is the only extension consistent with the source's definition. The API bullet "sp_(r+1) factors through F^(r+1)→F^r" is the identity factorisation for r<0. |
| 344 (§2.2) | weight r any integer; p^(−r) a positive power of p for r<0; BesserI line 721 cited for r≥0 | BesserI line 721 reads "for any n ∈ ℤ≥0" (Proposition 6.2), and Definition 6.1 (line 712–714) uses Fil^n with the same n; the roadmap correctly attributes the nonnegative range to the source rather than to the construction. The fibre f_r(a,b)=((1−p^(−r)φ)a, bc(a)−sp_r(b)) needs only p^(−r)∈ℚ_p^×, φ and sp_r, all present for r<0. |
| 359 (§2.2 Check) | r<0 point computation | Recomputed (row B02 below): f is bijective, all H^q vanish; the wrong model F^r=0 gives H¹=ℚ_p. |
| 364 (§2.3) | r,s∈ℤ | BesserI Definition 6.5 (line 752–759) forms the cup product on Cone(1−Φ_n)×Cone(1−Φ_m)→Cone(1−Φ_{n+m}) with Φ_n=Φ/p^n; the formula uses only Φ_nΦ_m=Φ_{n+m} and multiplicativity of Φ, which hold for all integers (row B04). The unramified single fibre at r=−1 is recomputed in row B05. |
| 371 (§2.3 route) | F^r·F^s⊂F^(r+s) for all integers with F^r=F^0 for r≤0 | F^rF^s⊂F^{max(r,0)+max(s,0)}⊂F^{r+s} since max(r,0)+max(s,0)≥r+s; instances r=−1,s=1 and r=−2,s=1 in row B03. |
| 383 (§2 Examples) | point in weights 0, 1 and −1 | Matches the three point Checks of §2.2. |
| 457 (§3.4 API bullet) | undivided rational presentation and ω_Q∘δ_U=p^r·δ_D | ω: S′_n(r)→S_n(r) has legs (p^r on J, id on O) at EN line 193–195, as §3.3 states. Rationally J_Q=Fib(O_Q→RΓ_dR/F^r) by the `crystalline-filtered-quotient` contract, so Fib(p^r−φ:J_Q→O_Q)=Fib((p^r−φ,can):O_Q→O_Q⊕RΓ_dR/F^r) and likewise for 1−φ_r; p^r on J_Q is p^r on O_Q and on the quotient. Chain-map identity and boundary identity recomputed in rows B06–B08. |
| 467 (§3.4 Check) | Spec ℤ_p, r=1 witness | Recomputed in row B07; the negative control (legs (p,id,id)) in row B08. |
| 539 (§4.3 route) | locator reworded: "TsujiNearby, proof of Theorem 4.2 in its §4, pp. 554–555 … proof of Theorem 5.1 in its §5, pp. 558–561" | Wording only; the proof of Theorem 4.2 starts at TsujiNearby line 892 under the printed header 554 (line 891) and runs onto 555 (line 923); the proof of Theorem 5.1 starts at line 1074 on printed 559 (header at line 1064) and ends on 561 (line 1139), with its two special cases of Theorem 4.2 (Proposition 5.5, line 1030–1031) on 558. The range 558–561 covers the proof with the inputs it applies; the previous review accepted the same pages. |
| 923 (Downstream consumers) | "the rigid syntomic fibre in every integer weight" | PadicHodgeRegulators at its open head, README line 98, requests exactly this extension (F^n=F^0 for n<0, factor p^(−n)φ retained); its line 100 and line 1018–1024 use ω_Q:U_Q≃D_Q and the normalized undivided boundary p^(−r)δ_U with α^norm=ω_Q^(−1)∘δ_D, which is the identity ω_Q∘δ_U=p^r·δ_D of §3.4 read backwards. Its Check (p=5, r=2: the unscaled boundary gives 25·exp_BK) agrees with p^r=25. No convention drift between supplier and consumer. |

No other passage of the README states the rigid syntomic fibre with a weight restriction that the change contradicts: the integral lattices of the Conventions (line 29) and §4.1, the log-syntomic complexes of §§3.1–3.4 and the étale period contract `rigid-syntomic-etale-period` (line 90) keep r≥0, which is the range their divided powers and lattices need; §§7.4–7.5 use H_rsyn at r≥0, a sub-range of the new definition. The seeded sample targets that the diff touches are 2.1, 2.2 and (through ω) 3.3; the rest of the sample is unchanged since the previous review, which read each at its locator.

### Adversarial pass

Rows A01–A150 of the previous report (head 8858e49) carry forward for every statement the diff leaves untouched: Conventions A01–A07; §1.1–1.6 A08–A38; §2.1 A39–A41 (sp, bc, empty scheme, generic-only Spec K); §2.2 A42–A44 (r=0, r=1 point, generic-only fibre); §2.3 A45–A48; §3.1–3.3 A49–A60; §3.4 A61–A66; §4.1–4.5 A67–A90; §5.1–5.3 A91–A103, A150; §6.1–6.7 A104–A128; §7.1–7.5 A129–A149. The rows below are the computations for the changed statements, in the fibre coordinates of the Conventions (Fib(f)^q=A^q⊕B^(q−1), d(a,b)=(da,f(a)−db), connecting image of b is (0,b)).

| ID / statement | Instance tried | Values on the two sides, or valid versus wrong model | Result / change |
|---|---|---|---|
| B01 §2.1 filtration for r≤0 | r=−1,−2 on a point and on G_m | F^(−1)=F^(−2)=F^0=RΓ_dR; sp_(−1)=sp_0=sp_X; filtration map F^0→F^(−1) is id, so "sp_(r+1) factors through F^(r+1)→F^r" at r=−1 reads sp_0=sp_(−1)∘id | Retain; the bullet is a tautology for r<0 and a genuine factorisation for r≥0. |
| B02 §2.2 negative-weight point | V=ℤ_p, r=−1,−2; p=2 and p=3 | A=C=F^rRΓ_dR=ℚ_p in degree 0, φ=id; f(a,b)=((1−p^|r|)a, a−b) has matrix [[1−p^|r|,0],[1,−1]], determinant −(1−p^|r|)=1, 3, 2, 8 for (p,r)=(2,−1),(2,−2),(3,−1),(3,−2); bijective, all H^q=0. Wrong model F^r=0: f(a)=((1−p^|r|)a,a), injective with cokernel ℚ_p, H¹=ℚ_p | Check correct; the wrong model is discriminated. |
| B03 §2.2/2.3 ramified and generic-only negative weight | V=ℤ_p[π], π²=p, X=Spec V, r=−1; X=Spec K over V, r=−1 | A=ℚ_p, C=K, F^(−1)RΓ_dR=K; f(a,b)=((1−p)a, a−b) with bc the inclusion ℚ_p→K: injective (a=0 then b=0), surjective (a=x/(1−p), b=a−y); all H^q=0. Generic-only: A=C=0, fibre =F^(−1)RΓ_dR=RΓ_dR(Spec K/K)=K, H⁰=K | Agrees with the "X_k empty" Check at every weight; no hidden unramified assumption. |
| B04 §2.3 products in all weights | r=−1,s=2 and r=−2,s=1; Φ_r=p^(−r)Φ | Φ_rΦ_s(xy)=p^(−r−s)Φ(x)Φ(y)=Φ_(r+s)(xy); filtered terms F^0·F^2⊂F^2⊂F^1=F^(r+s) and F^0·F^1⊂F^1⊂F^0=F^(−1) | BesserI (6.3) product formula closes for all integer weights; retain. |
| B05 §2.3 unramified single fibre, r<0 | K=K0=ℚ_p point, r=−1 | Fib((1−pφ)sp_(−1):RΓ_dR→RΓ_rig)=Fib((1−p)·id:ℚ_p→ℚ_p), 1−p∈{−1,−2}≠0, acyclic; matches B02 | Elimination a=sp_r(b) uses no inverse of sp at negative weight either. |
| B06 §3.4 ω_Q between the two presentations | General r; legs (p^r on source O_Q, id on target O_Q, p^r on quotient) | (id,p^r)∘(p^r−φ,can)=(p^r−φ, p^r·can); (1−p^(−r)φ,can)∘p^r=(p^r−φ, p^r·can): equal | Chain map; agrees with §3.3's legs (p^r,id) on J and O, since p^r on J_Q=Fib(O_Q→RΓ_dR/F^r) is p^r on both terms. |
| B07 §3.4 boundary identity witness | X=Spec ℤ_p trivial log, r=1; general r | Undivided x↦((p−1)x,x), divided x↦((1−p⁻¹)x,x), both injective ℚ_p→ℚ_p², H¹=coker of dimension 1; (0,b) is not in the image for b≠0 (image forces x=b, first coordinate (p−1)b≠0), so δ_U(b)=[(0,b)]≠0; ω_Q(0,b)=(0,pb), hence ω_Qδ_U(b)=pδ_D(b); for general r the same with p^r | Identity ω_Q∘δ_U=p^r·δ_D holds; at r=0 the quotient is 0 and both sides vanish, consistent with "the two constructions coincide at weight zero". |
| B08 §3.4 wrong legs control | Legs (p,id,id), r=1, same point | (id,id)∘(p−φ,can)(x)=((p−1)x, x) versus (1−p⁻¹,can)∘p(x)=((p−1)x, px); second components differ by the factor p for x≠0 | Not a chain map; the Check's negative control is correct. |
| B09 §3.4 consumer convention | PadicHodgeRegulators head line 100, 1018–1024, p=5, r=2 | Supplier: δ_D=p^(−r)ω_Qδ_U, so ω_Q^(−1)δ_D=p^(−r)δ_U=δ_U/25; consumer: unscaled boundary is 25·exp_BK, scaled by 1/25 | Same normalisation on both sides of the supply edge. |
| B10 §4.3 locator | Printed headers at TsujiNearby line 891, 923, 1029, 1064, 1139 | 554, 555, 558, 559, 561 | Pages as cited; wording change only. |

### Library and cross-roadmap checks

The diff adds no Lean declaration and no library citation, so the 17 pinned files opened in the previous review stand (Mathlib pin `6b7abb3c`, Tau Ceti pin `a91d3aaf`); nothing new to open. Cross-roadmap citations in the changed lines: `relative-hodge` (this roadmap's own contract, README line 92, with supplier CohomologyComparisons §§2.14,6.3) and the consumer PadicHodgeRegulators (read at its supplied open head, lines 90–100 and 1018–1024). The worker's `roadmaps resolve` found no unresolved citation in the README. Ownership: the integer-weight extension stays with this roadmap, where the consumer's gap `rigid-negative-weights` places it; no other roadmap on main or at a supplied head defines a rigid syntomic fibre in negative weights (the ownership search of the previous review covered the object; the consumer head is the only sibling that mentions negative rigid weights, as a request). Ownership against open pull requests whose files the brief does not supply was not checked.

## Not verifiable

- As in the previous review, the cited sections of AInfCohomology, CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology, ColemanIntegration and PrismaticCohomologyPartIII are not in the supplied main content tree, and the brief gives no open-head location for them; the diff adds no new citation of them. BesserII remains settled uncertified and is not used by any changed line.
- The OCR of BesserI Definition 6.1 (line 712–714) drops the cone's arrows; the twist range was read from line 721 and Definition 5.1 (line 652), and the fibre formula from the cone description at line 741–745, which is legible.

## Source issues

- none new in the changed passages; the ten source issues of the previous report stand.
