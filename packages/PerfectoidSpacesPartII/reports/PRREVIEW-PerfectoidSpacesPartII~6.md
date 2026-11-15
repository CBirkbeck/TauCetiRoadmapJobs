# Review of PerfectoidSpacesPartII (pull request #2286 at 10927a4)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README:1727–1730 and Suggested.lean:44–45,377–379 distinguish Théorème 4.2.2's nonzerodivisor hypothesis from the regularity-free derivation using Lemme 4.2.3.
- R02 — repaired: README:2009–2010 cites Remarques 1.8.1(1)–(2), p. 8, for faithful flatness and the trace epimorphism, alongside Proposition 1.9.1.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §3.6(1), regularity-free annular limit | Perfectoid `K`; `A = K × K`, every root of `g = (1,0)` | Every annular unit ball is `K° × 0`; its limit and the root saturation in `A[1/g] = K` are `K°`. | Holds with noninjective `A → A[1/g]` | Source/generalization distinguished |
| §3.6(2), `riemann_extension_completeIntegralClosure` | Same algebra; `b = 1` and `b = ϖ⁻¹`, `q = ‖ϖ‖ < 1` | `1`: both conditions hold, using `K°`. `ϖ⁻¹`: both fail; powers have norms `q⁻ⁿ → ∞`. | Both directions discriminate | R01 repaired |
| §3.6(3), complete integral closedness | Same algebra; also all roots of `g = 0` | For `(1,0)`, saturation is `K°`; bounded powers force `‖b‖ ≤ 1`. For `g = 0`, localization and saturation are both `0`. | Lemme 4.2.3 allows both cases | Attribution clarified |
| §4.1 trace epimorphism and faithful flatness | Split `C₂`-torsor `𝔽₂ → 𝔽₂²`; conjugation on `ℤ[i]` as negative control | Split: `t(1,0)=1`, `N ⊗ 𝔽₂²=N²`, zero iff `N=0`. Control: `t(ℤ[i])=2ℤ ≠ ℤ`; Galois condition fails. | Correct cited consequence | R02 repaired |
| §3.5 presentation, source-correction note at README:3138 | `R = K°/ϖ³`, `T = 1`, `k = 0`, `j = 0,2` | Formula (4.3): `U=1, ϖ²`; misprinted presentation: `U=ϖ, ϖ`. Corrected relation gives `1, ϖ²`. | Missing `j` verified | Misprint recorded |
| §§2.4(5), 3.3, 3.10, source-gap note at README:3142 | `C=B×K`, `g=(T₁,0)` from §3.3; `u=ϖ` | `g(0,1)=0`; `ψ(b,c)=(ϖT₁b,0)` and `ιψ=ug`. Both annular algebras are `P{ϖʲ/T₁}×0`. | General invariance applies; source lemma's hypotheses fail | Proof gap recorded |

The adversarial rows for untouched statements stand as in the previous review, of `df3fb44`.

- Source locators checked: 8 in ANDRE18A: Remarques 1.8.1 (line 279, p. 8), Proposition 1.9.1 (line 326, pp. 9–10), Lemme 2.6.2 (line 1176, p. 29), Proposition 4.2.1 and (4.3) (lines 2477–2571, pp. 54–55), Théorème 4.2.2 (line 2580, p. 55), Lemme 4.2.3 (line 2619, p. 56), Remarque 4.2.4 (line 2629, p. 56), §4.4.2 (line 2906, p. 61); seeded §3.3 checked where the new note invokes it.
- Pinned declarations opened: 8: Mathlib `IsAlmostIntegral`, `completeIntegralClosure` (`Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:27,32`); Tau Ceti `IsPerfectoidTateRing` (`TauCeti/RingTheory/Perfectoid/Basic.lean:86`), `BasicSetup` (`TauCeti/RingTheory/Almost/BasicSetup.lean:111`), `powerBoundedSubring`, `mem_powerBoundedSubring` (`TauCeti/RingTheory/Huber/PowerBounded.lean:456,466`), `IsFiniteEtaleTorsor` (`TauCeti/RingTheory/Etale/Torsor/Basic.lean:88`), `tensorToPi` (`TauCeti/RingTheory/Invariant/Free.lean:111`); none supplies the root-saturation theorem.
- Affected supplier sections resolved on main: 10, PerfectoidSpaces P0.1, P0.8, P0.9, P0.11, P0.12, P0.14, P0.25, P1.1, P1.11 and AdicEtaleGeometry A4.2; the tensor-factor swap matches the pinned Galois map.
- Gate: all scanners pass; dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; 0 outside-folder changes; targeted `lake build TauCetiRoadmap.PerfectoidSpacesPartII.Suggested` succeeds.
- Elaboration: direct `lake env lean` and a scratch copy with 35 `#check @name` commands each succeed with 10 `sorry` warnings and 0 errors; the affected closure signatures retain completeness, Hausdorffness, perfectoidness and continuity, with no regularity binder, matching §3.6.
- PR title, prose and `roadmap-summary` checked: 0 contradictions or material omissions; the base comparison adds 3 files, 75 headings and 35 declarations, including 10 admitted headline theorems; it removes none.

