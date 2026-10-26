# GATE-K3BlochGroups~11: answers to human review

The review (CBirkbeck, 2026-10-26T14:09:39Z, reviewed head `5b6774f`) makes two findings and one statement about its own coverage. They are H01–H03 below. The closed-items table and the "checked and found sound" list confirm earlier repairs and need no reply.

## H01 (CBirkbeck) — applied differently

The conflict is real, but it is in the two consumer folders, and no edit to `TauCetiRoadmap/K3BlochGroups/` can close it. I checked both at their heads. ColemanIntegration at `9d5c185`, README §L2.Fb (lines 1458–1480), builds its own `Symbols K`, `PreBlochGroup`, `AntisymmetricSquare`, `boundary` and `BlochGroup` with local lifts and field maps, and never names K3BlochGroups. PolylogarithmFunctions at `860558b`, Downstream consumers line 1069, still gives "algebraic Bloch groups" to ColemanIntegration. The repair belongs in those two roadmaps. This roadmap already exports the interface: see Scope and ownership (line 15), §3.4 (last API bullet), §3.5 (kernel-isomorphism bullet) and Downstream consumers.

The direction is admissible. The merge order places K3BlochGroups (ORDER line 109) before ColemanIntegration (line 153), and PolylogarithmFunctions (line 41) is a supplier here whose consumer bullet this roadmap does not consume. The two carriers already agree, so Coleman can alias or adapt without changing conventions:
- Coleman's `Symbols K`, ℤ[K∖{0,1}], with the expression `[x] − [y] + [y/x] − [(1 − x⁻¹)/(1 − y⁻¹)] + [(1 − x)/(1 − y)]`, is the reduced presentation ℤ[F−{0,1}]/R₅ of §3.4.
- Its `AntisymmetricSquare` is Qₛ of §3.1.
- Its `boundaryRaw [x] = x ⊗ (1 − x)` has the sign of §3.5.

The repair is carried in the two consumer pull requests, now pushed: ColemanIntegration #1043 at `71569c0` (Scope names K3BlochGroups as the owner of the algebraic carriers; §L2.Fb consumes K3BlochGroups §3.1, §§3.3–3.5 for `antisymSquare`, the five-term elements, `preBloch`, `preBlochSymbol`, the boundary and the Bloch group, keeps only Coleman's evaluation, branch descent and projective-coordinate adapters, and cites K3BlochGroups in its *Needs* line, Layer 2 dependency summary and a new supplier contract) and PolylogarithmFunctions #1320 at `a4f224a` (its ColemanIntegration entry under Downstream consumers now credits K3BlochGroups §§3.1, 3.3–3.5 with the symbol constructions, algebraic field-map API and Bloch groups). Nothing in this folder changes for this point.

## H02 (CBirkbeck) — applied

The four points are now defined before their first use. A new paragraph in §4.13 (README line 1432) sets p_1 = (1 : 0 : 0), p_2 = (0 : 1 : 0), p_3 = (0 : 0 : 1) and q = (1 : 1 : 1) (Weibel, K-book, before Lemma VI.5.10, PDF p. 500; `weibel` line 29937). It defines projection from p_3 as (X : Y : Z) ↦ [X : Y] in the column coordinates of the Conventions, which sends (p_1, p_2, q, (1 : a : x)) to (0, ∞, 1, a). It also notes two facts:
- Changing the coordinate on the pencil does not change the cross-ratio.
- Exchanging p_1 and p_2 inverts it.

§4.14 (line 1476) now cites these points and shows that each orbit of general-position 5-tuples contains exactly one [a; x]. Its old parenthetical "(the cross-ratio of the projection from the last point)" is replaced by two explicit statements: the formula for [a; x], and the general formula on any general-position 5-tuple, which is the form the rotation sums use.

The old Check "ψ′([a; x]) = [a], the cross-ratio of the projection…" (line 1499) is replaced by two Checks (lines 1501–1502):
- A computed witness over ℚ: ψ′([3; 2]) = [3]. With p_1 and p_2 swapped the value would be [1/3], and [1/3] ≠ [3] because the valuation pairing β gives β(∂[3]) = −1 but β(∂[1/3]) = 1.
- The general-position conditions a, x ∉ {0, 1}, a ≠ x, each matched to the line it excludes.

The §4.13 transitivity Check (line 1462) now names the group element and its scalar stabilizer, and the §4.14 locator "Before Lemma VI.5.10 (PDF p. 501)" becomes "(PDF pp. 500–501)".

The witness is needed because the existing rotation-sum Check does not pin the point order. Over 𝔽₇, 𝔽₁₁ and 𝔽₁₃, Σᵢψ′(tⁱ[a; x]) = 2c holds for every admissible (a, x) under both orders (table below).

## H03 (CBirkbeck) — answered

