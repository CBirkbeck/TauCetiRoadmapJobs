# GATE-K3BlochGroups~14: answers to human review of `d8f7c47`

Repairs committed as `2cb125d` on the pull-request branch (not pushed). Both `TauCetiRoadmap/K3BlochGroups/README.md` and `TauCetiRoadmap/K3BlochGroups/Suggested.lean` changed.

The review makes three findings, F01–F03 (H01–H03), followed by two flags addressed to the human reviewers (H04–H05).

## H01 (CBirkbeck) — applied

README 39 (Conventions) now defines, for a commutative ring A, U(A), Qₛ(A), W_A = {x : x and 1−x units} and admissible pairs (x, y ∈ W_A with x−y a unit). §§3.3–3.5 (README 619–790) restate the raw symbol, the five-term elements, the certificates, P(A), ∂ and B(A) for a commutative ring, and every field statement is kept as the instance A = F. In `Suggested.lean` 68–90, `preBlochRawSymbol`, `preBloch` and `preBlochSymbol` now take `[CommRing A]`: the killed generators are `IsUnit u ∧ ¬ IsUnit (1 - u)`, the pairs need `IsUnit x, (1 - x), y, (1 - y), (x - y)`, and the quotients use `Ring.inverse`. Over a field this closure set is exactly the old one. `finiteBloch_order` and `blochC_order_six` still elaborate unchanged.

The suggested repair needed one correction, now made. A ring map does **not** induce P(A) → P(B) through the free map on units: ℤ → ℚ sends the killed [−1] (2 is not a unit of ℤ) to [−1] ∈ P(ℚ), and that class is nonzero because ∂[−1] = (−1)∧2 has value 1 under s(a)v₂(b) − s(b)v₂(a) mod 2. §3.3 records this as an API caveat and a Check. §3.4 induces the map through the reduced presentation ℤ[W_A]/R₅ instead. `FiveTermCertificate.map` is now stated only for ring maps that send killed units to killed units (every field map, and every local homomorphism). The five-term vanishing of ∂ over a ring is shown by its expansion, a⊗c + c⊗a with c = (1−x)/(1−y) (`mirzaii-mokari` line 266). That expansion is recomputed in the adversarial pass below.

On the locators: the ring definition is Mirzaii–Mokari **§3**, p.6 (`mirzaii-mokari` lines 245–273), not §2. The definition is also in Hutchinson arXiv:1309.5010v2 §2.2, p.5 (`hutchinson-local` lines 328–334). §1 of arXiv:1603.03649 is the configuration spectral sequence, so that paper is cited for its Theorem 6.1 instead.

The requested 𝔽₃ Check is at README 724. P(𝔽₃) ≅ ℤ because W = {−1} and −1 − (−1) is not a unit. Coronado–Hutchinson's unimodular-row construction instead gives ℤ/4 on [−1] (arXiv:2201.04996v3, Corollary 8.4, p.27; `coronado-hutchinson` line 1450).

The ring Checks added are:

- §3.3: ℤ has W empty with both unit symbols killed; the zero ring has W = {0} and the admissible pair (0,0), whose five-term element is [0]; over ℤ_(3) no pair is admissible, while the pair (2,5) would force [2] = [5].
- §3.4: P(ℤ) = P(0) = 0, and P(ℤ_(3)) is free on the units ≡ 2 mod 3.
- §3.5: over ℚ the five-term element at (2,3) has boundary −2(2⊗2) in the full tensor square; over ℤ[1/2], B has index 4 in P ≅ ℤ³.

## H02 (CBirkbeck) — applied

The new §3.17 (README 1108–1146) defines, for a commutative ring A:

- R_A = ℤ[Aˣ/(Aˣ)²], I_A and ⟪u⟫;
- `refinedPreBloch` RP(A) on generators [x], x ∈ W_A, with the refined relation at each admissible pair;
- `refinedPreBloch.forget` and the coinvariant isomorphism RP(A)_(Aˣ) ≅ P(A);
- λ₁ = `refinedBoundary1`, [x] ↦ ⟪1−x⟫⟪x⟫, and λ₂ = `refinedBoundary2` = ∂ ∘ forget;
- RP₁(A) = ker λ₁ and `refinedBloch` RB(A) = ker λ₁ ∩ ker λ₂;
- Proposition 2.9's identifications after inverting 2;
- `refinedCrossRatio`, kept for fields because it is defined on P¹(F).

