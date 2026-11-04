# GATE-ProfiniteProPGroups~1: answers to the review comments

Commits `31eec9eb` and `46f8016f` on the pull-request branch, not pushed. Line numbers refer to `46f8016f`.
H01–H14 were already repaired at the reviewed head `672a208`. Each of those sections cites the line where the repair is.

## H01 (roed-math) — answered
The character-preserving iteration is assigned at the head, in README Layer 9, "The character-preserving iteration after the basis corrections" (lines 2178–2321). It covers the filtered kernel `X_k = X ∩ λ_k`, the restricted map `δ_j^X` (`basisModificationDelta_mem_gradedPieceOf_ker`), the span statements including the split mixed tail `π^{j-1}[ξ₂, ξ₄]`, the Lemma 4 detectors, the one-step correction (`exists_labuteIterationStep_*`) and the comparison-schema hypotheses (`exists_continuousMulEquiv_labuteIteration_*`).

## H02 (roed-math) — answered
The statement that `gr_j(F) = Im δ_j` for all `q ≠ 2` was already split into cases at the head (README lines 2356–2386). The case `q = p` with `p` odd keeps full span. The cases `q = 0` and `p² ∣ q` hold the exponent vector fixed, with error space `C_j(F)`. The `p = 3`, `r = (x₁, x₂)` counterexample appears there verbatim as a warning. The `NeTwo.lean` file is present at the current pin `a91d3aa`.

## H03 (roed-math) — answered
The degree-one formula includes `Σ_{i<k} a_{ik}[w̄_i, w̄_k]` and its polarization (README lines 1593–1603 and 1615–1623). The `p = 3`, `x_i ↦ x_i²` regression is the warning at line 1599.

## H04 (roed-math) — answered
README line 1259 now uses injectivity of the map on `H²` induced by the coefficient inclusion `×p : I(χ)/p^i → I(χ)/p^{i+1}`. It names `TauCeti.hasPrescriptionProperty_iff_forall_injective_explicitCoeff2_mulPow` and says explicitly that the condition is not injectivity of the reduction.

## H05 (roed-math) — answered
The preliminary nonalternating congruence is split by parity: `x₁²(x₂,x₃)⋯` for odd `n` and `x₁²(x₁,x₂)(x₃,x₄)⋯` for even `n` (README lines 2339–2347). The rank-two determinant witness (1 versus 0) is included.

## H06 (roed-math) — answered
README line 1000 reads `#S - #R ≤ d(G) - r(G)`. The witness `⟨x | x^p, x^{p²}⟩` gives `-1 < 0`.

## H07 (CBirkbeck) — answered
This is the same point as H01; the iteration interface is at README lines 2178–2321.

## H08 (CBirkbeck) — answered
This is the same point as H02. The roadmap is cited as it stands on this branch, and no other pull request is consumed. Reconciling two open revisions of this roadmap is a merge-time human decision and is outside the roadmap text.

## H09 (CBirkbeck) — answered
This is the same point as H01. The one-step correction takes as input the invariant that every continuous crossed homomorphism kills the error. It preserves `χ(z_i) = χ(x_i)`, the basis property and that invariant (README lines 2257–2270). The schema's nonemptiness and surjectivity hypotheses are then discharged (lines 2271–2296).

## H10 (CBirkbeck) — answered
This is the same point as H02 (README lines 2356–2386).

## H11 (kim-em) — answered
The targets this comment lists are all declared in `Suggested.lean`: `gradedPieceOf`, `basisModificationDelta_mem_gradedPieceOf_ker`, `pow_dvd_crossedHom_of_mem_pLowerCentralSeries`, `existsUnique_crossedHom_freeProP`, the two image theorems, the two iteration steps and the two limits. The build elaborates them.

## H12 (kim-em) — answered
The split residual is described at the head as `(z₁, z₃)^a e'` with arbitrary `a ∈ ℤ₂`. It becomes an element of `(X, X) ∩ λ₂` only after `z₂ ↦ z₂ z₃^{-a}`, which changes the Frattini class of `z₂` when `a` is odd.

## H13 (kim-em) — answered
The three-case approximation is at README lines 2356–2401. The warning that the even-rank tail is not the Layer 8 `T_j` (`π^jξ₂ = δ_j(π^{j-1}ξ₂, π^{j-1}ξ₂, 0, …)`, and at `n = 2`, `j = 2` the sum misses `π²ξ₁`) is at line 2390.

## H14 (kim-em) — answered
The roadmap text cites no other pull request. The reconciliation with the parallel closeout is a merge-order matter for the maintainers.