The manifest records `suslin-1984`, `suslin-1991` and `bloch` as waived. They are cited by locator only, so their internal locators are not source-certified by this roadmap either; that limitation stands as the reviewer describes it. I checked the Goncharov locators against the cached OCR text of the Advances article:
- Conjecture 1.20 is at `goncharov` line 903, printed p. 225.
- Proposition 1.22 and its proof (a) are at `goncharov` lines 909–916, also on printed p. 225.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| p_1, p_2, p_3, q: no three collinear over any field | all four triples, any characteristic (incl. 𝔽₂) | det(p_1,p_2,p_3) = det(p_1,p_2,q) = det(p_1,q,p_3) = det(q,p_2,p_3) = 1 | holds; over 𝔽₂ they are the complement of the line X+Y+Z = 0, a 4-arc, consistent with the existing "GP_n = 0 for n ≥ 4 over 𝔽₂" Check | added |
| Every general-position 4-tuple is g·P, g unique up to scalar | P itself; collinear ((1:0:0),(0:1:0),(1:1:0),·) | P: α = β = γ = 1, g = I; collinear tuple: γ = 0, so no invertible g; stabilizer diag(α,β,γ) fixing q forces α = β = γ | holds | added (§4.13 text and Check) |
| Projection from p_3 sends (p_1,p_2,q,(1:a:x)) to (0,∞,1,a) and cr = a | the formula cr(a,b,c,d) = [d,a][c,b]/([d,b][c,a]) of §3.2 | cr(0,∞,1,a) = (−a)(1)/((1)(−1)) = a; cr(∞,0,1,a) = (1)(−1)/((−a)(1)) = a⁻¹; with pencil coordinate [Y:X]: cr(∞,0,1,a⁻¹) = a | value a; point order matters, pencil coordinate does not | added |
| Unique orbit representative [a; x]; conditions a, x ∉ {0,1}, a ≠ x | (1:a:x) against the six lines | p_1p_2: x = 0; p_1p_3: a = 0; p_1q: a = x; p_2q: x = 1; p_3q: a = 1; p_2p_3 (X = 0): never | exactly the stated conditions | added Check |
| ψ′ on any 5-tuple = cross-ratio of projection of first four from the last | Σᵢ₌₀⁴ψ′(tⁱ[a;x]) − 2c tested for membership in the relation lattice of P(𝔽_p) (integer Hermite form of [1] and all five-term relations) | 𝔽₇: 20/20; 𝔽₁₁: 72/72; 𝔽₁₃: 110/110 with order (p_1,p_2); the same counts with (p_2,p_1); 2c ≠ 0 in P(𝔽₁₁), 2c = 0 in P(𝔽₇) and P(𝔽₁₃) | agrees with the existing "72 admissible (a, x) over 𝔽₁₁" Check; that Check does not separate the two orders | kept; order pinned by the new ℚ witness |
| ℚ witness: ψ′([3;2]) = [3], swapped value [1/3] ≠ [3] | β(a,b) = v₂(a)v₃(b) − v₃(a)v₂(b), alternating, so well defined on Qₛ(ℚ) | ∂[3] = 3∧(−2): β = 0·0 − 1·1 = −1; ∂[1/3] = (1/3)∧(2/3): β = 0·(−1) − (−1)·1 = 1 | distinct boundaries, so distinct classes in P(ℚ); agrees with the Conventions' value β(∂[3]) = −1 | added Check |
| Locator: points on PDF p. 500, P and [a;x] on PDF p. 501 | `weibel` page markers | p_i, q at lines 29937–29938 (page 500); P at 29944 and [a;x] at 29952 (page 501) | correct | §4.14 locator widened to pp. 500–501 |

## Other checks

- **Lean.** `Suggested.lean` is unchanged, so the 13 elaborated signatures in the job's signature file still apply. That file flags 0 dropped section binders. Because no declaration changed, I did not rerun `#check @name`.
- **Ownership.** No new construction was added: p_1, p_2, p_3 and q are notation inside this roadmap's own §§4.13–4.14, which belong to "the frame and projective-configuration calculations needed for the Suslin map" in Scope and ownership. The ℙ¹ cross-ratio is still imported from PolylogarithmFunctions §5.8 through §3.2. No notion moved down from a later roadmap.
- **Citations.** The single unresolved lead, `uce.source_superperfect`, is in StableHomotopyKTheory §3.29 at its open head, an earlier supplier. It is not a Mathlib or Tau Ceti name.
- **Sources.** No new source was cited, and no `needs-references.toml` entry was needed.
- **Suspicious text.** None. The review contains links and claims only.

## Build and gate

Commit `15e2117a` "K3BlochGroups: review repairs (define frame points p_i, q and projection for rank-three map)". It is not pushed.

`lake build TauCetiRoadmap.K3BlochGroups.Suggested`: `Build completed successfully (8976 jobs).` The only warnings are the expected `declaration uses 'sorry'` at Suggested.lean lines 40, 95, 108, 120, 133, 145, 157 and 170.

Gate after the commit:

    gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK

Depcheck (`--movable`):

    depcheck: 55 roadmaps, 638 edges, 0 problem(s)
