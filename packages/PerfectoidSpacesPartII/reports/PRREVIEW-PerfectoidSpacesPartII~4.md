# Review of PerfectoidSpacesPartII (pull request #2286 at 671703e)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/PerfectoidSpacesPartII/README.md:1674` separates `R → lim S_j` from `lim S_j → lim R[j]`, with explicit transition and kernel annihilators.
- R02 — repaired: `TauCetiRoadmap/PerfectoidSpacesPartII/README.md:2101` constructs the inverse counit from integral elements, citing the pinned power-boundedness theorem and explaining uniqueness.
- R03 — repaired: `TauCetiRoadmap/PerfectoidSpacesPartII/README.md:2146` first reduces modulo `ϖ^r`, transfers the annular Galois identities through limits, then changes base to `p^m`.
- R04 — repaired: `TauCetiRoadmap/PerfectoidSpacesPartII/README.md:2253` proves both inclusions of subrings, using the orbit polynomial and the frame torsor for integrality.
- R05 — repaired: `TauCetiRoadmap/PerfectoidSpacesPartII/README.md:2337` proves trace surjectivity by splitting a Galois torsor, then uses rank components and trace transitivity.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §3.5 transition bound and small-exponent span | `p = 2, 3; r = 1; k = 1; j = p; j′ = 2p; s = 1/p` | `(j′−j)s = 1`, so the transition coefficient is `ϖ = 0`; `T^{1/p}u^{1/p} = ϖ = 0`. | Both annihilation formulas hold. | Expanded sketch |
| §3.5 comparison kernels and limits | `R = K°/ϖ`; every root of `T` acts by `1`, or by `0`; also `r = 0` | Unit case: `lim = R`, kernel/cokernel `0`. Zero-root case: `lim = k_K`, kernel `K°°/ϖ`, root annihilator `0`. For `r=0`, both rings `0`. | Correct almost setup, including degenerate cases. | Expanded sketch |
| §4.3 counit and integral comparison | `A = K⟨T^{1/p^∞}⟩; g = T; B′ = A[1/T]²`, or `0`; `q = ‖ϖ‖` | Split case: `B = A²`, `η_jδ_j = δ_jη_j = id_{A[j]²}`. Zero case: both objects `0`. `1/T` has norm `q^{−j}`. | Inverse maps agree; bounded and algebraic limits remain distinct. | New inverse-map argument |
| §4.4 reduction and Galois tensor map | `p = 2, 3; ϖ = p^{1/p}; r = pm; B = A²; D = A°/p^m` | `ϖ^r = p^m`; invariants are `diag(D) ≅ D`; tensor square and product are `D⁴`; `e₁⊗e₂ ↦ (0,e₂)`. | Reduction direction and tensor convention agree. | Reduced annular-limit argument |
| §4.6 integral closure and envelope | `A = K; g = 1; B′ = K²`; `b = (0,1)`; also `B′ = 0` | `B° = B̃° = (K°)²`; orbit polynomial `X(X−1)` vanishes at `b`. `ϖ⁻¹e₁` has norm `q⁻¹ > 1`. Zero envelope: `0`. | Both inclusions hold; taking all of `B′` fails. | Double-inclusion argument |
| §4.7 trace descent through frame torsors | Characteristic `2` or `3`; `B′ = K³`; `S₃` frame torsor `T′ = K⁶` | `tr_{T′/B′}(e_σ) = e_{σ(1)}`; `tr_{B′/K}(e_{σ(1)}) = 1 = tr_{T′/K}(e_σ)`; in characteristic `3`, `tr_{B′/K}(1) = 0`. | Surjectivity uses coordinate idempotents, without dividing by the rank. | Torsor and transitivity argument |
| §4.7 and `abhyankar_trace_almost_surjective` | `A = K×K; g = 1`; faithful rank `(2,1)`, versus rank `(1,0)` | Faithful trace: `(x,(y₁,y₂)) ↦ (x+y₁,y₂)`, onto `(K°)²`. Rank `(1,0)`: image `K°×0` misses `(0,ϖ)`. | Faithfulness retained in the elaborated signature. | Proof repaired; signature unchanged |

The adversarial rows for untouched statements stand as in the previous review of `b2a4617`.

