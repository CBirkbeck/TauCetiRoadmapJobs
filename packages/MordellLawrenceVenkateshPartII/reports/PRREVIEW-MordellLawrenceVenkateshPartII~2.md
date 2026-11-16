# Review of MordellLawrenceVenkateshPartII (pull request #2461 at 0351865)

**Verdict:** accepted

No findings. This is an incremental re-review of the 67 lines that changed since 1be51aa.

## Previous findings

- R01 — not repaired: deferred (D01)
- R02 — repaired: `Suggested.lean` now states only `integralHypersurfaces_not_zariskiDense`. README line 85: "**ClassicalArithmeticCompletion** §§2.18, 2.39 and 2.56 own Eulerian numbers, their basic identities and unimodality." §8.4 (line 2879) keeps its statement as a target.
- R03 — repaired: README line 3530 "**LS, proof of Lemma 5.29, p. 51.** The orbit algebra `E_I` is taken to be the pushforward…". Line 3551 has the bullet on LS Theorem 9.2, p. 86, and line 3556 the bullet on LS Corollary 9.3, pp. 87–88, each with its instance.
- R04 — repaired: README line 3397 "The `A(K)`-orbit form of the finiteness is that of LS, proof of Theorem 9.2, p. 85 (LS lines 3900–3902)". In §1.3 (lines 982–983), the LS locator now follows only the coequalizer sentence.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values on the roadmap side | Values on the source or independent side | Result |
|---|---|---|---|---|
| §1.3 relative tensor product and E-balanced pairings | `E = ℚ × ℚ`, `V = (ℚ, ℚ²)`, `W = (ℚ², ℚ)`; `E = ℚ(i)`, `B(v, w) = v·ι(w)` | `V ⊗_E W = (ℚ², ℚ²)`, dim 4, against dim 9 for `V ⊗_ℚ W`; `B(i, 1) = i`, `B(1, i) = −i` | LS lines 2156–2163 (Rem. 5.23, p. 47): coequalizer of `E⊗V⊗W ⇒ V⊗W`, no balanced pairings | holds; the locator now covers only the coequalizer |
| §8 convention for `A(n, q)` | `n = 0, 1, 2` | `A(0, 0) = 1`, `A(0, q ≥ 1) = 0`; rows `(1)`, `(1, 1)` | ClassicalArithmeticCompletion §2.18 on main (its README line 3008); brute-force counts equal the recurrence for `n ≤ 7` | holds |
| §8.4 central mass `2ΣA(n,q)² ≤ (n!)²` | `n = 1, 2, 3, 4, 5, 6, 20` | `2, 4, 36, 488, 11420, 377816`; at `n = 20`, `β₀ = 0.2125` | `(n!)² = 1, 4, 36, 576, 14400, 518400`; LS line 4321 (Lemma A.6, `n ≥ 2`, p. 92) | holds; `n = 1` fails and is excluded |
| Correction to LS Lemma 5.29 (§1.7) | `K = ℚ`, `r = 3`, trivial `χ`; `K = ℚ(i)`, `r = 3` | `|I| = 1`, so `E_I` has ℚ-rank 1 | the pushforward of `ℚ(μ_3)` along `K/ℚ` has rank 2, resp. 4, for every orbit (LS lines 2348–2349 against 2266–2269) | correction valid |
| Correction to LS Theorem 9.2 (§10.4) | `y² = x²(x + 2)`, `t ↦ (t² − 2, t(t² − 2))` | `t = 1 ↦ (−1, −1)`, on the curve; `t ∈ ℤ` gives dense integral points; the node comes only from `t = ±√2` | LS line 3943 (p. 86): every integral point lifts by properness | correction valid |
| §10.8 and the correction to LS Corollary 9.3 (§10.9) | `A = E × B`, `T = E[2] × 0`, `E : y² = x³ − 2` over ℚ; `T = 0` | `π = [2] × id`; cokernel `E(ℚ)/2E(ℚ) = ℤ/2` (rank 1, point `(3, 5)`, no rational 2-torsion); trivial for `T = 0` | LS lines 4029–4030 apply Theorem 9.2 to `(A′, φ′)`; LS lines 3900–3902 (p. 85) use `A(K)`-orbits | holds; locators exact |
| Correction to LS Theorem 9.6 (§10.10) | `f` with image an elliptic curve `E ⊂ A`, `C → E` of degree `k`; `2f` | image cycle: `f(C)·ψ = (2f)(C)·ψ = E·ψ`; pushforward: `k·E·ψ` and `4k·E·ψ` | LS lines 4054–4055 define `deg f = f(C)·ψ` and call it quadratic | correction valid; §10.10 uses `h_*[C]·φ` |
| §9.3 / `integralHypersurfaces_not_zariskiDense` | `#check @`; the zero form; `simp`, `norm_num` | quantifier order `n₀, n, D₀, d, S, G` as in the README; `¬IsSmoothHypersurface 0` elaborates as a proved `example`; both probes leave goals | README lines 3154–3159; LV Thm 10.1 with Prop. 10.2 | holds; not padding |

