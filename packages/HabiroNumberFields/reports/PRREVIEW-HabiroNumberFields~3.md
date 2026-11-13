# Review of HabiroNumberFields (pull request #1469 at 2c1e0cb)

**Verdict:** accepted

No findings. Incremental re-review of 14 changed lines since 84e120a, all in `TauCetiRoadmap/HabiroNumberFields/README.md` (scope paragraph, K3BlochGroups contract, §1.11, one sentence of §1.13, downstream paragraph). Acceptance is conditional on the declared `gap:bloch-foundations` contract (supplier K3BlochGroups §3.13 and the exceptional finite-field comparison adjoining §§5.4–5.5), which the change leaves as it was.

## Previous findings

- none — the previous report, of 84e120a, lists no finding of its own. Its R01–R04 (of the round before) were recorded there as repaired; the diff touches none of the passages they concern.

## Verified sound

| Statement (changed) | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.11: a preimage in P(O_(𝔮)) of a class of B(F) lies in B(O_(𝔮)) | Fˣ≅O_(𝔮)ˣ×ℤ via v_𝔮; K3BlochGroups §3.1 product formula | Qₛ(M×N)≅Qₛ(M)×Qₛ(N)×(M⊗N), so Qₛ(O_(𝔮)ˣ)→Qₛ(Fˣ) is a split injection; ∂ commutes with ι (§3.5) | Holds for every 𝔮 |
| §1.11: "For ℓ>2 … carried to the old convention by K3BlochGroups §3.16" | eligible ℓ for odd prime power n | ℓ=3 needs n∣4: impossible; so ℓ>2 gives ℓ≥5, \|k(𝔮)\|≥4, F infinite: §3.16's hypothesis \|F\|≥4 holds on both sides | In scope |
| §1.11: b(ξ̄)=r(β) mod n whenever b(ξ)=ι(β) mod n | ℓ=5, n=3, ξ=0, β=2[2]+2[1/2]∈B(ℤ_(5)) | ι(β)=2⟨2⟩=0 in P(ℚ); r(β)=2([2]+[3])=6[3]=0 in P(𝔽₅)≅ℤ/6 | Consistent; contrast next row |
| §1.11: same, kernel of ι in general, residue field 𝔽₅ (outside K3BlochGroups `bloch_dvr_equiv`, which needs more than nine elements) | termwise P¹ reduction of a five-term element of F with X≡Y≡c, 1, 0, ∞ mod 𝔮 | 0; −[w̄]+[w̄]=0; [w̄]−[w̄]+[1]=0; ⟨w̄⟩, zero in Z(k)/⟨ξ⟩ | r(ker ι) lands in ⟨kˣ⟩, killed by 2, so zero mod odd n: requirement not refuted |
| §1.11: "depends only on ι(β)" | β, β′ with ι(β)=ι(β′); b onto B(F) for a number field (K3BlochGroups §4.20) | choose ξ with b(ξ)=ι(β): r(β)=b(ξ̄)=r(β′) in B(k)/n | Follows from the required compatibility |
| §1.11 law: at ℓ=2, P(O_(𝔮))=0 | O=ℤ_(2), any unit u | u odd, so 1−u∈2ℤ_(2): W empty; agrees with K3BlochGroups §4.22 Check B(ℤ_(2))=P(ℤ_(2))=0 | Holds; square stays with the gap contract |
| §1.11 law: reducible at all but finitely many 𝔮 | β=[3]+… over ℚ; symbols u∉{0,1} | u, 1−u have finitely many primes in numerator or denominator; e.g. [3] is in W at every prime except 2, 3 | Holds |
| §1.11 new Check, ℤ_(3) | 2[2]+2[1/2] | 1/2≡2 mod 3, so both in W; ∂=2(2∧(−1))+2(2∧2)=2∧1+0=0; image in P(ℚ) is 2⟨2⟩=0; image in P(𝔽₃)≅ℤ is 4[−1], twice the generator 2[−1] of B(𝔽₃): nonzero mod odd n>1 | Check true and discriminating; ℓ=3 never eligible |
| §1.13: "from the reducible classes of B(F₀)/n" | eta at a detecting prime with v_p(ℓ+1)=a | infinitely many detecting primes, finitely many non-reducible ones for eta (law above) | A detecting prime with eta reducible exists; argument unchanged |
| Contract: "K3BlochGroups §§3.4–3.5 … P(A) and B(A) of a commutative ring A with the maps induced by every ring homomorphism" | K3BlochGroups README at its open head, §3.4 and §3.5 | §3.4: "A ring homomorphism f : A → B induces a homomorphism P(A) → P(B)" through the reduced presentation; §3.5: induced map of Bloch groups, ∂ natural | Supplier states it; O_(𝔮)→F is not local and is covered by the reduced presentation |

