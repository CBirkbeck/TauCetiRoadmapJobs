# Review of CharacteristicClasses (pull request #1807 at 35d5208)

**Verdict:** accepted

Incremental re-review of the 71 lines changed since d227a81 (62 in `README.md`, 9 in the docstrings of `Suggested.lean`). Both previous findings are repaired, the repairs introduce no new problem, and the gate passes. There is no finding.

## Previous findings

- R01 — repaired: `README.md:2802–2814` "Here f!_K is the pushforward of TopologicalKTheory T5 item 5, the Thom map of the dual-Koszul class of ν followed by the open extension … For the pushforward built from the wedge class of ν … the factor is C6.4's wedge correction".
- R02 — repaired: (a) `README.md:1520–1526` "a closed 2m-form Ψ, with 2m=dim G/T, on the simplicial manifold N(G;G/T) whose restriction to the fibre G/T has nonzero integral"; (b) `README.md:2158` "pp. 129–130" and References "Theorem 8.1, p. 114, with its proof on pp. 123–130; Lemma 8.30, pp. 125–129".

## Verified sound

**Gate and dependency check.**
- The worker's gate at 35d5208 passes every check, including `build=0`.
- Re-running the gate command reports only `outside-folder=26`: the two files of each of the 13 other folders the brief names as this pull request's own. Every other counter is 0. Not a finding.
- `git diff --stat origin/main...HEAD` outside the 14 listed folders is empty.
- The dependency check prints:

      depcheck: 236 roadmaps, 2163 edges, 0 problem(s)

**Lean.**
- The diff of `Suggested.lean` touches two docstrings only (the not-statable list now names C6.5 and the dual-Koszul convention; the C7.3a docstring now cites Cohen, Corollary 3.28, p. 106, beside Milnor–Stasheff §4). No statement changed.
- `lake env lean` on the file gives five `sorry` warnings (lines 149, 173, 189, 213, 245) and nothing else.
- `signatures.md`: 0 dropped binders; the five theorem types are those compared with README C2.1, C2.2, C2.3 and C7.3a in the previous report. The entries `ContMDiffConstSMul` and `of` are words inside docstrings, not declarations.
- Headlines and the one-tactic probe stand from the previous report, the statements being unchanged. The module docstring's new C6.5 entry is right: the pins have no topological K-theory and no Chern class, so the identity is not statable.

**Source lines read for the changed passages (7).** Printed page = PDF page marker − 8 for `dupont-ccc`.
- C2.6: `dupont-ccc` lines 3840–3841 (G/T orientable of even dimension 2m), 3843–3846 (integration over the fibre G/T gives `A*(N(G;G/T)) → A*⁻²ᵐ(NG)`), 3848–3852 (Lemma 8.30: Ψ on N(G;G/T), closed, restriction to G/T with nonzero integral), 3856 (`T(φ)=π_*(Ψ∧φ)`), 3859 (printed p. 126: T is a chain map by Lemma 8.30 (i)). The rewritten sentence says exactly this.
- C5.3 and References: pages as verified in the previous report (Theorem 8.1 on printed p. 114, proof heading on p. 123, disconnected step on pp. 129–130).
- C6.4: `landweber-k-theory-elliptic` lines 613–618 (roots formula `∏(1−e^(x_i))/x_i`, p. 14) and 628–629 (the closing form `(−1)^n td(E)^−1`, p. 14). The new clause "its closing Todd-class form on p. 14 drops the factor exp(c₁(E))" is correct.
- C6.5: lines 698–725 (p. 16): `i!` is built for TX⊂TY, the normal bundle is given the complex structure `π*(N⊗_ℝ ℂ)` (line 720), and `i! = h∘ϕ` with ϕ the Thom map of §1.7; line 728 confirms the wedge zero-section class. The rewritten sentence matches.
- C7.3a docstring: `cohen-fiber-bundles` Corollary 3.28, p. 106 (line 3596, read in the previous review).

**Cross-roadmap citations resolved (4).**
- TopologicalKTheory T5 item 5 at this head (`TauCetiRoadmap/TopologicalKTheory/README.md:1215–1222`): the K pushforward of a closed embedding with complex normal structure is "Thom with open tubular extension", with compact-support version for proper embeddings; the Thom map is item 3 (line 1196), multiplication by item 1's Koszul class with zero-section restriction `λ_(−1)(E*)` (lines 1150–1152), i.e. the dual-Koszul class of its Conventions (lines 258–262). The supplier-table row, C6.5 and the C6 Dependencies paragraph cite it for what it states.
- The diff of TopologicalKTheory since d227a81 changes T2.3/T4 prose and its `Suggested.lean` only; T5 is untouched and no heading is dropped.
- C2.4 (`README.md:1449–1468`): the embedding Gysin map is Thom followed by tubular open extension, with the self-intersection formula that the third new Check uses.
- C6.4 (`README.md:2770–2796`): supplies both corrections that C6.5 now quotes.
- `citations.md` lists nothing unresolved; `overlaps.md` lists no dropped id. #1808 and #1854 conflict in this folder; the description fixes the order "this pull request → #1808 → #1854". The changed passages add no object and no supplier beyond a section already in the supplier table, so there is no new ownership question.