## H15 (CBirkbeck) — applied differently
The import `TauCetiRoadmap.ProfiniteCohomology.DimensionNormalization` is removed. That module exists only in an open revision of ProfiniteCohomology, and a revision of an existing roadmap is never a dependency. The proof of `cd_p_eq_two_of_isDemushkin` (Suggested.lean line 3179) went from `rw [← ProfiniteCohomology.nativeCohomologicalDimensionAt_eq_cd_p …]` to `sorry`. Its docstring and README Layers 6 and 7 (lines 1020–1034 and 1359–1369) now carry the universe step as part of this target's route. The step reduces both tests to finite `p`-primary modules using ProfiniteCohomology Layer 11 `cd_p_le_iff_finite_pPrimary`, which is on main. It then compares cohomology in all degrees along a continuous equivariant additive equivalence. No definitional universe equality and no second dimension invariant is introduced. The build now passes on the branch as submitted.

## H16 (CBirkbeck) — applied
The section "From the cup matrix to the relator" became "From the relator to the cup matrix, and back" (README line 1827). The cup matrix has entries `a_{ik}` off the diagonal and `binom(p, 2) c_i` on it, so the old `(q choose 2) a_i` is gone; the citation is NSW Prop. 3.9.13 read in the lower `p`-series. The matrix therefore determines `c` only at `p = 2`, and `r = x₁^p(x₁,x₂)` is added as the counterexample at odd `p`. Layer 9 "Cup-form normal forms" (line 2329) now invokes the exponent-vector normalization separately for the `x₁^q` factor.

## H17 (CBirkbeck) — applied
The formula `D((g,h)) = ±(…)` became the exact `χ(g)⁻¹χ(h)⁻¹((χ(g)-1)D(h) - (χ(h)-1)D(g))` for `(g,h) = g⁻¹h⁻¹gh` (README line 2234). The README adds the witness `D₄((x₂,x₄)) = 2(1 - 2^f)`, which is `-6` at `f = 2` (line 2247); half of it is odd, so the detector argument stands. The same correction is made in the `pow_dvd_crossedHom_of_mem_pLowerCentralSeries` and split image-theorem docstrings. The split docstring also gives `D₂((x₂,x₄))`, which is divisible by `2^f`; that value is `4` at `f = 2`, computed.

## H18 (CBirkbeck) — applied
README line 1538 now states the exact identities `[x², y] = [x,y]^x[x,y]` and `[x, y²] = [x,y][x,y]^y`. With them, `[x, y²] = [x,y]²[[x,y],y]` holds exactly, while `[x², y] = [x,y]²[[x,y],x]` holds only modulo `λ_{3j+2k+4}`. A check over all pairs in S₄ confirms the exact identities and finds 168 failures of the uncorrected `[x², y]` identity.

## H19 (CBirkbeck) — applied
The `p = 2`, `c_i ≠ 0` non-additivity clause now requires rank `n ≥ 2` (README line 1608). The rank-one case `r = x₁²` is recorded as a witness: there `δ₁ = π`, which is additive.

## H20 (CBirkbeck) — applied
"The two agree numerically for pro-`p` groups" became the explicit failure for `ℤ_p` (README line 526). What the Frattini quotient does give is now stated: the topological rank equals `dim Hom_cont(G, 𝔽_p)`, and equals `dim G/Φ(G)` when that quotient is finite.

## H21 (CBirkbeck) — applied
In the `profiniteIndex` docstring (Suggested.lean line 219), "which fails without it" became the correct statement. The supremum formula holds for every `H`, as the pinned `Subgroup.profiniteIndex_eq_iSup_openSubgroup` shows, because both sides are unchanged by passing to the closure (`Subgroup.profiniteIndex_topologicalClosure`).

## H22 (CBirkbeck) — applied
"The inverse limit `ℚ_p/ℤ_p`" became the direct limit along `×p`. The note now adds that the inverse limit along reductions is `ℤ_p` (README line 1431).

## H23 (CBirkbeck) — applied
For `ℤ_p²` the text now says that `X = F`, `Γ = 1` and `E = F^{ab}` with trivial action, so the two readings agree there. The separating example is now the full relation module `R^{ab}`: there `x⁻¹rx = r((x,y),x)`, and `((x,y),x)` is nontrivial modulo `γ₄(F) ⊇ (R,R)`. The unsupported phrase "regular action" is gone. The change is made in README line 2048 and in the corresponding Lean docstring.

## H24 (CBirkbeck) — applied
The local targets `completedGroupAlgebra.dyadicCoordinate_proj_eq_zero_iff` and `completedGroupAlgebra.exists_dyadicLevel_le` are deleted from `Suggested.lean`. The section docstring now cites `TauCeti.completedGroupAlgebra.proj_dyadicCoordinate_eq_zero_iff`, `ker_proj_comp_dyadicCoordinate` and `exists_dyadicLevel_le`, which exist at the pin in `CompletedGroupAlgebra/DyadicCoordinate.lean`. The README cites the same names (lines 1983 and 2009).

