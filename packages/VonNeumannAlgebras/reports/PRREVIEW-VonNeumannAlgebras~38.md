# Review of VonNeumannAlgebras (pull request #1041 at 8b1713a)

**Verdict:** needs changes

This is an incremental re-review: 37 lines of `README.md` have changed since `7d10de2`, and `Suggested.lean` is unchanged.

- R02, R03 and R04 are repaired, and the repairs introduce no new problem.
- R01 is not repaired, since the pins and the add/add conflicts with main are unchanged. It is carried below.
- There is no P1 or P2.
- The gate, the dependency check and the elaboration pass.

## R01 (P3) — The branch is still at the old pins and conflicts with the roadmap on main

**Location:**
- `TauCetiRoadmap/VonNeumannAlgebras/README.md:231–326`, the "From Tau Ceti" contract, ending "Each is used as stated at the pin."
- `README.md:122`, `:300`, `:2962` and `:2984`, which cite `LinearMap.existsUnique_trace_mul_eq`.
- `lake-manifest.json`, unchanged by this head.

**Claim:** The contract holds only at main's Tau Ceti pin, not at this branch's pin. Main also already carries this roadmap folder, so the branch cannot merge as it stands.

**Witness:**
- `lake-manifest.json` pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`. Main pins `2fd255d9` and `1b1ccf4b`.
- The README names 25 Tau Ceti files (24 by path, plus the Stone module by name). Of these, 16 are absent at `a91d3aaf`, among them `TauCeti/LinearAlgebra/Matrix/Trace/Duality.lean`, `Analysis/CStarAlgebra/GNS.lean` and `Analysis/Semigroups/Group/Stone/Unbounded.lean`. All 25 exist at `2fd255d9`.
- `git merge-tree --write-tree origin/main HEAD` reports two add/add conflicts: `README.md` and `Suggested.lean`.

**Repair:**
1. Rebase onto main, or merge main.
2. Resolve both add/add conflicts in favour of this head's `README.md` and `Suggested.lean`.
3. Keep main's `PROGRESS.md`, `STATUS.md`, `metadata.toml` and `lake-manifest.json`.
4. Re-run the gate and `lake env lean` at main's pins.

At `2fd255d9` every cited Tau Ceti declaration was found in its stated file in the previous round, and those files are unchanged.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aaf`. `README.md:231` "From Tau Ceti" still cites `TauCeti.Analysis.Semigroups.Group.Stone.Unbounded` and 15 other files absent there, and `git merge-tree` still reports the add/add conflicts in `README.md` and `Suggested.lean`.
- R02 — repaired: `README.md:4349–4354` now reads "(Hiai, Theorem 6.5, pp. 55–56, whose conclusions are items (ii) bimodularity and (v) complete positivity of Theorem 6.4; … Tomiyama … is cited only for positivity and bimodularity in the unital ambient case". `:4997–4998` reads "for positivity and bimodularity of a norm-one projection (13.1)".
- R03 — repaired: `:1549` "V11 and FactorRigidity, Layer 6 (§6.2), consume this selection layer"; `:3849` "FactorRigidity, Layer 6 (§6.2), specializes this API to p.m.p. relations"; `:3861` "FactorRigidity, Layer 7 (§7.1), consumes this relation API".
- R04 — repaired: `:3350` "The weight `φ(x)=Σ_n (n+1)·x_n` on `ℓ∞(ℕ)` is normal, faithful and semifinite: `φ(δ_n)=n+1>0` …; the weight `Σ_n n·x_n` is not faithful, since it vanishes on the nonzero positive `δ₀`."

## Verified sound

**Gate, dependency check, scope.**
- I ran `tauceti-roadmap gate … VonNeumannAlgebras --base origin/main` on this head. Every check printed 0, then `OK`, exit 0. This matches the worker's gate file.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty, so there are no changes outside the folder.
- Dependency check, exit 0, with no UPWARD, CYCLE or `moved:` line. VonNeumannAlgebras is line 5 of the merge order, and FactorRigidity, a consumer, is line 232.

