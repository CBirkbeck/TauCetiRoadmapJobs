# Review of StableReduction (pull request #2669 at 4b23caa)

**Verdict:** accepted

**Summary.** This incremental re-review of the 53 lines changed since `efe1819` finds that all four small corrections of the previous review are repaired, that no repair introduced a new problem, and that the pull request's description agrees with this head; the roadmap is accepted. There are no findings, no small corrections and no format notes. Two points remain for the human reviewers: the licence class of the Knudsen II copy, and the relative `Proj` statements that SchemeAndStackFoundations §0.3 on main still plans.

## Deferred findings

- D01 — stands

## Previous findings

The previous review, of `efe1819`, raised no finding (no R-numbered point). Its four small corrections:

- C01 (hypotheses left to context in §2.2 and §5.2) — repaired: "for a family of curves `f` with geometrically connected and geometrically reduced fibres" (line 414); "For a generic fibre `C` with `H⁰(C, 𝒪_C) = K` and of positive genus" (line 956).
- C02 (§11.7 criterion unstated) — repaired: "`g ∘ F` is stable exactly when every component of a geometric fibre that `g ∘ F` contracts and `F` does not has positive log-canonical degree (§10.3)" (line 1728).
- C03 (affine comparison already at the pin) — repaired: "over an affine `S` it is Mathlib's `Proj` of the graded ring `A(S)`, by the chart square `CategoryTheory.CommMon.isPullback_relativeProjCover` on the affine open `S` itself" (line 488); Scope (lines 1769, 1783) and the Tau Ceti contract (line 2007) follow.
- C04 (nodal cubic in characteristic 2) — repaired: "Over a field of characteristic not `2` or `3`, a plane cubic" (line 421); "Over a field of characteristic not `2`, the twisted cubics" (line 427).

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| §2.2 genus formulations (changed) | K3 surface; two disjoint lines; conic `xy = tz²` | K3 now excluded: relative dimension 2 > 1 (Convention 5); lines: `χ = 2`, `1 − χ = −1 ≠ 0`, excluded by connectedness; conic: `h¹ = 0`, `χ = 1 = 1 − 0` | true as stated |
| §2.2 Check, Weierstrass family (changed) | `y² = x³ + x²`, `x = x' − 1/3` | `x'³ − x'/3 + 2/27`; `4a³ + 27b² = −4/27 + 4/27 = 0`; needs 3 invertible; node needs `y² − x² = (y − x)(y + x)`, 2 invertible | true in characteristic not 2, 3 |
| §2.2 Check, twisted cubics (changed) | origin of `y² = x²(x + 1)`; characteristic 3 | preimages `t = ±1`, distinct iff 2 ≠ 0; `(t³ − t)² = (t² − 1)²·t²`, any characteristic; `h⁰ = 1 + 1 = 2`, `h¹ = 1`, `χ = 1` | true in characteristic not 2 |
| §2.5 affine comparison (changed) | chart square at `U = S` affine | `U.toOpens.ι` iso for `U = ⊤`, so its pullback, the chart `Proj (⨁ₙ Γ(Aₙ, S)) → relativeProj A`, is an iso over `S` | holds from `RelativeProj/Basic.lean:266` |
| §5.2 minimal models (changed; sampled) | `E ⊔ ℙ¹_K`; `ℙ¹_K`; Stacks 55.10.1, 55.10.2 | `H⁰ = K × K ≠ K`, now excluded; genus 0 excluded; source: smooth projective, `H⁰(C, 𝒪_C) = K`, genus > 0 (stacks-0CDN l. 3078, 3106–3107) | hypotheses equal the source's |
| §11.7 postcomposition criterion (changed) | `id_{ℙ¹}` then `ℙ¹ → Spec k`; same with markings `0, 1, ∞`; closed immersion | newly contracted, degree `−2`: not stable; degree `−2 + 3 = 1 > 0`: stable; no new contracted component: stable | true; equals §10.3 applied to `g ∘ F`, contracted set grows by `IsContractedComponent.postcomp` (`Curves/StableMaps/Contracted.lean:178`) |
| Scope paragraph on SchemeAndStackFoundations §0.3 (changed) | that roadmap on main, lines 821–825 | it states `relativeProj_affine_iso` "from the chart square", `relativeProj_baseChange`, `relativeProj_veronese` | README's description of it is accurate |
| `exists_hasNodalReduction` (cited by the description; untouched) | elaborated at this head | type unchanged since `efe1819`; `sorry` warning only | stands |