The sources are Hutchinson arXiv:1309.5010v2, §2.3, p.6 (`hutchinson-local` lines 388–399), and §2.4 with Proposition 2.9, pp.6–7 (lines 417–456).

The §5.4 bullet at README 1962 is now a pointer to §3.17. The bullet's F₄ and F₅ Checks moved to §3.17, and RP(ℤ) = 0 and RP(0) = 0 were added. All five names are kept. The q ≥ 4 hypothesis stays on the §§5.4–5.5 finite-field statements.

## H03 (CBirkbeck) — applied

**§4.22 statements.** The new §4.22 (README 1812–1844) states the following.

- **Many units.** The definition used by Mirzaii–Mokari, on forms A² → A (§1, p.4; `mirzaii-mokari` line 137), is shown equivalent to the condition on finite families of unimodular pairs. It therefore implies K2SymbolsBrauer §13.3's threefold stability, and 𝔽_q with q ≥ 4 shows the converse fails. Mirzaii's other definition, on Aⁿ for every n (arXiv:0807.2039v2, Definition 1.4, p.3), is recorded beside it.
- **manyUnits_blochWigner.** The sequence T_A → K₃^ind(A) → P(A) → Qₛ(A) → K₂(A) → 0, with T_A described by (4.3), and the domain case 0 → T̃(A) → K₃^ind(A) → B(A) → 0 (Theorem 5.1, Lemma 4.4, Corollary 4.5).
- **Infinite fields.** §4.20 is recorded as the case of an infinite field.
- **localInfiniteResidue_blochWigner.** Corollary 5.3.
- **localFiniteResidue_blochWigner.** Mirzaii arXiv:1603.03649v1, Theorem 6.1, with its residue bounds: more than 9 elements and not 16 or 32, unless A is a domain or an algebra over a field.
- **`bloch_dvr_equiv`.** Corollaries 5.4 and 6.3.
- **localDomain_refinedBlochWigner.** Hutchinson Theorem 3.22, for sufficiently large residue fields: k infinite or (p−1)f > 6.
- **localDomain_sl2_k3ind.** Corollary 3.23.

§2.1 (README 384) gains K₃^ind(A), the quotient of K₃(A) by the triple unit products of GeneralAlgebraicKTheory §§7.4–7.6, with three Checks.

