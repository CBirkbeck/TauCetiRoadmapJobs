# Review of ClusterAlgebras (pull request #1858 at cc59a91)

**Verdict:** accepted

This is an incremental re-review of the 0 lines changed since cce5d40. The head commit cc59a91 ("Refresh cluster roadmap CI against main") is empty: `git diff --stat cce5d40 cc59a91` prints nothing. Both `TauCetiRoadmap/ClusterAlgebras/README.md` and `TauCetiRoadmap/ClusterAlgebras/Suggested.lean` are byte-identical to the files the previous review accepted. No finding remains and the gate passes.

## Previous findings

- none: the review at cce5d40 raised no finding and accepted the folder. The R01 and R02 it accounted for came from the review at bb25a68, and it found both repaired. The passages it cited are unchanged at this head.

## Verified sound

**Gate and build.**
- Worker's gate at cc59a91 (`scratch/gate.md`): every counter is 0, including `depcheck=0` and `build=0`; result OK.
- I ran the gate myself with the configured order: every counter is 0 except `depcheck=1`, with the line `depcheck: NOT IN ORDER: ClusterAlgebras (insert it after its last supplier)`.
  - Cause: the board's `merge-order/ORDER.txt` (401 lines, at 537e346) does not list ClusterAlgebras yet. The candidate order this brief gives does list it, at line 402, and is otherwise identical to that file.
  - Not a finding. The brief makes "not in the merge order" not a defect, and a roadmap the order does not list is checked as placed after its last supplier.
  - All of this roadmap's suppliers are on main (ScatteringDiagrams, RootSystems, ReductiveGroups, SchemeAndStackFoundations, Completed/AnalyticToricGeometry), so any placement is downstream of them.
- Rerun of the same gate with `--order` set to the candidate and `--build`: every counter is 0, `build=0`, OK, exit 0.
- `lake env lean TauCetiRoadmap/ClusterAlgebras/Suggested.lean`: 8 warnings, all "declaration uses `sorry`" (lines 110, 121, 130, 137, 157, 165, 178, 188), and nothing else. The two `TauCeti.*` imports (`LinearAlgebra.RootSystem.FiniteType.Basic`, `RingTheory.SerreCondition.Basic`) resolve at the pin.
- Pins: `lake-manifest.json` is identical at HEAD and at origin/main (4452ffa), with Tau Ceti at 2fd255d. They are the pins the previous review used.
- Outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClusterAlgebras'` is empty. The pull request changes only `README.md`, `Suggested.lean` and `metadata.toml` in the folder.

**Dependency check** (`gate --depcheck … --movable --content … --pr 1858`):

```
depcheck: 235 roadmaps, 2266 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Suppliers on main, re-resolved because main moved from the merge base ffac513 to 4452ffa.**
- Since the previous review, the only commits touching the cited supplier folders are progress reports: 754650d (ReductiveGroups), fca24c4 (Completed/AnalyticToricGeometry) and 6610e39 (SchemeAndStackFoundations). Each changes only `PROGRESS.md` and `STATUS.md`.
- ScatteringDiagrams last changed at its merge (c40c3b4). At main, the README sections the contracts consume are all present:
  - §0.1 (line 142), §0.8 (501), §1.4 (731), §3.3 (1136), §3.4 (1221), §4.2 (1321), §4.3 (1391), §4.4 (1450), §5.1 (1503), §5.6 (1864), §7.2 (2187), §7.7 (2426).
  - The names the contracts consume are present: `SkewLatticeDatum` (1323), `AdaptedBasis` (1328), `principalGradingDictionary` (1349), `principalProjectionComparison` (1361), `QuantumMonoidAlgebra` (1394), `SlabAlgebra` (1461), `exists_outgoingCompletion` (1167), `outgoingCompletion_unique` (1229), `cylinderBrokenLineLift` (1886), `principalTheta_eq_projectedMonomialSum` (1896), `theta_presentationInvariant` (1900), `theta_coefficients_nonnegative` (2438).
- RootSystems (`RepresentationTheory/RootSystems`): Layers 1–3 at lines 428, 614 and 685.
- ReductiveGroups: Layer 7 (627), Layer 7C (652), Layer 8 (1023), Layer 10 (1731).
- SchemeAndStackFoundations: `coherent_hartogs` in §0.6 (line 707).
- Completed/AnalyticToricGeometry: Layer 0 (line 186).
- Tau Ceti at 2fd255d: `laurentEval` (`Algebra/Polynomial/Laurent/Basic.lean`:124), `laurentEvalEquiv` (:152), `DynkinType` (`LinearAlgebra/RootSystem/DynkinType.lean`:105, with `Valid` documented at :25), `IsFiniteType` (`LinearAlgebra/RootSystem/FiniteType/Basic.lean`:129).
  - `IsFiniteType` is defined as: finite index type ∧ diagonal 2 ∧ nonpositive off-diagonal entries ∧ symmetric zero pattern ∧ a positive rational symmetrizer with a positive-definite product. The finite-type headlines use it in that sense.

**Overlaps, citations, ownership.**
- `scratch/overlaps.md` (main 4452ffa, 454 open heads):
  - no other open pull request changes this roadmap;
  - no cited id is dropped by an open pull request;
  - no cited id exists only in an open revision;
  - no roadmap is close in vocabulary.
- `scratch/citations.md`: no cross-roadmap citation and no Lean name is found nowhere.
- `roadmaps grep --readme-only 'ClusterAlgebras'`: no match on main or in any open roadmap pull request, so "None." under Downstream consumers is still correct.
- Ownership by object, using `roadmaps grep -i` over main and the 454 open heads for "cluster algebra", "Laurent phenomenon", "cluster variable", "exchange matri", "double Bruhat", "generalized minor", "Somos", "sign-coheren" and "almost.positive root":
  - Outside this folder, the hits are ScatteringDiagrams' reference list and its scope line 28. That scope line leaves the theta/cluster comparison to the cluster side.
  - ToeplitzOperators line 695 uses "exchange matrix" for an unrelated linear-algebra object.
  - CrystallineLocalGlobalCompatibilityCM line 151 says "parabolic double Bruhat decomposition". That is ReductiveGroups Layer 7's double cosets, not the Fomin–Zelevinsky cells `BuB∩B₋vB₋` of §6.1.
  - There is no second owner.

**Lean signatures.** No statement changed. The worker's elaborated signatures at this head (`scratch/signatures.md`: 21 declarations, none with a lost section binder) are those the earlier reviews compared with the README. I did not re-elaborate a `#check` file because nothing changed. The one-tactic probe and the padding audit of the earlier reviews stand.