The rows of the previous review for the untouched statements stand as in that review, of `efe1819`.

- Source locators checked against the text: 2 (Stacks Lemmas 55.10.1 and 55.10.2, stacks-0CDN lines 3078 and 3106), the only locators attached to a changed statement; both agree. The Stacks locators 27.16.10 and 27.11.8 in §2.5 were moved, not changed.
- Library declarations opened at the pin: `CategoryTheory.CommMon.isPullback_relativeProjCover` (`TauCeti/AlgebraicGeometry/RelativeProj/Basic.lean:266`), `isProper_relativeProjToBase` (`RelativeProj/Proper.lean:118`), `PrestableMap.postcomp` (`Curves/StableMaps/Basic.lean:169`), `PrestableMap.postcompFunctor` (`Curves/StableMaps/Category.lean:216`), `IsContractedComponent.postcomp` and `isContractedComponent_postcomp_iff` (`Curves/StableMaps/Contracted.lean:178`, `:193`).
- Cross-roadmap citations resolved on main: SchemeAndStackFoundations §0.3 (lines 821–836), the one citation in a changed passage.
- Automatic checks: all passed when rerun at this head. Dependency check output: `depcheck: 182 roadmaps, 2082 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside `TauCetiRoadmap/StableReduction/`; `Suggested.lean` is unchanged since `efe1819`.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 61, 79, 104) and the output of the one `#check` pinning `IsProper.eq_valuativeCriterion`; nothing else.
- Pull-request text: read against this head. Its counts agree (73 Checks in 47 blocks, two theorems added, the AlgebraicVectorBundles supplier dropped), and it now describes each repair: the characteristic of the twisted-cubic Check, the §2.2 and §5.2 hypotheses, the §11.7 criterion, and the affine comparison as Tau Ceti's chart square. It says that the roadmap on main is revised and names the sections replaced. No sentence is contradicted by the head.
- Seeded sample: of the listed targets only §5.2 lies in a changed passage (row above); the others are untouched since `efe1819`.

Overlap check: read SchemeAndStackFoundations (main, §0.3), JacobianChallenge (main) and AnalyticStableMaps (main), with StableReductionPartII and AlgebraicGromovWittenTheory (open) as in the previous review; the one shared object is base change and Veronese invariance of `CategoryTheory.CommMon.relativeProj`, owner §2.5 here (that roadmap consumes Layers 0–4); the affine comparison is Tau Ceti's. The overlap tool lists no dropped id and no other pull request changing this roadmap.

Source independence: changed passages only; 6 passages compared with 2 sources (stacks-0CDN at Lemmas 55.10.1–55.10.2, and the pinned Tau Ceti docstrings of the chart square), none shared beyond what the mathematics forces; largest share stacks-0CDN, 31 of about 96 locators, as in the previous review; the diff adds, removes and reorders no layer, so the contents comparison (independent) stands.

Research link: Layers 7–9 state the stable reduction theorems of Artin–Winters (1971) and Deligne–Mumford (1969, Corollary 2.7), the inputs to properness of the moduli of stable curves and, with Knudsen (1983, Theorem 2.7), of pointed curves; Layers 10–11 are the stable-map foundations of Behrend–Manin (1996) and Fulton–Pandharipande (1997). Rests on the README and the sources read.

## Not verifiable

- Liu, *Algebraic Geometry and Arithmetic Curves*, and Artin–Winters, Topology 10 (1971): paywalled, cited without a locator; no changed passage cites them.
- SGA 1, Exposé VIII, Proposition 7.8 (§2.8): not opened this round; untouched.
- Knudsen II: read in earlier rounds from a text whose host the sources service places in no licence class; no changed passage cites it.

## Source issues

- none

## For the human reviewers

- Licence: Knudsen II (cited in §§3.6–3.10, 9.4, 9.5) was read from an OCR text of the PDF at journals.msp.org (Math. Scand. article 1622); the sources service classifies that host in no licence class.
- Ownership outside this folder: SchemeAndStackFoundations §0.3 on main (lines 821–836) still plans `relativeProj_baseChange`, `relativeProj_veronese` and `relativeProj_affine_iso`; this README (lines 1780–1785) assigns the first two to §2.5 and the third to Tau Ceti's chart square.