**Stability input.** The depcheck shows no CYCLE or UPWARD line (output below). HomologicalStabilityOfGeneralLinearGroups (open, #2036 at `41c3fd5`, another author's new roadmap) consumes nothing here. So its §2.3 (semilocal rings with infinite residue fields, bijective for m ≤ n) is cited in a new supplier contract (README 109–111) and used for the infinite-residue cases.

Outside that case no supplier states the stability. For general rings with many units, and for local rings with finite residue field, the input is the named hypothesis `IsGLStableThroughThree`: for i ≤ 3 and n ≥ i, `TauCeti.stabilizeGL` induces a bijection on Hᵢ. It is defined in `Suggested.lean` 149–160 and carried by each theorem that needs it.

For finite residue fields this is narrower than Mirzaii's Theorem 6.1 and Corollary 6.3, which are unconditional. The README says that Mirzaii proves the needed degree-2 and degree-3 instances himself (Propositions 3.6(i) and 4.7). Whether those belong in HomologicalStabilityOfGeneralLinearGroups is the reviewers' call.

**DVR theorem in Lean.** `bloch_dvr_equiv` is statable at the pins, so it is added in `Suggested.lean` 162–188, with `(hstab : Finite k → IsGLStableThroughThree R)`. This adds `public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Stable`. The module docstring lists the four K₃-valued sequences as not statable (no Quillen K₃ of a ring), and the refined sequence as lacking the configuration edge map.

**DVR route.** The route to K₃^ind(R) ≅ K₃^ind(K) (Hutchinson Theorem 2.1) is spelled out because no supplier states it. Gersten exactness comes from SchemeKTheoryOperations §4.7 in equal characteristic and from Weibel V.6.9.2 for finite k. The kernel of the Milnor residue is generated by unit symbols. The proof of that kernel claim needs k to have more than two elements, which the theorem's hypotheses give.

**The two sentences.** HomologicalStabilityOfGeneralLinearGroups' own text says "This roadmap uses none of them", and it takes hyperhomology from SchemeKTheoryOperations §6.7. So the old README 27 claim "It consumes this roadmap … takes nothing from it" was false. The paragraph is rewritten against its current head; its old section numbers (§§1.2, 1.4, 2.2, 2.5) were also stale. The false Downstream-consumers paragraph ("consumes the group-module hyperhomology of §4.1 … its §§2.2 and 2.5") is deleted.

**Erratum and published versions.** The erratum (Math. Z. 275 (2013), 653–655) is added to the References entry for arXiv:0807.2039 (README 2397) and to its §4.11 citation (README 1446), which now also says that the main theorem is not used. The erratum is paywalled and is cited by locator only (uncertified). The published versions of the three new papers are behind paywalls, so their numbering could not be confirmed. The arXiv versions read are cited instead: 1108.5452v2, 1603.03649v1 and 1309.5010v2.

## H04 (CBirkbeck) — answered

The flag asks whether the Coronado–Hutchinson construction of (refined) pre-Bloch groups of every commutative ring should be added. It has not been added; that is for the human reviewers to decide. The version read is arXiv:2201.04996v3, dated February 2026. Its values differ from this roadmap's presentation:

| Ring | Coronado–Hutchinson | This roadmap |
|---|---|---|
| 𝔽₂ | RP = P ≅ ℤ/3 (§8.1, `coronado-hutchinson` lines 1387–1423) | 0 |
| 𝔽₃ | P ≅ ℤ/4 (Corollary 8.4) | ℤ |
| ℤ | P ≅ ℤ/6 and B ≅ ℤ/3 (introduction, lines 81–82) | 0 |

The paper is cited only for the 𝔽₃ value in the Check requested in F01.

## H05 (CBirkbeck) — answered

No change is made. Polylogarithms §4.1 (#1424) constructs `higherBlochGroup F n` rationally and only for infinite fields, which confirms the flag. No statement here uses a weight-n group, and the ring generalisation of §§3.3–3.5 and 3.17 is weight two only.

## Build and gate

- `lake build TauCetiRoadmap.K3BlochGroups.Suggested`: **Build completed successfully (18268 jobs)**, with only `declaration uses 'sorry'` warnings (9 theorems).
- `#check @name` was elaborated once for all 15 declarations by temporarily appending the checks to the file and building; the file was then restored. Every elaborated type matches its README statement, and the file has no section `variable`s, so no binder can drop. Changed: `preBlochRawSymbol`, `preBloch` and `preBlochSymbol` now take `{A} [CommRing A]`. New: `IsGLStableThroughThree : (A : Type u_1) → [CommRing A] → Prop` and `bloch_dvr_equiv`, whose elaborated type keeps all of `[IsDomain R] [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K]`, `hk`, `hc` and `hstab`.
- Gate summary line: `gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`, `--pr 1430`): `depcheck: 222 roadmaps, 1972 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line; before the edits it was 221 roadmaps, 1962 edges, 0 problems.
- `roadmaps resolve` on the README: cross-roadmap citations found nowhere, none; Lean names found nowhere, none.

## Ownership

Other roadmaps were searched by object (`roadmaps grep` for refined Bloch, many units, Bloch group of a ring, Mirzaii, Bloch–Wigner) across main and the 449 open heads. No roadmap owns Bloch or pre-Bloch groups of rings, the refined module or the ring Bloch–Wigner sequences, so this roadmap is their owner.

HomologicalStabilityOfGeneralLinearGroups owns ring stability and is cited (§2.3). K2SymbolsBrauer §§6.4, 6.7, 6.9, 6.18, 8.1, 9.11–9.12, 11.3 and 13.3, GeneralAlgebraicKTheory §§7.4–7.6 and SchemeKTheoryOperations §4.7 are cited at their open heads. No new `Suggested.lean` name copies a declaration of another roadmap.

## Sources

The following were fetched through the sources service; each is an open arXiv copy.

| Key | arXiv | Read for |
|---|---|---|
| `mirzaii-mokari` | 1108.5452v2 | §§1, 3, 4, 5 |
| `mirzaii2017` | 1603.03649v1 | Propositions 3.6 and 4.7, Theorem 6.1, Lemma 6.2, Corollary 6.3 |
| `hutchinson-local` | 1309.5010v2 | Theorem 2.1, §§2.2–2.4, Propositions 2.9 and 3.19, Lemma 3.21, Theorem 3.22, Corollary 3.23 |
| `coronado-hutchinson` | 2201.04996v3 | Corollary 8.4 |

`mirzaii-erratum` (Math. Z. 275 (2013), 653–655) resolved only to a paywalled page and is recorded as uncertified. The existing key `mirzaii` (0807.2039v2) gained Definition 1.4, p.3. `weibel` was used for V.6.9.2, printed p.414 (`weibel` line 24897).

The four new keys and the erratum are not yet in the manifest. This job does not edit `sources.toml`, so the worker should add them. No `needs-references.toml` was written.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| `preBlochRawSymbol` over a ring | ℤ at 2, −1; ℚ at 0, 1, 2; the zero ring at 0 | ℤ: 0 and [−1]. ℚ: 0, [1], [2]. Zero ring: the basis vector of its unique unit, nonzero in ℤ[{1}] ≅ ℤ | The original API claim "a ring map preserves raw symbols" fails at 2 ∈ ℤ → ℚ, so it was restricted to units and that case added as a negative example |
| Five-term subgroup, `preBloch` over a ring vs over a field | field F; 𝔽₂; 𝔽₃; ℤ; zero ring; ℤ_(3) | Field: the killed set {u unit, 1−u not a unit} = {1}, the pair conditions match x ≠ 0,1, y ≠ 0,1, x ≠ y, and `Ring.inverse` = ⁻¹, so the closure set is the old one. P(𝔽₂) = 0; P(𝔽₃) = ℤ (W = {2}, no pair); P(ℤ) = 0; P(0) = 0 via the pair (0,0); P(ℤ_(3)) free on u ≡ 2 mod 3 | Consistent with §3.4's field Checks. Ring Checks added |
| Admissible ⇒ five arguments in W_A | generic x, y | 1−y/x = (x−y)/x; 1−z₄ = (x−y)/((1−y)x); 1−z₅ = (x−y)/(1−y). Converse: y/x ∈ W ⇒ x−y a unit | Holds in every commutative ring |
| Pair (2,5) over ℤ_(3) if pairs with x ≠ y were allowed | | 5/2 ≡ 1, 5/8 ≡ 1, 1/4 ≡ 1 (mod 3) are killed, leaving [2] − [5] | Check added |
| Ring maps on P | ℤ → ℚ at [−1] | ∂[−1] = (−1)∧2, and s(−1)v₂(2) − s(2)v₂(−1) = 1 mod 2 | The free unit map does not descend. Map induced via ℤ[W] instead; `FiveTermCertificate.map` restricted |
| ∂ kills five-term elements over a ring | generic expansion in ℤ⁵ ⊗ ℤ⁵ on log x, log y, log(1−x), log(1−y), log(x−y); ℚ at (2,3) | Generic: T₃+T₄+T₅ = p⊗a + b⊗q − q⊗a − a⊗q, total a⊗(p−q) + (p−q)⊗a. ℚ at (2,3): c = 1/2, giving −2(2⊗2) in ℚˣ⊗ℚˣ, nonzero, and 0 in Qₛ | Holds. Full-tensor negative control added |
| ∂([x]+[x⁻¹]) = x∧(−x) | x ∈ W_A; x a unit outside W_A | In W_A: x∧(1−x) − x∧(−1) − x∧(1−x) + x∧x = x∧(−x). Outside W_A: [x] = [x⁻¹] = 0, since 1−x⁻¹ = −(1−x)/x is not a unit either | Scoped to x ∈ W_A (every x for a field) |
| B over ℤ[1/2] | W = {−1, 2, 1/2} | Differences −3, −3/2, 3/2 are not units, so P ≅ ℤ³. Qₛ ≅ (ℤ/2)³; ∂[−1] = ∂[2] = (−1)∧2 and ∂[1/2] = 2∧2; the image has order 4 | B has index 4 and rank 3 (Check) |
| §3.17 λ₁ kills the refined relation | the group ring of (ℤ/2)⁵ on the classes of x, y, 1−x, 1−y, x−y (script) | Sum of the five weighted λ₁ terms = 0 | Holds |
| RP coinvariants = P | 𝔽₅ at (2,3) | (1−ε)[2] + ε[4] augments to [4]; P(𝔽₅) has [4] = 0 | Consistent |
| RP degenerate | ℤ; zero ring; 𝔽₄ | RP(ℤ) = 0 (W empty) although R_ℤ has rank 2. RP(0): relation [0] = 0. 𝔽₄: G trivial, so RP = P | Checks added |
| Prop 2.9 element g(a) | augmentation | (1+1)[a] + 0 = 2[a] | As stated |
| Many units ⇔ pair condition | ℤ; 𝔽₅; ℚ×ℚ; ℤ[1/2]; infinite field | ℤ: pairs (0,1), (1,1) need t ∈ {±1} ∩ {0, −2} = ∅. 𝔽₅: the 5 pairs (−c,1) exclude every t. ℤ[1/2]: t, t±1 all signed powers of 2 is impossible (cases m = 0, 1, 2 give t = 0, 3, −3). Infinite field: each pair excludes at most one t | Both directions proved. Checks added |
| `IsGLStableThroughThree` | 𝔽₂; zero ring; infinite field; DVR with \|k\| > 9 | 𝔽₂: H₁(GL₂) = ℤ/2 → H₁(GL₃(𝔽₂)) = 0, fails at i = 1, n = 2. Zero ring: all maps identities, holds. Infinite field: §4.8. DVR: Mirzaii Proposition 3.6(i) (H₂) and 4.7 (H₃), and GL_n^ab = Rˣ by determinant | Not vacuous in either direction |
| `bloch_dvr_equiv` | ℤ_(2) → ℚ; ℤ_(3) → ℚ; ℤ_(11) → ℚ; k[[t]] → k((t)) | ℤ_(2): B = 0 vs B(ℚ) ≅ ℤ/6 (24/4). ℤ_(3): [2]+[−1] and [5]+[−4] independent in B, so not injective. Both are excluded by `hk`. ℤ_(11): finite k, needs `hstab` | Hypotheses necessary. Checks added |
| DVR route, residue kernel | m = −π with a = 1 (the first draft's choice) | c = −π is not a unit | Fixed: choose ā ∉ {0, −(m/π)‾}, which needs \|k\| > 2. Sign corrected: {1+cπ, π} = {−c, 1+cπ} |
| Gersten for finite k | V.6.9.2 for i = 2 | K₄(K) → K₃(k) split onto, so K₃(k) → K₃(R) is 0; with K₂(k) = 0 this gives K₃(R) ≅ K₃(K) | Route correct |
| ℚ sequence | | 0 → ℤ/4 → ℤ/24 → ℤ/6 → 0; untwisted Tor ℤ/2 gives 2·6 ≠ 24 | Consistent with §§2.1, 4.19, 4.20 |
| Refined sequence on 𝔽₁₁ | | H₃(SL₂, ℤ[1/2]) = ℤ/15, left term ℤ/5, so RB[1/2] = ℤ/3. B(𝔽₁₁)[1/2] = ℤ/3 (§3.6) | Consistent. 𝔽₉ and 𝔽₁₆ have (p−1)f = 4 and are not sufficiently large |
| K₃^ind(A) of a ring | zero ring; ℤ; ℚ | Zero ring: 0. ℤ: subgroup ⟨[−1]³⟩ has order exactly 2, since its image m₃{−1,−1,−1} ≠ 0 (§§2.2–2.3). ℚ: equals the Milnor image, giving ℤ/24 | Checks added |
| HSGLG relation paragraph | its head `41c3fd5` | Its §2.3 is bijective for m ≤ n, semilocal, infinite residue fields; it has no §§1.4 or 2.5; "This roadmap uses none of them" | Rewritten; false consumer paragraph deleted |

## Findings outside this review's points (not repaired)

- `generalLinearStabilization` (`Suggested.lean` 97) is the same block inclusion as the pinned `TauCeti.stabilizeGL F (Nat.le_succ n)`. The README paragraph now says so. The adapter could be replaced by the pinned map in `generalLinear_homology_stable`.
- HomologicalStabilityOfGeneralLinearGroups §2.3, at its current head, contains §4.8's field case of `generalLinear_homology_stable`. The two roadmaps now both state that field theorem; §4.8 additionally proves the Milnor quotient. Settling which roadmap owns it is a separate decision.
- §4.19 says T̃ and μ̃ "are the nontrivial extension by ℤ/2 exactly when char F ≠ 2". For an algebraically closed field of characteristic 0, μ_(2^∞) is infinite, Ext¹(ℤ/2, Tor) = 0 and T̃ = Tor. That statement looks too strong. (The new §4.22 states the case split as Mirzaii–Mokari Corollary 4.5 does.)