- Source locators checked: 5 in ANDRE18A—Théorème 0.3.1 and Propositions 4.2.1, 4.4.4, 5.2.3, 5.3.1, including the changed seeded targets §§3.5 and 4.7 (lines 56–68, 2468–2572, 2969–3003, 3090–3153, 3171–3200).
- Pinned declarations opened: 6, in `TauCeti/RingTheory/Huber/PowerBounded.lean:454,482` and `TauCeti/LinearAlgebra/Trace/Projective.lean:72,134,147,158`; integral elements remain power-bounded, and projective trace has the required product and base-change laws.
- Supplier sections reopened for the repaired routes: 12—PerfectoidSpaces P0.11, P0.12, P0.14, P0.16, P0.27, P2.13, P2.16, P3.3, P3.10, P3.12, P3.13; AdicEtaleGeometry A4.3. Citation resolver: 0 unresolved cross-roadmap citations.
- Dependency output: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`; gate: every scanner passed; targeted build: passed; outside-folder changes: 0.
- Direct elaboration: passed with exactly 10 `sorry` warnings; 35 `#check @name` signatures regenerated. The trace retains completeness, regularity, finite projectivity, étaleness and faithfulness; no declaration changed. Previous one-tactic probes stand.
- Pull-request title and description checked against the head: 0 contradictions or omitted scope changes; the repairs change proof routes and citations within existing suppliers.

Overlap check: read DirectSummandsAndBigCohenMacaulay, PerfectoidQuotientsPartII, PerfectoidQuotients, PerfectoidTowers, RelativeFarguesFontaine, PerfectoidSpaces, AdicEtaleGeometry, AdicSpacesPartII; PerfectoidSpaces owns almost algebra and unramified perfectoid purity, AdicEtaleGeometry owns frame torsors, AdicSpacesPartII owns completed tensors, PerfectoidQuotients owns monic-root pairs, and this roadmap owns the ramified envelopes, Riemann extension and Kummer inputs consumed by DirectSummandsAndBigCohenMacaulay. No competing ownership in the changed passages.

Source independence: changed passages only—5 rewritten sketches compared with 1 source, ANDRE18A; no copied passage remains. Largest share ANDRE18A, 90 of 162 locators (the previous tally minus the two deleted citations). No layer was added, removed or reordered; the previous contents comparison stands.

## Not verifiable

- none

## Source issues

- **Misprint** in ANDRE18A at Proposition 4.2.1, proof, pp. 54–55 (lines 2523–2564): the source says the quotient and divisibility relations use a pseudouniformizer exponent independent of the annulus index; it should be `ϖ^{j/p^k}`, consistently with (4.3); affects the proof.
- **Error** in ANDRE18A at Proposition 4.4.4, proof (3), p. 63 (line 2991): the source says `A[1/g]` embeds in the uniform annular limit; it should use the algebraic projective limit, since `1/T` has unbounded annular norms; affects the proof.
- **Error** in ANDRE18A at Théorème 0.3.1(1), p. 2 (lines 61–62): the source says the base embeds in the envelope for every finite étale localisation algebra; it should assert a structure map, injective when that algebra is faithful; affects a stated result.

## For the human reviewers

- **Licence.** Clause order in `TauCetiRoadmap/PerfectoidSpacesPartII/README.md:2299,2580,2699` follows ANDRE18A lines 56–68 and ANDRE18B lines 333–366. The previous review treated the correspondence as mathematically forced.
- **Licence.** Sketches at `TauCetiRoadmap/PerfectoidSpacesPartII/README.md:1464,1792,2564,2804` retain the routes of ANDRE18A lines 1720–1723, 2637–2643 and ANDRE18B lines 232–234, 386–545. The previous review treated these as mathematical routes.
- **Scope.** Within `TauCetiRoadmap/PerfectoidSpacesPartII/README.md`, §§2.2–2.4, 2.6–2.9 follow ANDRE18A §§2.3, 2.5, 2.6, 2.8, 2.9; §§3.3–3.11, 4.3–4.8 follow its §§3.5–5.4. The previous review found most ordering forced by dependencies.
- **Scope.** `TauCetiRoadmap/DirectSummandsAndBigCohenMacaulay/README.md:94` declares `gap:ramified-multielement-kummer` with this roadmap as supplier; `TauCetiRoadmap/PerfectoidSpacesPartII/README.md:2792` states no multi-element or ramified-base Kummer target.
- **Scope.** `TauCetiRoadmap/PerfectoidSpacesPartII/README.md:3038` lists fifteen claimed source corrections. The previous review recomputed five; this incremental review checked the rewritten proofs and the source issues recorded above.