```text
depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
```

- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name is found nowhere.
- `roadmaps list` shows no open pull request that changes FactorRigidity or VonNeumannAlgebras other than this one.

**Lean (at the branch pins).**
- `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` exits 0 in 52 s. It prints exactly 24 `declaration uses 'sorry'` warnings and nothing else.
- `Suggested.lean` is byte-identical to `7d10de2` (`git diff 7d10de2d HEAD` touches only `README.md`).
- The previous round's `#check @name` binder pass and one-tactic padding probe therefore stand unchanged: 41 declarations, no lost binder, all 24 `sorry` sites resist `rfl | simp | infer_instance | trivial | decide`.
- The `tomiyama` docstring (`Suggested.lean:460–463`) cites only Hiai, Theorem 6.5, which agrees with the narrowed README attribution.

**Changed passages: sources read at their locators** (seeded target 13.1). Target 13.2 is unchanged and was verified last round.
- hiai-lectures:
  - line 2596, printed p. 53: Theorem 6.4 (ii) is bimodularity `E(y₁xy₂)=y₁E(x)y₂`.
  - line 2602, p. 54: (v) is complete positivity.
  - line 2666, p. 55: Theorem 6.5 says a norm-one projection of a C*-algebra onto a C*-subalgebra satisfies (ii) and (v), with the proof ending at line 2695, p. 56.
  - The page markers equal printed pages.
- peterson-notes:
  - line 3944, p. 98: a conditional expectation is unital, CP and fixes B.
  - line 3948: Theorem 6.2.1 covers unital A, unital C*-subalgebra B, `E|B=id`, `‖E‖≤1`.
  - line 3971: CP is proved there.
  - This matches "for the unital inclusion case, complete positivity included".
- anantharaman-popa:
  - lines 13597–13608, PDF page 320, printed p. 314: §A.4 defines a conditional expectation as a positive B-bimodular projection.
  - It attributes "every norm-one projection is a conditional expectation" to [Tom57].
  - Its Theorem A.4, which adds the CP equivalence, is referred to Brown–Ozawa, not to Tomiyama.
  - This matches the README's "conditional-expectation properties that Anantharaman–Popa, Appendix A.4, p. 314, attribute to it".
- Tomiyama 1957: read in the publisher's open copy on J-STAGE (Proc. Japan Acad. 33 no. 10), fetched without a manifest. The cached copy is an access-denied page (see Not verifiable).
  - Theorem 1, lines 19–22, p. 608, assumes a C*-algebra with unit and a C*-subalgebra.
  - Its conclusions are order preservation, bimodularity and the Schwarz inequality, with the proof continuing on p. 609.
  - "pp. 608–609 … positivity and bimodularity in the unital ambient case" is accurate.

**Changed passages: cross-roadmap citations resolved (FactorRigidity on main, `3090489`).**
- `## Layer 6: Cartan pairs and measured orbit relations` is at line 573.
  - `### 6.2 Measured relations and their algebras` is at line 594.
  - Line 596 there opens with "Specialize VonNeumannAlgebras §V11's nonsingular measured relations … to countable p.m.p. …". This matches README `:3849`.
  - Line 606 consumes "VonNeumannAlgebras §V4's Lusin–Novikov selection". README `:1549` lies in Layer 4 (heading at `:1135`), so this matches too.
  - Line 624 is `*Needs:* §6.1; VonNeumannAlgebras §§V4, V8, V11`.
- `### 7.1 Cost` is at line 636.
  - Line 650 uses §V11's hyperfinite exhaustions.
  - Line 669 is `*Needs:* Layer 6.2; VonNeumannAlgebras §V11 (hyperfinite relations)`. This matches README `:3861`.
- No "R6" or "R7" remains in the README (`grep '\bR[67]\b'`: no hit).