Overlap check: read DirectSummandsAndBigCohenMacaulay, PerfectoidQuotientsPartII, PerfectoidTowers, PerfectoidQuotients, RelativeFarguesFontaine, PerfectoidSpaces, AdicEtaleGeometry and AdicSpacesPartII. For the affected objects, PerfectoidSpaces owns almost algebra and perfectoid carriers; AdicEtaleGeometry owns ordinary finite étale torsors; this roadmap owns almost Galois extensions, the annular invariance extension and root-saturation Riemann extension. No competing owner was found in the other scopes or the open/main object search.

Source independence: changed passages only; 6 passages compared with 1 source, with no copied expression or reused material found. Largest share: ANDRE18A, 93 of 166 source citations (the previous tally plus 3). No layer was added, removed or reordered; the contents comparison of `df3fb44` stands.

## Not verifiable

- none

## Source issues

- **Misprint** in ANDRE18A at Proposition 4.2.1, proof, pp. 54–55 (lines 2523–2564): the source says the presentation and divisibility use the exponent `1/pᵏ` on `ϖ`; it should be `j/pᵏ`, as in (4.3) and the intervening factorization; affects the proof.
- **Gap** in ANDRE18A at §4.4.2, p. 61 (lines 2906–2910): the source says annular invariance follows from Lemme 2.6.2, whose regularity and embedding hypotheses can fail; it should be derived from injective-counit invariance using multiplication by `ug`; affects the proof.

## For the human reviewers

- **Licence.** The clause order in `TauCetiRoadmap/PerfectoidSpacesPartII/README.md:2342,2623,2742` follows ANDRE18A lines 56–68 and ANDRE18B lines 333–366. Earlier reviews treated the correspondence as mathematically forced.
- **Licence.** The sketches at `TauCetiRoadmap/PerfectoidSpacesPartII/README.md:1473,1821,2607,2847` keep the routes of ANDRE18A lines 1720–1723 and 2637–2643 and ANDRE18B lines 232–234 and 386–545. Earlier reviews treated these as mathematical routes.
- **Scope.** In `TauCetiRoadmap/PerfectoidSpacesPartII/README.md`, §§2.2–2.4 and 2.6–2.9 follow ANDRE18A §§2.3, 2.5, 2.6, 2.8 and 2.9; §§3.3–3.11 and 4.3–4.8 follow its §§3.5–5.4. Earlier reviews found most ordering forced by dependencies.
- **Scope.** `TauCetiRoadmap/DirectSummandsAndBigCohenMacaulay/README.md:94` declares `gap:ramified-multielement-kummer` with this roadmap as supplier. `TauCetiRoadmap/PerfectoidSpacesPartII/README.md:2835` states no multi-element or ramified-base Kummer target.
- **Scope.** `TauCetiRoadmap/PerfectoidSpacesPartII/README.md:3090` introduces seventeen claimed source corrections. Earlier reviews recomputed five; this round checked the two newly listed corrections against ANDRE18A.