The rows for untouched statements, including all six declarations of `Suggested.lean`, stand as in the previous review, of 84e120a.

- Remark (no change asked): "Over a residue field with fewer than four elements a preimage does not determine a reduction" is shown by the Check for three elements; at 𝔽₂ only the zero class has a preimage, as the next law bullet says.
- Source locators checked against the text: 3 (CGZ line 1126 for termwise reduction, §4.3, p. 24; CGZ line 964, Lemma 4.1, p. 21; CGZ lines 1128–1147, Lemma 4.4, pp. 24–25). The seeded sample meets the diff only at §1.11; its hypotheses p>2, q>2 are at CGZ line 1048.
- Cross-roadmap citations resolved at the supplier's open head: K3BlochGroups §§3.1, 3.4, 3.5, 3.6, 3.13, 3.16, 4.20, 4.22 (8 sections); the dropped words "and valuation" remove no cited id (the rational specialization of its §4.21 is rational-coefficient and is not consumed mod n).
- Library declarations opened: none; the diff changes no Lean statement and names no library declaration.
- Gate rerun at 2c1e0cb: every text check 0, `depcheck=0`, OK; the worker's gate adds `build=0`. Dependency check: `depcheck: 222 roadmaps, 1973 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/HabiroNumberFields/Suggested.lean` with `lake env lean`: four `declaration uses sorry` warnings (lines 43, 50, 62, 71), nothing else. The file is unchanged since 84e120a; the six elaborated signatures agree with the README as before.
- Pull request text against this head: no supplier, section, heading or declaration added or removed by the 14 lines; K3BlochGroups was already listed; no sentence of the title or description is contradicted. No file changed outside the folder.
- Overlap check: read K3BlochGroups, HabiroNahmSeries, PadicHodgeRegulators; P(A), B(A) and their ring-homomorphism maps are owned by K3BlochGroups §§3.4–3.5 and cited; reduction of Bloch classes at 𝔮 and the local regulator and Chern maps are owned here (no other roadmap states them); nothing else shared by the change.
- Source independence: changed passages only; 4 passages compared with 1 source (CGZ lines 1124–1147), none shared (no run of five consecutive words); arrangement not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- The required compatibility b(ξ̄)=r(β) is a target whose source proof (CGZ lines 1144–1147) is one sentence; the table tests necessary consequences at ℓ=5, not the K₃ square itself.
- The positive 𝔽₂ comparison and its reduction square remain the declared K3BlochGroups gap; nothing in this change tests them beyond P(O_(𝔮))=0.
- Unchanged source locators were not opened again in this round.

## Source issues

- **Gap** in CGZ at §4.3, printed p. 24, CGZ line 1126: the source says reduction of Bloch classes is the termwise map on projective-line symbols, calling it natural; it should show that five-term elements and the boundary kernel are preserved, including symbols reducing to 0, 1, ∞; affects the proof.

The errata listed in the previous review, of 84e120a, were not re-examined and are not repeated here.

## For the human reviewers

- none