**Adversarial table.** The rows marked "new" are computed this round for the changed statements. The rows marked "r37" carry the previous report's computed values for statements this diff leaves untouched.

| Statement | Instances | Values computed | Result | Row |
| --- | --- | --- | --- | --- |
| Layer 11 Check, weight `Σ(n+1)x_n` on `ℓ∞(ℕ)` (`:3350`) | `δ_n`; `1_{0..N}`, N=0,1,2; x=1 | `φ(δ₀)=1`, `φ(δ_n)=n+1>0`; `Σ_(n≤N)(n+1)=(N+1)(N+2)/2` gives 1, 3, 6 (direct sums 1, 1+2, 1+2+3); `φ(1)=Σ(n+1)=∞`; φ is a sum of the normal positive functionals `(n+1)·ev_n`, so it is normal; finitely supported positive elements have finite φ and `1_{0..N}↑1` | faithful, normal, semifinite, unbounded: all hold | new |
| Same Check, weight `Σ n·x_n` | `δ₀`; `δ₁` | `φ(δ₀)=0·1=0` with `δ₀≥0`, `δ₀≠0`; `φ(δ₁)=1` | not faithful, as stated | new |
| Same Check, the ∞ weight | `x_i↑x`, x=0 and x≠0 | x=0 forces all `x_i=0`, so sup 0 equals φ(0)=0; x≠0 gives some `x_i≠0`, so sup ∞ equals ∞; the set where φ is finite is `{0}` | normal, faithful, not semifinite | new (unchanged text) |
| Layer 12 Check, `τ(e_n)=1/(n+1)` (`:4031`) | n=0, 1, 9; `M=R`; `M=M₂(ℂ)` | n=0: `τ(e₀)=1`, so `e₀=1` by faithfulness and `‖e₀‖₂²=1`; n=1: 1/2; n=9: 1/10 → 0; `‖e_n‖=1` since `e_n≠0`; such projections exist in the diffuse R (the paragraph's II₁ case), not in `M₂` (traces 0, 1/2, 1 only); the old `1/n` was 1/0 at n=0 | holds; the ℕ-from-0 index no longer divides by 0 | new |
| 13.1 Tomiyama attribution (`:4349–4354`) | Tomiyama Thm 1; Hiai 6.4/6.5; Peterson 6.2.1; AP A.4 | conclusions, in order: Tomiyama gives order, bimodule, Schwarz (no CP); Hiai gives (ii) and (v); Peterson gives unital CP; AP gives positive bimodular projection | every clause is supported at its locator | new |
| FactorRigidity labels (`:1549`, `:3849`, `:3861`) | FactorRigidity on main | §6.2 at 594 (V4 at 606, V11 at 596); §7.1 at 636 (V11 at 669) | every label resolves | new |
| `tomiyama` (13.1) | `E(x)=x₁₁e₁₁+x₂₂e₂₂` on M₂; `P(x)=e₁₁xe₁₁`; transpose; A=0 | `a=diag(2,3)`, `b=diag(5,7)`, `x=[[1,2],[3,4]]`: `E(axb)=diag(10,84)=aE(x)b`; `‖P‖=1` with `P(1)=e₁₁≠1`; transpose sends e₁₂ to e₂₁, so it fails fixing; A=0 has `‖P‖=0` | holds | r37 |
| Arveson Checks (13.1) | transpose on M₂; state `(a+b)/2` | flip has eigenvalue −1; `ρ=[[1/2,c],[c̄,1/2]]` has `det=1/4−|c|²≥0` iff `|c|≤1/2` | not CP; extensions not unique | r37 |
| `IsInjective` | `B(H)`; `ℓ∞⊂B(ℓ²)`; H=0 | identity has norm 1; the diagonal expectation is normal; on H=0, `P=0` with `‖P‖=0≤1` | matches AP 10.2.2(iii) | r37 |
| V13b.SpatialNorm Checks | `u=e₁₂⊗e₁₂+e₂₁⊗e₂₁`; `1⊗1`; `(0,ℂ,id)` | `‖u‖=1` vs sum 2; `‖1⊗1‖=1` vs HS 2; slice norm 0 vs `‖ψ‖=1` | hold | r37 |
| `IsHyperfinite` (13.2) | R; `B(ℓ²)`; H=0; `L(ℤ)` | `M_(2ⁿ)`; `P_nxP_n+λ(1−P_n)` nested; ⊥ algebra gives `B(0)`; `ℓ∞(2ⁿ)` | AP 11.2.2(3) form | r37 |
| Følner forms (13.2) | `ℂ²`, `τ(a,b)=(a+2b)/3`, `u=(1,−1)` | rank-one P: `‖[u,P]‖²=8|α|²|β|²`; P=1 gives 1/2 against τ(x)=1/3; operator form `T=diag(3^(−1/2),(2/3)^(1/2))` gives `Tr(xT²)=a/3+2b/3` | projection form needs the trace clause | r37 |
| `L(F₂)` has no hypertrace | `F₂=W(a)⊔aW(a⁻¹)` | `m(W(a))+m(W(a⁻¹))=1=m(W(b))+m(W(b⁻¹))`, total 2>1 | holds | r37 |
| Semidiscreteness Checks | `ℓ∞(ℕ)` truncations; dyadic `E_n` on `1_[0,1/3]` | norm error 1 for every N; `‖E_nf−f‖_∞≥1/3`, `‖E_nf−f‖₁≤2^(−n)` | point-ultraweak, not norm | r37 |
| `isInjective_iff_isHyperfinite` | `B(ℓ²)`; H=0; `L∞[0,1]`; `L(F₂)` | yes/yes; yes/yes; yes/yes; no/no | both sides agree | r37 |
| II₁ and II∞ uniqueness | `M_n`; R; `B(ℓ²)`; `R⊗̄B(ℓ²)` | minimal projections exclude `M_n` and `B(ℓ²)`; R is finite and diffuse; `1⊗e₀₀` is finite in the infinite algebra | hypotheses select the intended factors | r37 |
| CFW Checks | finite classes; full relation on n atoms | `P(f)(x)=|[x]|⁻¹Σf(x,y)`; regular algebra `M_n` | hold | r37 |
| Bicentralizer Checks | M₂, `h=diag(2/3,1/3)` | `(e₁₂φ)(e₂₁)=1/3`, `(φe₁₂)(e₂₁)=2/3`; `B(M,φ)=D` | hold | r37 |
| `exists_faithful_nondegenerate_representation` | A=0; A=ℂ | K=0; `π(z)=z` | holds | r37 |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=0 | `π(z)=z·1`; A=0 is degenerate on ℓ²≠0 | holds with `[Nontrivial A]` | r37 |
| `double_commutant_iff_isClosed_image_ofCLM` | `{e₁₂}` on ℂ²; `ℂI` | `{e₁₂}''` has dim 2; the star-closed version gives M₂; `(ℂI)''=ℂI` | holds | r37 |
| `closure_unitBall_eq_unitBall_double_centralizer` | finite-rank + scalars on ℓ² | `qP_n→q` strongly; `‖q−(c+F)‖≥1/2` | SOT, not norm | r37 |
| `closure_isStarProjection_eq_positive_contractions` | H=ℂ; block dilation | `{0,1}` misses 1/2; the (1,1) entry is `C²+C(1−C)=C` | infinite dimension needed | r37 |
| `exists_predual`, Sakai | M₂; ℂ | `StrongDual ℂ X ≃ₗᵢ⋆[ℂ] M` | holds | r37 |
| `isNormalFunctional_iff_exists_tsum_inner` | `w_n=2^(−n−1)`; ultrafilter limit | `1−2^(−N−1)↑1`; the ultrafilter limit is 0 on every `1_{0..N}` and 1 at 1 | both directions | r37 |
| `isCyclic_iff_isSeparating_commutant` | M₂ on ℂ²; diagonal; H=0 | `e₁₂e₁=0`; (1,1) is both, (1,0) is neither; 0 in the zero space is both | holds | r37 |
| `equivalent_of_subequivalent` | M₂, `v=e₁₁`; shift | `e₁₁≼1`, `e₁₁≁1`; `S*S=1`, `SS*=1−e₀e₀*` | equivalence, not equality | r37 |
| `tracialState_unique` | `x↦x₁₁`; `ℂ⊕ℂ` | 1 vs 0 on `e₁₂e₂₁`, `e₂₁e₁₂`; `t·pr₁+(1−t)·pr₂` | factor hypothesis needed | r37 |
| `exists_faithful_tracialState`, `isSimpleRing_of_isTypeIIOne` | ideal I∋x≠0 | `af_ε(a)=1_[ε,∞)(a)≠0` with ε=‖a‖/2 | I=M | r37 |
| `exists_isNormalSemifiniteTrace_of_isFactor` | `B(ℓ²)`; zero trace; the ∞ map | `Tr(p)=rank p`; c=0; the ∞ map is not semifinite | holds | r37 |
| `exists_conj_commutant_eq_of_isCyclic` | M₂ on ℂ²; H=0 | pure vector states are not tracial; `‖xyΩ‖²≤‖y‖²‖xΩ‖²`; J=0 | holds | r37 |
| `existsUnique_typeDecomposition` | `M₂⊕R` | `(1⊕0,0⊕1,0,0)`; cross products `z_i z′_j` vanish | unique | r37 |
| `ergodicSMul_dense_subgroup` | ℤ⊂ℝ; ℚ⊂ℝ | `1_(⋃[n,n+1/2))` is invariant and nonconstant; σ-compactness from `G=⋃γK` | density needed | r37 |
| `existsUnique_isKMS_flow` | M₂, `h=diag(2/3,1/3)` | `F(t)=(2/3)2^(it)`, `F(t+i)=(1/3)2^(it)`; r=3 gives `(2/9)3^(it)≠(1/3)3^(it)` | exists and unique | r37 |
| `HasTypeITwoSummand`, Gleason extension | M₂, M₃, M₄; `Tr(diag(1,−1,0)·)` | `2·rank e=3` is impossible; `eMe≅M₂`; C=1, norm 2≤4 | I₂ exclusion needed | r37 |
| `dye` | transpose on M₃; Bloch map | `(e₁₂e₂₁)ᵀ=e₁₁` vs `e₂₁e₁₂=e₂₂`; inner product of images −3/5 | Jordan, not *-isomorphism | r37 |
| V0–V2, V8, V10–V12 Checks (unchanged ones) | as listed in r37 | values as in r37 (e.g. `|2cosθ+i|≤√5<3`; `Se_g=√(L/R)e_(g⁻¹)`; `(1/4)(1+|λ|²)+(3/4)|z|²≥1/4`) | hold | r37 |

**Remarks on untouched text:** none. The other `1/n` formulas in the README (`:550`, `:816`, `:982`, `:1229`) index over positive integers or n≥1 and need no change.

## Not verifiable

- **tomiyama-1957, cached copy:** the cached entry is still an access-denied (Incapsula) page, not the paper. I read the publisher's open copy on J-STAGE instead, fetched without a manifest; the board manifest is untouched. The manifest entry should be refetched from that URL.
- **wassermann-1988:** an image-only scan, and there is no OCR on this worker. It is not in the changed passages.
- **Uncertified, settled:** Arveson 1969, Haagerup 1985, Haagerup 1987, Connes–Størmer 1978.
- **Outside the changed passages:** the books listed in the previous report (Takesaki I–III, Sakai, Runde and others) were not reread.

## Source issues

- **Misprint** in anantharaman-popa at Appendix A.4, printed p. 314: the source spells the author of [Tom57] "Tomyiama" in the sentence crediting him; it should be "Tomiyama"; affects nothing.