**Seeded sample.** None of the seeded targets is in a changed passage, because no passage changed, so I did not re-read the texts this round. Earlier reports read the locators at the sources and recorded the witness lines. For example:
- §2.7: FWZ Proposition 6.4.1 at line 431 and Remark 6.4.4 at line 495 (reports at dbaa5d0 and bb25a68).
- §§3.3 and 3.5: GHK (2.3), (2.5)–(2.8) at lines 545–593, and GHKK Remark B.8 at line 4644.
- §3.4: GHKK Appendix B, Proposition B.2(1), (1.23) and Proposition 2.4 (report at cce5d40).
- §5.1: GHKK Theorem 1.24 at line 1102, under the Injectivity Assumption.
- §6.1: FZ *Double Bruhat cells and total positivity*, Theorem 1.1 at line 168.
- §6.3: BFZ III Theorem 2.10 at line 668 and Lemmas 2.12–2.13 at lines 714 and 759.

**Remarks on untouched text (no change requested).**
- §6.1 cites the same paper two ways: "FZ, *Double Bruhat cells*" and "FZ, *Double Bruhat cells and total positivity*". Both resolve to the single References entry.
- Outside the folder, the pull-request description still says "The twisted algebra uses Tau Ceti's existing carrier" and that the ScatteringDiagrams supplier reference "is pinned in the README". The README instead consumes ScatteringDiagrams §4.3 `QuantumMonoidAlgebra` and links the roadmap on main without a commit pin.

**Adversarial table.** No statement changed. The rows below are carried forward from the reports at bb25a68 and cce5d40, with the values computed there. Rows marked † I recomputed this round.