## Other changes made for the gate
Commit `31eec9eb`:
- `fpPairing` now has a real body, taken from Tau Ceti's own `fpPairing` (multiplication through `trivialFpEquiv`), so it is no longer sorry'd data.
- `set_option autoImplicit false` is removed.
- Four admitted `example`s are handled. Three sanity checks are deleted because they already stand as README prose: `q` invariance, `Group.rank (ℤ/4 × ℤ/2) = 2`, and `U^[f] ∩ U^(2) = U^(f+1)`. Pro-`p` Nielsen–Schreier is now the named theorem `nonempty_continuousMulEquiv_freeProP_of_openSubgroup`, cited at README line 1185.
- Multi-line code spans flagged as `tex` are split into single-line spans.
- The heading "Layer 9 prerequisites" is folded into `### Layer 9: …`; the classification is now `#### The classification`.
- Process narrative in the docstrings ("original PR snapshot at `a780`", "current main at …") is removed.

Commit `46f8016f`:
- **Import of another roadmap's module removed.** `import TauCetiRoadmap.ProfiniteCohomology.Suggested` is gone. Every carrier it supplied is now the Tau Ceti declaration that ProfiniteCohomology's own declaration is a reducible alias of:
  - `ProfiniteCohomology.TopRep (ZMod p) G` → Mathlib's `TopRep (ZMod p) G`;
  - `ProfiniteCohomology.cd_p p G` → `TauCeti.cohomologicalDimensionAt.{0} p G`, the same universe, so `cd_p_eq_two_of_isDemushkin` keeps its meaning;
  - `ProfiniteCohomology.ofDiscreteModule G M` → `TauCeti.ofDiscreteModule ℤ G M`;
  - `ProfiniteCohomology.IsPPrimaryTorsion` → `TauCeti.IsPPrimaryTorsion`;
  - `ProfiniteCohomology.res ℤ P X n` → `TauCeti.ContinuousCohomology.res P X n`.

  The five Tau Ceti modules that declare these are imported explicitly. Because these are the same declarations, the statements of the Layer 6 and 7 theorems are unchanged in content.
- **`cupFp` no longer rests on sorry'd data.** `cupFp` was `degreeCast … (ProfiniteCohomology.cup (fpPairing p G) 1 1 a b)`, and `ProfiniteCohomology.cup` is a `def … := sorry` there. So `IsDemushkin`, whose cup clauses use `cupFp`, mentioned sorry'd data. `cupFp` is now `TauCeti.cupFp p G a b`, which is `(TauCeti.fpPairing p G).cup 1 1` with a real body landing in degree 2. `fpPairing` is now the alias of `TauCeti.fpPairing`, so its body is no longer duplicated.
- **Theorem removed.** `cupFp_eq_tauCeti` (`cupFp p G a b = TauCeti.cupFp p G a b`) became a definitional identity, so it is deleted. It was not in the README, and the docstring of `IsDemushkin.iff_tauCeti` no longer refers to it.
- **README agrees with the Lean.** Layer 5 "The multiplication pairing and the cup square" (README lines 715–726) no longer says that `fpPairing` is a `ProfiniteCohomology.TopPairing` and that `cupFp` is `ProfiniteCohomology.cup … transported from degree 1 + 1`. It now names `TauCeti.fpPairing`, `TauCeti.cupFp`, `TauCeti.cupFp_def` and `TauCeti.cupFp_gradedComm`. It also says that ProfiniteCohomology Layer 12's general cup must restrict to this one. The *Needs:* line changed from `PC-12 TopPairing, …, degreeCast` to the TC names. The conventions paragraph (line 120) and the coefficient-object bullet (line 705) are changed to match.
- **Docstrings.** The Layer 6 docstrings now cite the pinned Tau Ceti inputs instead of the ProfiniteCohomology aliases: `TauCeti.cohomologicalDimensionAt_le_iff_forall_finite`, `…_boundedExponent`, `TauCeti.ContinuousCohomology.exists_openSubgroup_res_eq_zero`, `TauCeti.ContinuousCohomology.corestriction_res` and `TauCeti.isPPrimaryTorsion_continuousCohomology`. Step 2 of `res_injective_of_isProPSylow` now reads the natural-number multiple `U.index • x` that `corestriction_res` gives, cast to `ℤ` by `natCast_zsmul`.
- **`readme-ids-missing` (26 → 0).** All 26 names are Tau Ceti library declarations that the README cites in *In Tau Ceti:* and *Needs:* lines, and each exists at the pin under the name the README gives. Twenty-three are under `TauCeti.<namespace>`. `GroupExtension.contCohomologyClass_eq` is `_root_` in `GroupExtension/Cohomology.lean`. The bare names `demushkinCharacter_openSubgroup` (in `TauCeti.IsDemushkin`) and the two `gradedPieceOf_exponentSumKer_…_sup` (in `TauCeti.freeProP`) are covered by the README's own "all in the namespace" clause. The gate counted them as this roadmap's own names because their namespaces occur in `Suggested.lean`. Each is now cited in the docstring of the Lean statement whose route uses it:
  - Frattini: `proPFrattini`;
  - presentations and `H²` counts: `presentedProP`;
  - finite-quotient generation: `IsFiniteContinuousQuotient`;
  - prescription: `HasPrescriptionProperty`;
  - `δ` value and `gr_1` dimension: `basisModificationDelta_mem_gradedPieceOf_ker`;
  - the two span statements: the two image theorems;
  - odd span: `isDemushkin_marked_of_q_ne_two`;
  - `IsProPSylow.eq_of_le`: `IsProP.exists_le_isProPSylow`;
  - Burnside rank forms: `topologicallyGenerates_iff_frattiniQuotient`;
  - Schreier inputs: `topologicalGeneratorRankNat_le_of_isOpen`;
  - extension class: the lifting theorem;
  - the five duality maps: `IsDemushkin.tateAlpha2_bijective`;
  - the restricted character: `IsDemushkin.openSubgroup`.

  No declaration was added.