**Adversarial table.** Rows marked r68 are carried from the previous report (PRREVIEW-CharacteristicClasses~68) for statements this diff leaves untouched.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| C6.5 `ch(f!_K a)=f!_H(ch(a)·Td(ν)^−1)`, dual-Koszul f!_K | point in ℂ, a=1; CP¹⊂CP², a=1; rank 0 (open embedding) | factor (1−e^(−x))/x=1 at x=0: +f!_H(1) both sides; left ch(1−[O(−1)])=1−e^(−h)=h−h²/2 (h³=0), right f!_H(1−η/2)=h−h²/2; Td=1, both sides ch(a) extended | holds | none |
| C6.5 wedge sentence | point in ℂ; line ν with root x | (−1)¹e⁰·1=−1 and (1−e^x)/x→−1; (1−e^x)/x=−e^x(1−e^(−x))/x | holds, agrees with C6.4 | none |
| C6.5 Check 1 | x=0 | (1−e^(−x))/x=1; (1−e^x)/x=−1 | true, separates the two conventions | none |
| C6.5 Check 2 | CP¹⊂CP² | f!_H(1)=h, f!_H(η)=h·f!_H(1)=h²; Td⁻¹=1−η/2: h−h²/2; Koszul 0→O(−1)→O→O_H: ch=1−e^(−h)=h−h²/2; with Td: h+h²/2 | true, separates Td from Td⁻¹ | none |
| C6.5 Check 3 | line ν, c₁=x | left ch(a·(1−ν*))=ch(a)(1−e^(−x)); right ch(a)·(1−e^(−x))/x·x | true | none |
| C2.6 Euler-integral input | SU(2), U(3); a fibre-only volume form | ∫Ψ₀=χ(S²)=2, χ(Fl(ℂ³))=6; a form closed only on G/T does not give dT=Td, Lemma 8.30 (i) on N(G;G/T) does | holds; description now exact | R02 repaired |
| C5.3 disconnected G (r68) | O(2) | ℤ/2: e↦−e on ℚ[e]; invariants ℚ[e²]=ℚ[p₁]=H*(BO(2);ℚ) | holds; pages now 129–130 | R02 repaired |
| C6.4 statement and Checks (r68) | rank 1 both conventions; rank 0 | (1−e^x)/x=−1−x/2−x²/6=−e^x·Td⁻¹; (1−e^(−x))/x=1−x/2+x²/6; 1 | holds | none (one clause added, verified above) |
| C2.4 embedding Gysin (r68) | diagonal of S²; point in Sⁿ | Δ*Δ_!(1)=e(TS²)=2=χ(S²); i*i_!(1)=0 | holds | none |
| C7.3a `not_exists_isImmersion_realProjectiveSpace` (r68) | k=1,2 | k=2: w(RP⁴)=1+a+a⁴, w̄₃=a³≠0 vs normal rank 2; 2^(k+1)−2≥2, no truncation | holds | docstring locator only |
| C2.1 (two theorems), C2.2, C2.3 (r68) | as in r68 | u=±g, (1,−1); TS²: 2≠0; S², T², S³: 2, 0, 0 | hold | none |
| C1.1a, C1.2a, C1.4, C1.5, C2.5, C3.3, C4.3, C5.4, C5.5, C6.1, C6.2, C7.1, C7.2, C7.3, C7.5 (r68) | as in r68 | values as recorded there (e.g. C3.3: p₁(CP²)=3h²; C7.1: L₃[CP⁶]=945/945=1; C6.2: ch₂(TCP²)=3h²/2) | hold | none |
| C1.1b, C1.1d, C1.3, C1.5a, C2.3a, C3.1, C3.2, C3.4a, C3.5, C3.6, C4.1, C4.2, C5.1, C5a.1–C5a.3, C6.3 (r68, from r67) | as in r67 | values as recorded there (e.g. C5.1: tr ad(e₁)²=−8, λ=1/4; C3.5: c₁(TCP²)=3h odd) | hold | none |

**Seeded sample.** Of the sampled targets, C2.4, C5.3 and C6.4 fall in or are cited by the changed passages and were checked above; the others are untouched and stand as in the earlier reports.

## Not verifiable

- C2.4, C2.5 (Bott–Tu §6), C3.3 (Milnor–Stasheff Theorem 15.3), the Milnor–Stasheff §4 half of the C7.3a docstring: uncertified sources, cited by locator, not read. None is in a changed passage except as a retained citation.
- No README locator is flagged as unverified.

## Source issues

- **Error** in landweber-k-theory-elliptic at §1.7, p. 14: the source says the correction factor equals (−1)^n td(E)^−1; it should be (−1)^n exp(c₁(E)) td(E)^−1, which equals its own roots formula ∏(1−e^(x_i))/x_i; affects a stated result.