| Statement | Instance | Left | Right | Result |
|---|---|---|---|---|
| `upperBound_seedMutationWord` | `B=0`, rank 2, `x=3,y=5` (`hrank` fails) | `2/(xy)=2/15` in `L(x,y)`, `L(x',y)`, `L(x,y')` | in `L(x',y')`: `x'y'/2` | not invariant without `hrank`: hypothesis needed (bb25a68) |
| same | `K` empty, `w=[]` | `laurentSubalgebra ℤ c.coordinate ⊓ ⊤` | same | equal (bb25a68) |
| `exists_laurentExpansion` | `B̃=(0,1)ᵀ`; `A₂` word `[1,2]` | `(1+z)/x`; `(1+x₁+x₂)/(x₁x₂)` | frozen exponents 0, 1; three monomials | exponents ≥ 0 (bb25a68) |
| `somos4_exists_pos_nat` † | `b₀..b₃=1`, recurrence `b_{n+4}b_n=b_{n+1}b_{n+3}+b_{n+2}²` | `1,1,1,1,2,3,7,23,59,314,1529,8209,83313,620297,7869898,126742987` | every quotient exact, all positive | holds for 16 terms; matches the 12-step `clusterMutation` run of bb25a68 |
| `upperBound_le_of_starfish` | `R=𝕜[x,y]`, `z=xy−1`, `x'=y` | no height-one prime contains `x` and `y` | `UB ⊆ 𝕜[x,y]` | holds (bb25a68) |
| same | `R=𝕜[x]`, `x'=x²` (`hcover` fails) | `(x)` contains both | `UB=𝕜[x^{±2}]∋x⁻²∉R` | hypothesis needed (bb25a68) |
| same | `K` empty; `R` a field | `UB` = image of `C`; no height-one primes | range `=⊤` | holds (bb25a68) |
| `finite_clusterVariables_iff` | `A₁×A₁, A₂, B₂, G₂, A₃` | 4, 5, 6, 8, 9 variables | `n+\|Φ₊\|`: 4, 5, 6, 8, 9 | agree (bb25a68) |
| same † | Kronecker `((0,2),(−2,0))` | variables grow by 2 per level (bb25a68) | companion `((2,−2),(−2,2))`, `d=(1,1)`, det 0: not PosDef | both sides false |
| same | `K` empty | `∅` finite | `IsFiniteType` of 0×0: `Finite`, PosDef vacuous | both true (bb25a68) |
| `exists_isFiniteType_iff_forall_le_three` † | `G₂`: `((0,1),(−3,0))` | `\|b₁₂b₂₁\|=3` | companion `((2,−1),(−3,2))`, `d=(3,1)`: `((6,−3),(−3,2))`, det 3 > 0 | agree |
| same † | `B₂`, `A₂`, Kronecker | `\|b₁₂b₂₁\|=2, 1, 4` | companion dets 2, 3, 0 (finite, finite, not) | agree |
| `exists_nonneg_laurentExpansion` | `A₂` `[1,2]`; principal rank one | coefficients 1,1,1; `x⁻¹+u x⁻¹` | ≥ 0 | holds (bb25a68) |
| `cVector_signCoherent` | 11,467 random mutation steps over `B₂, G₂`, Kronecker, `0`, 3-cycle, a rank-3 matrix with symmetrizer `(2,1,1)`, and `((0,3),(−3,0))` | columns of `C_t`; `G_tᵀD_sC_t` | sign-coherent; `D_s` | 0 failures (bb25a68) |
| §1.5 `w_ib_ij=−w_jb_ji` | `B=((0,1),(−2,0))`, `Λ₁₂=λ` | `w=(2λ,λ)`, `w₁b₁₂=2λ` | `−w₂b₂₁=2λ` | agree; `λ=−1` allowed (cce5d40) |
| §1.5 `w_i[−εb_ik]_+=w_k[εb_ki]_+` | same, `i=1,k=2` | `ε=+`: 0; `ε=−`: `2λ` | `ε=+`: 0; `ε=−`: `2λ` | agree (cce5d40) |
| §2.5 bar anti-automorphism | `X^aX^b=u^{Λ(a,b)}X^{a+b}`, `σ(u)=u⁻¹` | `bar(X^aX^b)=u^{−Λ(a,b)}X^{a+b}` | `X^bX^a=u^{Λ(b,a)}X^{a+b}` | equal (cce5d40) |
| §2.5 Check | `𝔽₇`, `u=2` | `(1+2T)(1+T)(1+4T)=1+7T+7T²+T³` | `1+T³` | agree (bb25a68) |
| §3.4 `T_k` versus GHKK (1.23) | `B=((0,1),(−2,0))`, `d=(1,2)`, `m=±f₁` | `p₁*(e₁)=−2f₂`; `T₁(f₁)=−f'₁`, `T₁(−f₁)=f'₁−2f'₂` | `m'=(−1,0)`, `(1,−2)` | agree (bb25a68, cce5d40) |
| §5.2 Check | `A₂`, `μ₁` then `μ₂` | `(1+(1+x₂)/x₁)/x₂` | `(1+x₁+x₂)/(x₁x₂)` | agree (bb25a68) |
| §6.1 dimension | `SL₂`, `G^{s,s}` | `1+1+1=3` | FZ Thm 1.1: `r+ℓ(u)+ℓ(v)=3` | agree (bb25a68) |
| §6.2 Check | `i=(−1,1)` in `SL₂` | `Δ(−1)=b, Δ(1)=d, Δ(2)=c` | `n=1`; `d·a=1+bc` | agree (bb25a68) |
| §6.3 Check | `SL₂`, `(s,s)` | complement of `D(a)∪D(d)`: `a=d=0`, `bc=−1`, dim 1 | cell dim 3 | codimension 2 (bb25a68) |
| §0.4, §0.5, §0.7, §1.6, §2.1 Q1, §2.3, §2.6, §3.4 `λ`, §3.5, §5 Examples, §5.3 Checks | unchanged | values in the report at bb25a68 | | carried forward |

## Not verifiable

- Berenstein–Zelevinsky, *Total positivity in Schubert varieties* (an untouched citation): paywalled. As in the earlier reports, it was checked only indirectly, through FZ's references.

## Source issues

- none