The rows for the untouched statements stand as in the previous review, of 1be51aa.

- Source locators checked against the LS text this round: 11 (lines 2141–2163, 2266–2269, 2348–2349, 3900–3902, 3943, 4013–4030, 4054, 4255, 4290, 4321, with their pages 47, 49, 51, 85–88, 91–92). Of the seeded sample, only §§1.7 and 8.4 fall in the changed passages; the other 13 sampled targets are untouched.
- Cross-roadmap citations resolved: ClassicalArithmeticCompletion §§2.18, 2.39 and 2.56 on main (its README lines 3008, 3604 and 4071), and HeightsRationalPointsAndObstructions §§1.6–1.7 (Weak Mordell–Weil, Mordell–Weil). The overlap tool reports no open pull request that changes this roadmap or drops an id it cites.
- R02 residue: no README text mentions `eulerian`, `Equiv.Perm`, `Finset.filter`, `Nat.factorial` or a `Suggested.lean` restatement. The backticked names of this roadmap's own are exactly the four declarations.
- Gate at 0351865: every check passed, both in my run and in the worker's run, which includes the targeted build. Dependency check: `depcheck: 263 roadmaps, 2577 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The diff changes no file outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, `sorry` at line 94. `#check @` of all four declarations shows every binder kept. The signatures tool's "structure `,`, line 24" and its line-103 error come from its parser reading the docstring word "structure,"; they are not in the file.
- Ownership: `roadmaps grep` over main and the 458 open heads finds no other owner of the `A(K)`-translation cokernel or of the central Eulerian mass. Removing `eulerian` ends the restatement of ClassicalArithmeticCompletion §2.18.
- D01: the plan's `gaps` still has nine slugs, without `griffiths-residue-hodge-filtration`. The README states the contract at line 433 and uses it at lines 2929, 2952 and 3034.
- Remark on untouched text: the Source-corrections preamble says each correction has an explicit instance, but the bullet on LS Definition 5.44 has none.

Overlap check: the three lists are unchanged since 1be51aa. Open by vocabulary: SheafConvolutionOnAbelianVarieties, MordellLawrenceVenkatesh, GaloisSectionsPadicPeriodMaps, KloostermanMomentsAndPotentialAutomorphy, MixedHodgeModulesAndIrregularHodgeTheory. On main by vocabulary: AbelianSchemesAndArithmeticModuli, AlgebraicModuliForArithmeticGeometryPartII. By results: none. The change adds no object, so the owners recorded at 1be51aa stand:
- §§3.3 and 10.7 are owned here.
- `gap:hodge-tate-image-cocharacter` is one contract on PadicHodgeTheory.

Source independence: changed passages only; 7 passages compared with 1 source (LS: §1.3, §8.4, §10.8 and the four new Source-corrections bullets), none shared beyond forced notation (longest run 5 words, `f: Jac C → A`, LS line 4053); largest share LS, 143 of 190 locators; contents compared with LS: independent at 1be51aa, not compared again because no layer was added, removed or reordered.

## Not verifiable

- Serre, *Galois cohomology*, I §5.4 and III §4.3 (§2.11): recorded as uncertified in the manifest; no legal text is cached.
- §7.4's Check against arXiv v3 of LV: the v3 text is not cached; only the printed version was read.
- Public formalisations outside the pinned libraries matching the `Suggested.lean` declarations: not searched.

## Source issues

- **Error** in LS at proof of Lemma 5.29, p. 51: the source says the orbit algebra is the pushforward along `K/ℚ` of the `ℚ(μ_r)` unit system, of rank `[K:ℚ]φ(r)`; it should be the descent of the orbit summands, of rank `|I|`; affects the proof.
- **Gap** in LS at proof of Theorem 9.2, p. 86: the source says properness lifts every integral point of the closure to the resolution; it should restrict to the open set where the resolution is an isomorphism (a nodal point need not lift); affects the proof.
- **Gap** in LS at Corollary 9.3, pp. 87–88: the source passes from `A′(K)`-orbits of primitive quotients to `A(K)`-translation classes without bounding `A′(K)/π(A(K))`; it should add the finiteness of that cokernel by weak Mordell–Weil; affects a stated result.
- **Misprint** in LS at proof of Theorem 9.6, p. 88: the source measures a homomorphism by the intersection of the image curve with `ψ`; it should use the pushforward cycle `f_*[C]`, which is quadratic in `f`; affects the proof.

## For the human reviewers

- **Licence.** The cached LV text comes from `bimsa.net` (`packages/MordellLawrenceVenkateshPartII/sources.toml` line 32), an institutional site that is neither the publisher's nor the authors'. The README cites the Inventiones article and arXiv:1807.02721v3 (README lines 3610–3612).
- **Licence.** Serre, *Galois cohomology*, is recorded as uncertified (paywalled). Its locators in §2.11 (README lines 1628 and 1633) were not checked against a text.
