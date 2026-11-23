# GATE-CompressibleEulerEquations~1: answers to human review

## H01 (kim-em) — applied differently

`TauCetiRoadmap/CompressibleEulerEquations/README.md` line 2284 (Scope and ownership, **Fractional orders**): "they are not part of this roadmap and belong to "Compressible Euler equations, Part II"" → "well-posedness at real orders is not part of this roadmap or of "Compressible Euler equations, Part II"", which agrees with Part II's own Scope and ownership ("Well-posedness at real Sobolev orders … is not part of this roadmap"). The clause "with a separate roadmap to own them if wanted" is not added, because the README names no prospective owner and leaves no scope optional. No roadmap on main or at an open head plans well-posedness at real orders; IncompressibleFluids §3.3 (open) plans the Kato–Ponce commutator estimate on `Hˢ(E)` for real `s > 0`, which such a roadmap would consume.

## H02 (kim-em) — applied

README lines 2155–2161 (Downstream consumers, Part II bullet): the parenthetical "(characteristic data, acoustical geometry and real Sobolev orders)" → "(characteristic data and acoustical geometry)", and the clause "and well-posedness at real Sobolev orders `s > n/2 + 1`, through the Kato–Ponce commutator estimates on the PDE roadmap's Layer 7 paraproducts" is deleted. In the same bullet, "the ruling of the regular boundary of §8.4 … when the boundary is `C²` and the metric `C^{1,1}`" → "the ruling of the characteristic boundary of a development by null geodesics issuing from the edge of the data", because Part II §2.2 proves the ruling for `C¹` solutions (largest development in a slab, and the unique maximal development) with no `C²` or `C^{1,1}` hypothesis.

## H03 (kim-em) — applied

README lines 2159–2160: "It consumes §§3.1, 3.3, 4.1–4.4, 6.2, 7.1–7.2 and 8.1–8.4" → "It consumes §§1.1–1.3, 2.1–2.2, 3.1–3.3, 6.1–6.2, 7.1–7.3 and 8.1–8.4". This is exactly the list in Part II's supplier contracts (From TauCetiRoadmap.CompressibleEulerEquations), and its *Needs:* lines cite no section of Layer 4 or Layer 5. Part II §3.4's route extends §7.1 to sources depending on `(t, x)` "by the same energy method", constructed in Part II; our §7.1 has an autonomous source `F(U)`, so built that way the step draws on Layers 4–5 (Moser estimates, linear energy estimates and existence). If Part II adds them to its supplier contracts, this bullet should add them too.

## Same defect elsewhere in the README

- README lines 2274–2279 (Scope and ownership, **Characteristic initial data**) also gave Part II something it does not take: "…, and shock formation are not part of this roadmap; they are the subject of "Compressible Euler equations, Part II"". Part II's Scope and ownership says shock formation is a consumer and is not part of it. Shock formation is removed from that list, and the bullet now says "Shock formation is part of neither roadmap; its theorems are consumers of both (Downstream consumers, above)". In the same bullet, "LorentzianGeometry for `C^{1,1}` geodesics and null generators" → "for geodesics and null generators", because Part II takes the generators of LorentzianGeometry §12.7 for `C¹` metrics.
- The remaining mentions of Part II are consistent with Part II at its head: the opening overview (line 47: Part II and shock formation build on this roadmap), and no `Suggested.lean` declaration or docstring mentions Part II, shock formation or real orders.

## Adversarial pass on the changed sentences

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Part II consumes §§1.1–1.3, 2.1–2.2, 3.1–3.3, 6.1–6.2, 7.1–7.3, 8.1–8.4 | each section against Part II's supplier contracts and *Needs:* lines | §1.1: contracts (`EquationOfState`, `soundSpeed`); §1.2: Needs of its §1.1, §1.3, §3.1, §4.2; §1.3: Needs of its §1.1, §3.1; §2.1: contracts (`QuasilinearSystem`, `symbol`); §2.2: Needs of its §3.1, Layer 3; §3.1: Needs of its §1.2, §3.1; §3.2: Needs of its §1.1, §3.3; §3.3: Needs of its §§2.1, 2.3, 3.3, 4.2; §6.1: Needs of its §3.3, contracts; §6.2: Needs of its §3.4; §7.1: Needs of its §§3.2, 3.4; §7.2: contracts (`EquationOfState.localWellPosedness`); §7.3: Needs of its §3.4; §8.1: Needs of its §§2.2, 3.2, 3.3; §8.2: Needs of its §3.3; §8.3: Needs of its §§2.1, 4.1; §8.4: Needs of its §2.2. §4.x and §5.x: cited nowhere in Part II | every listed section is cited; no unlisted section is cited | applied |
| Part II takes no real-order well-posedness | Part II, Scope and ownership, Boundaries | "Well-posedness at real Sobolev orders `s > n/2 + 1` … is not part of this roadmap" | true | applied |
| Shock formation is part of neither roadmap and consumes both | our Downstream consumers (shock formation, §7.2, §§8.2–8.4); Part II, Scope and ownership | ours: listed as a consumer; Part II: "consumers of this roadmap and are not part of it" | true | applied |
| Part II rules the characteristic boundary by null geodesics from the edge | Part II §2.2: `n = 1`, `c = 1`, `v = 0`, `S = B(0, R)` (its Check) | generators: segments from `|x| = R` meeting at `t − t₀ = R/c₀`, past endpoints on `{t₀} × frontier S`; hypotheses: `C¹` solution, `S` regular, `c` and `|v|` bounded on slabs, no `C²`/`C^{1,1}` | the old `C²`/`C^{1,1}` description was stale; the new one states no hypothesis | applied |
| Real orders need Kato–Ponce built on PDE Layer 7 paraproducts (kept) | PDE on main, Layer 7 (§7.1 dyadic blocks, §7.2 Besov spaces, §7.3 Bony's decomposition) | the decomposition `fg = T_f g + T_g f + R(f, g)` is there; the estimates there are in `𝒞^s`, and the `L²` commutator bound would be proved on top of them | a route, not a supplier claim; unchanged | none |
| Integer orders `k > n/2 + 1` (kept) | §7.1: `2k > n + 2` | `n = 1`: `k ≥ 2`; `n = 3`: `k ≥ 3`, i.e. `k > n/2 + 1` | consistent | none |

## Lean, ownership, sources

- `Suggested.lean` is unchanged. Its 35 declarations keep the elaborated types of the job's signature file, none of which has lost a section binder, so no `#check @name` comparison was needed.
- Ownership: the repair states no new construction. It only takes back two misattributed handoffs. Ownership of real-order well-posedness was searched by object (`Kato.Ponce`, quasilinear hyperbolic) in every roadmap on main and at the open heads: it has no owner, and the only related plan is IncompressibleFluids §3.3 (the Kato–Ponce estimate on `Hˢ(E)`).
- No source was added and no text is missing, so there is no `needs-references.toml`.
- The review text contains no instruction outside the job.

## Build and gate

- `lake build TauCetiRoadmap.CompressibleEulerEquations.Suggested`: `Build completed successfully (18246 jobs).`, with only `declaration uses 'sorry'` warnings.
- Gate, at commit `a16a9e60`: `gate CompressibleEulerEquations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 132 roadmaps, 1473 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line).
