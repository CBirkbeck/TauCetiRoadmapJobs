# Review of AnabelianGeometryAndNonabelianChabauty (pull request #1021 at 227f000)

**Verdict:** accepted

Incremental re-review of the 46 lines changed since 5df4b21: §3.5 gains the target "Centre-freeness of free pro-p groups" (statement at arbitrary rank at least two, a reduction to rank two, the rank-two case through Tamagawa, three Checks, locators and a Use list), the two §3.5 sketches and Use lists now cite it instead of ProfiniteProPGroups Layer 4, the scope paragraph records the ownership, and every link into ProfiniteProPGroups, LocalFieldsRamification and ProfiniteArithmetic points at `Completed/`. Both previous findings are repaired and the repair introduced no new problem. No finding.

## Previous findings

- R01 — repaired: `README.md:5886` "#### Centre-freeness of free pro-p groups" states "A free pro-p group `F` on a basis converging to `1` whose basis has at least two elements … has trivial centre", with the rank-two reduction and Tamagawa's Proposition 1.11; `README.md:5876` and `5910` cite it.
- R02 — repaired: every `blob/main/…` link to ProfiniteProPGroups, LocalFieldsRamification and ProfiniteArithmetic now reads `Completed/<Name>/README.md`; no `TauCetiRoadmap/<Name>` link to a roadmap that lives under `Completed/` on main remains (sweep over all 26 `Completed/` names).

## Verified sound

### Gate, dependency order, folder and elaboration