- **Linter warnings in proofs.** `letI` became `let _` in the proof of `IsDemushkin.tateAlpha2_bijective`. The redundant `letI : Infinite G := inferInstance` is deleted from `IsDemushkin.openSubgroup`, where `[Infinite G]` is already a binder.

Adversarial pass on the statements changed in `46f8016f` (scratch `adversarial.md`):

| statement | instance | computed | result |
|---|---|---|---|
| `cupFp` = `TauCeti.cupFp` | `G = ℤ/2`, `p = 2`; `G = ℤ/3`, `p = 3` | `ℤ/2`: `H¹ = 𝔽₂a`, `a ⌣ a ≠ 0` in `H² ≅ 𝔽₂`; `ℤ/3`: `a ⌣ a = −a ⌣ a`, so `a ⌣ a = 0` (`2` invertible), while `H²` is spanned by the Bockstein | consistent with `cupFp_gradedComm` in both characteristics |
| `cd_p_eq_two_of_isDemushkin` on `cohomologicalDimensionAt.{0}` | `G = ℤ/2`, `p = 2` without `Infinite G`; `G = ℤ_p²`, `p` odd | `ℤ/2`: `dim H¹ = dim H² = 1` and the cup is nondegenerate, so the five clauses hold, but `cd₂ = ∞ ≠ 2`; `ℤ_p²`: `dim H¹ = 2`, `dim H² = 1`, cup perfect, `cd_p = 2` | `hinf : Infinite G` is necessary and present; unchanged |
| `cd_p_freeProP_le_one` | `n = 0` (trivial group); `n = 1` (`ℤ_p`) | `cd_p = 0 ≤ 1`; `cd_p = 1 ≤ 1` | holds |
| `res_injective_of_isProPSylow` with `TauCeti.ContinuousCohomology.res` | `G = S₃`, `p = 3`, `M = 𝔽₃` trivial, `P = A₃`; negative control `P = ⟨(12)⟩` | `H¹(S₃,𝔽₃) = 0`; `H²(S₃,𝔽₃) = H²(A₃,𝔽₃)^{S₃/A₃} = 0` (the transposition acts by `−1`), so restriction is injective; control: `H⁴(S₃,𝔽₃) ≅ 𝔽₃` (action `+1`) restricts to `H⁴(ℤ/2,𝔽₃) = 0` | Sylow hypothesis necessary and present |

The `#check @name` scratch elaboration was not run, because the brief permits only the two given Lean commands. The signatures changed in `46f8016f` were checked through the build instead. Every replaced carrier is the declaration that the ProfiniteCohomology alias unfolds to, and the binders of each changed declaration are unchanged.

Ownership: no new construction was added; the changes replace roadmap aliases by the Tau Ceti declarations they alias. The universe comparison in `cd_p_eq_two_of_isDemushkin` remains a proof step of this roadmap's own target. ProfiniteCohomology on main does not state it, and the open revision that proposes it is not a permissible supplier. No sources were fetched and no `needs-references.toml` was written. The only new citation from `31eec9eb` is NSW Prop. 3.9.13, which the README already uses as a reference work.

## Build and gate
- `lake build TauCetiRoadmap.ProfiniteProPGroups.Suggested` at `46f8016f`: **Build completed successfully (9400 jobs)**, exit 0. The only warnings are `declaration uses 'sorry'` in this file. The 41 warnings of the previous build came from compiling `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` (unused section variables) and from the three `letI` lines; they are gone.
- Depcheck (`--movable`): `depcheck: 148 roadmaps, 999 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
- Gate: `gate ProfiniteProPGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