- My own run of the gate on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate at this head adds `build=0`.
- Dependency check with `--movable`: `depcheck: 205 roadmaps, 1680 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty'` is empty. The folder holds README.md, Suggested.lean and metadata.toml.
- `Suggested.lean` is byte-identical to the head of the previous report (`git diff 5df4b21 HEAD -- …/Suggested.lean` empty). I elaborated a scratch copy with `#check @anabelian_isom` appended, with `lake env lean` from the worktree (the pinned `TauCeti.AlgebraicGeometry.Cohomology.Genus` object file is present in this worktree's package directory at Mathlib 6b7abb3c): 17 s, `declaration uses sorry` the only message. The printed type keeps every binder: `Fact p.Prime`, both fields, `Algebra ℚ_[p] L`, the embedding, the finite-generation witness, both `SmoothOfRelativeDimension 1`, `IsProper` and `GeometricallyConnected` instances, both `FiniteDimensional` instances on `H¹(O)`, both genus bounds, the equivalence of finite étale categories, the constant-cover compatibility and the `∃! f` conclusion. The one-tactic probe of the earlier reports stands, the file being unchanged.

### Changed passages: sources opened

| Passage | Text and locator | Result |
|---|---|---|
| New target, rank-two case: `π₁` of `ℙ¹` minus three points is the profinite completion of the free group of rank two | `t97` line 1166 (Proposition (1.1)(i): in characteristic zero `Π ≅ Π̂_{g,n}`) and line 1162 (`Π_{g,n} ≅ F_{2g+n−1}` for `n>0`), page marker 8 = printed p. 142 (page 1 = p. 135) | Locator "Proposition 1.1 (i), p. 142" exact; `Π` is `π₁` of the geometric curve over `k̄` (line 1087) |
| New target: type `(0,3)` is nonabelian | `t97` line 1386–1388 (Corollary (1.4)(i): in characteristic zero or tame, `Π` abelian iff `(g,n)∈{(0,0),(0,1),(1,0)}`), printed p. 144 | Locator exact; `(0,3)` is outside the list |
| New target: the maximal pro-p quotient is centre-free | `t97` line 1608–1612 (Proposition (1.11): `Π` nonabelian, a prime `l≠p` with `ℤ/l∈C`, then `Π^C` is centre-free; the extra `ℤ/p∈C` clause only arises for `p>0`, unrestricted, `n>0`), printed p. 146 | In characteristic `p=0` the prime `l` may be the roadmap's `p`, and `C` = finite `p`-groups contains `ℤ/p`; the hypotheses of the citation are met for `(0,3)` and for proper genus `≥2` |
| First §3.5 target, proper case: "Tamagawa's centre-freeness of the surface pro-p groups of genus at least two (Proposition 1.11)" | same Proposition (1.11) with `C` = finite `p`-groups, `n=0`, `g≥2` nonabelian by Corollary (1.4)(i) | Supports the statement as written |

### Supplier citations resolved for the changed passages

| Citation | Where it resolves on main (929496d) | Result |
|---|---|---|
| ProfiniteProPGroups Layer 10, pro-p Nielsen–Schreier for closed subgroups | `Completed/ProfiniteProPGroups/README.md:2115` (heading), line 2184 "Closed subgroups of free pro-`p` groups are free pro-`p`, which is the full pro-`p` Nielsen–Schreier theorem" | Supplies the step "⟨z,y⟩ and H are free pro-p" at every rank |
| ProfiniteProPGroups Layer 3, rank through the Frattini quotient | `Completed/ProfiniteProPGroups/README.md:312`; the rank of a free pro-p group as the dimension of its Frattini quotient and the proof note on bases converging to 1 (lines 525–532) | Supplies "two topological generators ⇒ rank ≤ 2" |
| ProfiniteProPGroups Layer 4, free pro-p group on a finite set as the pro-p completion of the discrete free group | `Completed/ProfiniteProPGroups/README.md:535`; construction bullet (lines 565–570): `freeProfiniteGroup X := profiniteCompletion (FreeGroup X)` and `freeProP p X := maximalProPQuotient p (freeProfiniteGroup X)` | Supplies exactly the identification the sketch needs: the free pro-p group of rank two is the maximal pro-p quotient of the profinite completion of `F₂` |
| ProfiniteProPGroups Layers 6 and 7, LocalFieldsRamification Layer 4 (links moved to `Completed/`) | headings at `Completed/ProfiniteProPGroups/README.md:1010`, `:1182`, `Completed/LocalFieldsRamification/README.md:1154` | Every anchor used into a `Completed/` roadmap (six distinct) matches a heading on main; the `ProfiniteArithmetic` link resolves to `Completed/ProfiniteArithmetic/README.md` |
| ProfiniteProPGroups states no centre fact | `Completed/ProfiniteProPGroups/README.md` has no occurrence of "centre", "center" or "centraliz" | The scope sentence at `README.md:7` is accurate |

Ownership: `roadmaps grep` over main and the 440 open pull requests for a centre-freeness statement about free pro-p groups returns only this README (lines 7, 5872–5921). No pinned Tau Ceti module under `Topology/Algebra/Group/Profinite` states a centre lemma. This roadmap is the owner, and says so in `## Scope and ownership`. Ownership against open pull requests whose files the brief does not supply was not checked.

### Adversarial pass

New rows carry computed values; rows for statements the diff leaves untouched are carried from the previous report (which carries the 108-row table with the exhaustive `S₃` test from the reports before it).

| Statement | Instance | Values on each side | Result/change |
|---|---|---|---|
| New target, rank one excluded | `ℤ_p` | free of rank 1, `H¹=𝔽_p`, `H²=0` (`cd=1`), centre `=ℤ_p≠1` | Hypothesis `rank≥2` needed; Check 1 correct |
| New target, freeness needed | `ℤ_p²` | `H¹` of dimension 2; `H*(ℤ_p²,𝔽_p)=Λ(e₁,e₂)`, so `H²=𝔽_p·e₁e₂≠0`, not free; centre `=ℤ_p²` | Check 2 correct; a model with "rank ≥2" alone is false |
| Reduction step "abelian closed subgroup of a free pro-p group is procyclic" | `⟨x,x^p⟩⊂F₂` versus `⟨x,y⟩⊂F₂` | `⟨x,x^p⟩=⟨x⟩≅ℤ_p` (rank 1); `⟨x,y⟩=F₂` maps onto `Heis(𝔽_p)`, not abelian | Positive and negative instance agree with the step |
| Reduction step "`H=⟨g_{y₁},g_{y₂}⟩` has rank exactly two" | `F₃` on `x,y,w`, hypothetical central `z`, `y₁=x`, `y₂=y` | `d(H)≤2`; `H∋x,y` with `xy≠yx` (Heisenberg image), so rank `≠0,1`; rank `=2` | Step correct; contradiction then comes from the rank-two case |
| Rank-two case through `ℙ¹∖{0,1,∞}` | `(g,n)=(0,3)` | `2g+n−1=2`; Cor 1.4(i): abelian only for `(0,0),(0,1),(1,0)`; Prop 1.11 with `l=p`, `C`=`p`-groups | Hypotheses met in characteristic 0; identification by the Layer 4 definition of `freeProP` |
| Heisenberg Check, odd `p`: image of `[x,y]` under `x↦1+E₁₂+E₃₄`, `y↦1+E₂₃` in `UT₄(𝔽_p)` | `p=3,5,7` (script, `[x,y]=xyx⁻¹y⁻¹`) | `[x,y]↦1+E₁₃−E₂₄−E₁₄` (exact match); `[[x,y],x]↦1+2E₁₄≠1` for odd `p` | Check correct; by hand: `ab=E₁₃`, `ba=E₂₄`, `ma=E₁₄`, `am=−E₁₄` |
| Heisenberg Check, `p=2` | `D₁₆`, `r⁸=1`, `srs⁻¹=r⁻¹` | `[r,s]=rsr⁻¹s⁻¹=r²`; `s r² s⁻¹=r⁻²=r⁶≠r²` | Check correct; `UT₄(𝔽_2)` would give `1+2E₁₄=1`, which is why the Check switches group at `p=2` |
| Heisenberg Check, "centre of order `p` generated by `[x,y]`" | `UT₃(𝔽_p)`, `x=1+E₁₂`, `y=1+E₂₃` | `[x,y]=1+E₁₃`; centre `{1+tE₁₃}` of order `p`; for `p=2` the group is `D₄` with centre `⟨r²⟩` | Correct for every `p` |
| "A free pro-p group with two distinct basis elements maps onto the nonabelian group of order `p³`" at infinite rank | basis `X` converging to 1, `x≠y∈X` | the map `x↦1+E₁₂`, `y↦1+E₂₃`, rest `↦1` converges to 1, so extends; image nonabelian | Holds at every rank |
| "`dim H¹(F,𝔽_p)` is the cardinality of a converging basis" | `X` infinite converging to 1 | continuous characters are the finitely supported maps `X→𝔽_p`: dimension `#X` (PPG Layer 3 proof note) | The "equivalently" clause is right; `freeProP p X` for infinite discrete `X` has rank `p^{#X}` (PPG Layer 4 warning) and is still covered |
| First §3.5 target, affine rank bound `2g+r−1≥2` | `(g,r)=(0,3),(1,1),(0,2),(0,1)` | `2,2,1,−1`; the last two are not hyperbolic (`2g−2+r=0,−1`) | Bound exact on the hyperbolic affine types |
| First §3.5 target, "to every open subgroup" (affine) | `U` open of index `m` in `F_n`, `n≥2` | Schreier: rank `U = m(n−1)+1 ≥ 2` | The new target applies to every open subgroup |
| Local case consumer, `README.md:5910` | `G_(K^tm)` | free pro-p (Serre, Layer 10), `dim H¹` infinite (`H¹ rank` Check: `≥[L:ℚ_p]+1−2` unbounded) `≥2` | The new target closes the step the previous R01 left open |
| Tame-quotient witness, `H¹ rank`, unramified restriction, Brauer step, finitely generated induction, consumer `README.md:6361` | as in the previous report | carried | Carried |
| Dilogarithm Check, SectionConjecture Checks, Hoshi non-example, §0.11, §0.13, §0.18, §0.30, §0.31, §1.2, §2.3, §2.4, §3.7, §4.8, §4.9, §6.3, §6.6, §6.8, §7.4 | earlier samples, untouched | carried | Carried |
| Headline `anabelian_isom` | genus-2 curve, identity versus hyperelliptic involution | `+I` and `−I` on `H⁰(Ω¹)`, distinct outer classes; `∃!` is uniqueness within one class | Carried; the Lean is unchanged and re-elaborated here |

### Seeded sample

Of the sampled targets (0.4, 0.8, 0.11, 0.16, 0.19, 0.22, 0.27, 2.7, 3.4, 3.5, 3.10, 4.1, 5.7, 5.11, 7.5) the diff touches §3.5 in substance (verified above in full: statement, hypotheses, sketch inputs, three Checks, locators and Use list of the new target, and the two sketches that now cite it), and §3.4 (`README.md:5804`) and §3.10 (`README.md:6410`) only in the folder of a link, whose anchors resolve on main. The other sampled targets were verified in the earlier full reviews and are not re-examined here.

### Shape of the changed passages

The new target follows the README's target shape: statement, hypotheses line, prose sketch with its inputs named, `**Checks.**` with three discriminating bullets (degenerate rank, a non-free control, a finite-quotient witness with computed values), locator line and Use list; no process words, pull-request numbers, LaTeX or `lemma`; the gate's scanners agree. The scope sentence is a deferral statement in the one section that may say what a supplier does not state.

## Not verifiable

- The passages the diff does not touch were not re-examined; the previous reports' unverifiable items stand: Hadian's thesis, Labute 1967, the published Achinger, Serre Chapter V and Stix 2013 locators, and Kim 2008's published pagination.
- Ownership against open pull requests whose files the brief does not supply was not checked.

## Source issues

- none
