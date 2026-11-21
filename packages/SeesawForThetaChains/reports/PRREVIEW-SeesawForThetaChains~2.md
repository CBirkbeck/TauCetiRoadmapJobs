# Review of SeesawForThetaChains (pull request #2913 at 035d1d2)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SeesawForThetaChains/`
**Verdict:** needs changes

**Summary.** Changes are needed for two findings. First, the remark that closes 6.4 gives the Bessel line vector at the level prime the norm `−T(u_*)` of the base word. The suppliers, and 6.6 itself, use the word's own vector `z_{m,u}` of norm `−T(u)`, so the sentence is false for every other word and leaves unclear which Bessel character the chain uses. Second, no target has a locator into a source: the NEW targets cite the formal proof as a whole, and the KNOWN ones cite authors without a work or a theorem. There are seven small corrections and one format note, none blocking. The human reviewers are asked about the scope and licence of the formal proof, which is the only source of the NEW targets.

## R01 (P2) — At the places above `T(u)` the Bessel vector of the word `u` has norm `−T(u)`, not `−T(u_*)`, so the remark closing 6.4 is false for every word but the base word

This remark is the only place in the README that fixes the norm of the vector carrying the Bessel character at the level prime. Read as written, the vector is the base word's `z_m`. That vector is a unit vector at the places above `T(u)` and glues at `T(u_*)` instead. So 6.4 (d)–(e) would hold at `T(u)`, the glued laws of 6.6 would be needed at the wrong prime, and the bottom Bessel character would not be the character `ψ_u` of the Poincaré series `P_u` used in 6.13.

Line 176 reads "(there `⟨ζ, ζ⟩ = −T(u_*)` has valuation 1 and the lattice of `V₀` is glued)", and it concerns the places above `T(u)`. ThetaChainsOnDefiniteUnitaryGroups §2.8 sets `⟨z_m, z_m⟩ = −T(u_*)` and `z_{m,u} := (π_u/π_{u_*})z_m`, of norm `−T(u)`. Its §2.9b glues along `z_{m,u}`, whose norm has valuation 1 at `v | T(u)`. RowTowerAndRallisIdentities §5.3 takes `z_u := z_{m,u}` as the vector of the word, and BesselPoincareSeriesAndGramBounds §5.14 builds `ψ_u` from it. In this README, 6.6 uses `z_{m,u}` (line 200), while 6.2 names only the line `⟨z_m⟩` (line 144). At `v | T(u)` with `T(u) ≠ T(u_*)`, which are two different rational primes, `v(−T(u_*)) = 0`.

The smallest change has two parts. In 6.4, write `⟨ζ, ζ⟩ = −T(u)` with `ζ = z_{m,u}`. In 6.2, say that for the word `u` the vector of the Bessel datum is `ζ = ζ′ = z_{m,u}` (ThetaChainsOnDefiniteUnitaryGroups §2.8); the line is still `⟨z_m⟩`. 6.3 and its example may keep `z` and `z_m`: the codimension-one Bessel period there depends only on the line.

## R02 (P2) — No target has a locator: the ten NEW targets cite the formal proof as a whole, and the nine KNOWN ones cite authors without a work or a theorem

Without a locator, neither an implementer nor a referee can check any statement, its hypotheses or its normalisations against a source. Every target of this roadmap is in that position.

The Markers paragraph (line 33) makes [FormalProof] the source of every NEW target: 6.1, 6.2, 6.5, 6.6, 6.7, 6.8, 6.11, 6.12, 6.14 and 6.15. The References (lines 415–416) give only the repository and the announcement, with no module or declaration. The KNOWN targets are 6.2a–6.2d, 6.3, 6.4, 6.9, 6.10 and 6.13. They cite "Furusawa; Gan–Ichino; Xue; Atobe", "Casselman; Wallach" and "Godement" with no title. They cite Kudla (1984), Gross (1999) and Harish-Chandra (1966) by title but with no theorem, section or page (lines 417–420).

The formal proof has about 175,000 modules, but they are named by content. For example, `Development.AbelianVarietyTheory.Proofs.DecoratedLatticeProofs` contains `BesselPeriodThetaLiftUnfolding`, `BesselLevelStepFourierJacobiPeriodLink` and `BesselDoubleStepUnfoldingOfUnfoldingsAndLink`. So module- or declaration-level locators can be given.

The smallest change: after each NEW target, name the module or declaration of [FormalProof] that states it. For each KNOWN target, give the work (authors, title, year) and the theorem, proposition or section used. For example, 6.2b–6.2d need the Gan–Ichino and Xue papers with the unfolding proposition each one proves.

## C01 — The Conventions state the seesaw factorisation with `ζ(u, ξ)` and cite 6.14, but 6.14 proves it for `ζ_ℂ(u, ξ)`

Line 31 states `P̃_ξ(φ, Υ) = ζ(u, ξ)·B_u(φ)(ι_ξΥ)` "with a root of unity `ζ(u, ξ)` (6.14)". But `ζ(u, ξ) ∈ 𝕃` is the ratio defined in 6.1, and 6.14 (c) proves the identity for `ζ_ℂ(u, ξ) ∈ ℂ`. The two agree, through `σ₀`, only under the rational-structure hypotheses of 6.15 (b). Under 6.14 alone, if `ζ_ℂ(u, ξ) ∉ σ₀(𝕃)` then 6.1 sets `ζ(u, ξ) := 1`. Would write `ζ_ℂ(u, ξ)` there, or cite 6.15 (b) with its hypotheses.

## C02 — The hypothesis of 6.14 names TaylorBoundsAndDepthsOnHeightTwoFormalGroups and LocalGainOfThetaChains, but neither appears in the supplier contracts, the Dependencies or the *Needs:* line

Line 306 assumes "the data of Layers 2–5 of the chain" and names five roadmaps. The two Layer 4 roadmaps are absent from the supplier contracts, from the Dependencies (line 331), from the *Needs:* line of 6.14 and from the dependency list of the description. Nothing in the route of 6.14 uses them. Would name what 6.14 takes from them, or cite only ThetaChainsOnDefiniteUnitaryGroups, RowTowerAndRallisIdentities and BesselPoincareSeriesAndGramBounds for the data it actually assumes.

## C03 — `z_u` names two different objects

In 6.5 (line 188) and in the supplier contract of ThetaChainsOnDefiniteUnitaryGroups (line 393), `z_u = π_ue_{N_m}` is a vector of `X_m`. In the route of 6.14 (d) (line 310), `z_u` is "the central finite adelic element … of 6.13(c)", where 6.13 (c) calls that element `z`, and `U_u` is built from `R(z_u)`. Would give the central element its own name, for example `c_u`.

## C04 — AutomorphicFormsOnReductiveGroups §4.2 is cited for heights and moderate growth, which it does not state

The *Needs:* line of 6.2a (line 100) and the supplier contract (line 357) cite §4.2 for "heights, moderate growth". At main, §4.2 is "Cuspidal globalization and actual discrete occurrences". Moderate growth is that roadmap's §0.4, and its height is the one its Conventions take from AdelicAlgebraicGroups §3.5. Citing §4.2 for the rapid decay of cusp forms is consistent with MetaplecticAutomorphicForms §5.6. Would cite §0.4, and AdelicAlgebraicGroups §3.5 for the height.

## C05 — In the route of 6.4 (d), the lattice that contains the line lattice is `𝔤L₀`, not `𝔤⁻¹L₀`

The hypothesis of (d) puts `𝒪ζ` inside `𝔤L_{V₀}`, and the conclusion `𝔤 ∈ U(V_A)(F_v)·Stab(L_{V₀})` follows from `𝔤L₀ = 𝒪ζ ⊥ a·L_{V_A} = a·L₀`. The route (line 178) decomposes `𝔤⁻¹L₀`, which gives `𝔤 ∈ Stab(L₀)·U(V_A)(F_v)`, the other order, and does not give "`a⁻¹𝔤` stabilises `L₀`". Would replace `𝔤⁻¹L₀` by `𝔤L₀`.

## C06 — The family index says this roadmap treats "the relation of their norms" of Bessel and Fourier–Jacobi periods, which it does not

`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` lines 164–166 list "the relation of their norms" among this roadmap's contents. No statement of the README compares norms of Bessel and Fourier–Jacobi periods; the only norm in the layer is `‖P_uφ₁‖²` in 6.14. Would drop the clause, in every copy of the index.

## C07 — The description says every family pull request carries the family index "with identical content"; at their heads the copies differ

The index README at this head has 194 lines. At the head of #2918 (ThetaChainsOnDefiniteUnitaryGroups) it has 191 lines and a different second paragraph, and the copies at #2882 and #2877 have 188 lines. So the heads conflict on that file, and whichever merges second must be rebased. Would say the index is to be brought to one text before the first merge, or state which pull request's copy is authoritative. The same paragraph says the build succeeds "with `sorry` as the only warning". `Suggested.lean` has no declaration, and its elaboration gives no message at all.

## N01 — The Examples repeat three Checks (6.6, 6.5, 6.12) almost word for word

Lines 324–326 repeat the Checks at lines 206, 194 and 290; a cross-reference would do.

## Questions for the author

- In 6.2c (line 112), `τ : L′ → L` with `τζ′ = −ζ` is called "an anti-isometry up to the scalar". In the chain instance of 6.2, `ζ′ = ζ = z_m` and `τ = −1` is an isometry. Which scalar is meant? And is the sign of the line form meant to flip between `L` and `L′`, as it does between `L` and `L″` in 6.3? I could not decide this because the convention identifying the Weil representations of `(U(L), U(W₀))` and `(U(W₀), U(L′))` is not written out.
- In 6.5 (line 188), `c(j) = m − 1 − j` is called "the number of added coordinates of the larger space of the step". By ThetaChainsOnDefiniteUnitaryGroups §2.2 (b), `m − 1 − j` is the rank of the complement of `X_j` in `Y_j`. But `Y_j` is the smaller space of the step `(Y_j, Y_{j+1})`, since `n_{j+1} = n_j + t`. Which space is meant? Without the source of the local laws I could not check the positions `p ≤ c + 1`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 6.2a unfolding (headline 1) | `ρ = 1`; `q₀ = 0` and `q₀ ≠ 0` | Gram ≠ Gram(`x₀`) killed by (T1); dependent `x`: `Gram(x₀)a = 0`, killed by `c_a ≠ 1`; orbit stabiliser `hx₀u = x₀` ⇒ `h ∈ R_{x₀}` | holds | none |
| 6.2b | isotropic frame `x₀`, `q₀ = 0` | `R_{x₀}`: Levi `GL₁` part forced to 1, `U(W₀)` free ⇒ `R_J`; `ψ_B` sees only `u`, `b` entries, trivial on `N_C` | holds | none |
| 6.2c | chain instance `ζ′ = ζ = z_m` | `τ = −1`: `⟨τζ′, τζ′⟩ = ⟨ζ, ζ⟩`, an isometry; "anti-isometry up to scalar" true only with scalar `−1` | unclear | question |
| 6.2d | `x′₀ = (e′₁, …, e′_ρ, ζ′)` | Gram `= ⟨ζ′, ζ′⟩E_{ρ+1,ρ+1} ≠ 0`; stabiliser up to unitriangular `= U(V_{A′}) ⋉ N′ = R_{B′}` | holds | none |
| 6.2 ranks | `j` even, `j ≤ m − 4` | `h_j = (m−2−j)/2 = ρ+1 = h_{j+1}`, `h_{j+2} = ρ`; `rank Y_j = N_j + 1 + 2h_j = n_j` | holds | none |
| 6.1 | `Υ ∈ ℋ^{rt}_1` | `Υ − proj_{Q₁}Υ ∈ ker ι₁` ⇒ `sec(ι₁Υ) = proj_{Q₁}Υ`; `sec` onto `Q₁` ⇒ `B_u = 0` iff `P̃₁(φ,·)` vanishes on `Q₁` | holds | none |
| 6.3 | `V_A = X_{m−2}`, `V_T = X^h` | `rank Y_{m−2} = k+m−1+(m−2)t = N_{m−2}+1`; `rank X^h = N_m − 1 = n_m`; `⟨z,z⟩ = T(u_*) = −⟨z_m,z_m⟩` | holds | none |
| 6.4 (d) | `𝒪ζ ⊂ 𝔤L₀` | `𝔤L₀ = 𝒪ζ ⊥ aL_{V_A} = aL₀` ⇒ `𝔤 ∈ a·Stab`; route's `𝔤⁻¹L₀` gives `Stab·a⁻¹` | statement holds | C05 |
| 6.4 remark | `v | T(u)`, `u ≠ u_*` | `v(−T(u_*)) = 0`; `v(⟨z_{m,u}, z_{m,u}⟩) = v(−T(u)) = 1` | false | R01 |
| 6.5 Check | `k ≥ 1`, `r_S ≥ 1` | `J₀` pattern group, index `g^k` in `P₀`; on `1 + tE_{z_m,f_{r_S}} ∈ J₀`: `ch₀ = ψ_g(ϖ⁻¹t) ≠ 1`, every character of the unitriangular group `= 1` | holds | none |
| 6.5 (c) | `j`, `m` even | `c(j) = 2r′+1`, `c(j+1) = 2r′`; box `ϖ^{−(r′+1)}𝒪ⁿ`; `V̂ = q^{(r′+1)n} > 0` ⇒ `c_G(j) > 0` | holds | none |
| 6.6 Check, (a), (b) | `n = 1`, `Λ = 𝒪` | `q_v − 1` pairs, new forms of dim `q_v − 2`; `L^{gl}` projects to `𝒪`, meets `F_v ⊕ 0` in `ϖ𝒪`, contains `e`; `Σ_ϑ ϑ(z) = q^{n′}·1[z ∈ ϖΛ′]` | holds | none |
| 6.8 | factors of `c_V(j)` | `c_Q = ∏(idx·idx)⁻¹ > 0`; `c_G > 0`; `c_T = ∏ r·χ_W(ϖ)^e`, `r > 0`, `|χ_W| = 1`: all nonzero | holds | none |
| 6.9 (b) | finite-order `ξ`, `E` CM | `E_∞^× = (ℂ^×)^f` connected ⇒ `ξ_∞ = 1`; a real place would admit the sign character | holds | none |
| 6.10 | `ι_top`, `c_P` | `c_P(ξ)/c_P(1) = s(ξ)/(s(1)ι_top(ξ))`; both sides linear in `Υ`, conjugate-linear in `φ′` | holds | none |
| 6.11 (b) | value span `0` or `ℂ` | (a) gives a well-defined linear map `ℂ → ℂ`, multiplication by `Λ_u`; `c_bot = ∏ c_I > 0` | holds | none |
| 6.12 Check | Iwahori in `GL₂`, `q_v = 5` | index `q_v + 1 = 6`, not a unit at 2, 3; `c_Q/(c_I c_I) = 1/(c_I(j+1)(1)c_I(j+2)(1))` (RowTowerAndRallisIdentities §5.4) | holds | none |
| 6.13 (a), (o) | `n₀ ∈ N_S(𝔸)` | `𝔅_x(e)(n₀g)` picks up `ψ_u(n₀)·conj ψ_u(n₀) = 1`; `R(e_𝒟)T(v′) = ⟨w, v′⟩T(w)` ⇒ `v′ ∈ ℂw` | holds | none |
| 6.14 (headline 2) | `m = 4`; `ξ = 1` | `col^S = c_T(0)·K₄K₃K₂K₁·S₀²`; `ζ_ℂ` formula gives `1` at `ξ = 1`; (d) linear in `φ`, conjugate-linear in `x` | holds | none |
| 6.14 hypothesis | roadmaps named | TaylorBounds…, LocalGain… named; absent from contracts, Dependencies, *Needs:*, description's dependency list | inconsistent | C02 |
| 6.14 (d) notation | `z_u` | `π_ue_{N_m}` in 6.5 and contracts; central adelic element in route; `z` in 6.13 (c) | clash | C03 |
| 6.15 (headline 3) | `B_u = 0`, `B_u ≠ 0` | `B_u ≠ 0` ⇒ `B_u∘D_ξ ≢ 0` (`ι_ξ` onto `𝔼`) ⇒ `ζ = σ₀⁻¹ζ_ℂ`; `B_u = 0` ⇒ `ζ := 1`; `Ξ` finite | holds | none |
| Conventions, `ζ` | 6.14 only, `ζ_ℂ ∉ σ₀(𝕃)` | 6.1 sets `ζ := 1`; identity fails when `B_u∘ι_ξ ≢ 0` | unsupported | C01 |
| Conventions, `δ_T` | `d = 7` | `√−7/7 = −1/√−7` since `7 = −(√−7)²`; `conj δ_T = −δ_T` ⇒ `Tr(δ_T tr(x^†y))` alternating | holds | none |
| AutomorphicFormsOnReductiveGroups §4.2 | heights, moderate growth | §4.2 is cuspidal globalisation; moderate growth §0.4; height AdelicAlgebraicGroups §3.5 | mis-cited | C04 |
| Family index entry | "relation of their norms" | no norm comparison of Bessel and Fourier–Jacobi periods anywhere in the README | stale | C06 |
| Description | "identical content" | index README: 194 lines here, 191 at #2918 (other second paragraph), 188 at #2882 and #2877 | false | C07 |

- Source locators checked against a text: none exist in the README. The announcement (author's page) was read; [FormalProof] is held locally only as a kernel export, of which the module list was read.
- Library declarations opened at the pin: `NumberField.AdeleRing` (`Mathlib/NumberTheory/NumberField/AdeleRing.lean:56`), `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:105`) and `SchwartzMap` (`Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75`). Mathlib and Tau Ceti at the pins have no Weil representation, theta lift, Bessel or Fourier–Jacobi period, Schwartz–Bruhat space or automorphic form on unitary groups, which confirms that no headline is statable.
- Cross-roadmap citations resolved, at the open heads or on main:
  - ThetaChainsOnDefiniteUnitaryGroups §§2.2–2.9c, 3.1–3.10 (2.2, 2.2a, 2.4, 2.5, 2.8, 2.9a, 2.9b read);
  - RowTowerAndRallisIdentities §§5.2–5.6, 5.8, 5.8a–5.8e (5.3, 5.4, 5.6, 5.8 read);
  - BesselPoincareSeriesAndGramBounds §§5.13–5.15, 5.21 (5.21 read);
  - ThetaLiftsForDefiniteUnitaryGroups §§0.1–0.4, 1.2, 2.5 and ThetaKernelsForUnitaryDualPairs §§3.3b, 3.45, 3.46, 4.4a;
  - HermitianFormsAndLattices §4.2, DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a, FrobeniusRestrictedRieszSums §§0.1–0.4 and GanGrossPrasadUnitaryGroups §§1.2, 4.1;
  - on main: MetaplecticAutomorphicForms §§2.6a, 3.2a, 3.3, 5.6, 6.15 and AutomorphicFormsOnReductiveGroups §§0.4, 2.1, 2.4, 2.7, 4.2;
  - other roadmaps' citations of this one (6.1, 6.5, 6.8, 6.13 (o), 6.14, 6.15) and the downstream ids of this README (GluedTargetAndDivisionInequality §§7.13, 7.14, 8.6, 8.9; ThetaChainsAndFrobeniusPrimeSums §§9.6, 10.0, 10.9) all exist.
- Dependency check: `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)`, with no UPWARD or CYCLE line. With the default merge-order file, the roadmap is reported as not yet in the order, which is not a defect at this stage.
- Elaboration of `Suggested.lean` with `lake env lean`: exit 0, no messages. The file has no declaration, so there was no `#check @name` comparison to make.
- Automatic checks: all passed at the worker. Rerunning them adds only the family-index files outside the folder (owned by this pull request) and the not-in-order line above.
- Ownership: Fourier–Jacobi periods and the Bessel–Fourier–Jacobi unfolding of theta lifts have no other owner. GanGrossPrasadUnitaryGroups defers Fourier–Jacobi endpoints to a Part II, and ThetaKernelsForUnitaryDualPairs owns constant terms along an isotropic line (5.7c), not Bessel coefficients.

Overlap check: read RowTowerAndRallisIdentities, ThetaLiftsForDefiniteUnitaryGroups, ThetaChainsOnDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, BesselPoincareSeriesAndGramBounds, AutomorphicLFunctionsAndLocalFactorsPartII, AutomorphicSpectralTheory, MetaplecticAutomorphicForms; nothing shared (the global seesaw is MetaplecticAutomorphicForms §6.15 and the orthogonal-sum splitting is ThetaKernelsForUnitaryDualPairs §3.3b, both cited; 6.3 is their instance).

Source independence: 6 passages compared with 1 readable source (the announcement: the opening overview, 6.1, 6.6, 6.10, 6.14, 6.15), none shared. The README has no locators; by citation, [FormalProof] is the reference of 10 of the 19 targets. Its contents could not be compared, since only a kernel export and its module list are readable; the module names show no chapter-like correspondence with the layer's sections.

Research link: Layer 6 of the chain of theta lifts on which, per the README and the family index, Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026) rests. Its general statements 6.2a–6.2d are the Bessel–Fourier–Jacobi unfolding of theta lifts of Gan–Ichino, Xue, Atobe and Furusawa and Kudla's seesaw (1984), as the README's references say. This line rests on the README.

## Not verifiable

- [FormalProof] at the sampled NEW targets 6.1, 6.5, 6.6, 6.8, 6.11, 6.14 and 6.15: the README gives no locator. The operator's copy is a kernel export with no source text, and the public repository's host is not one the sources service reads.
- The sampled KNOWN targets 6.2b, 6.2c, 6.2d, 6.3, 6.4, 6.9, 6.10 and 6.13: no work is named for Furusawa, Gan–Ichino, Xue, Atobe, Casselman, Wallach or Godement. Kudla (1984) was found at no legal host, and Gross (1999) resolves only to a paywalled publisher.

Automatic checks set aside as false positives: the rule that a pull request change no file outside the roadmap folder under review (it keeps other roadmaps from receiving unreviewed edits) lists the three files of the family index (`README.md`, `Suggested.lean`, `metadata.toml` of `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/`); this nested roadmap's family index belongs to this pull request, so these edits are in scope.

## Source issues

- none

## For the human reviewers

- Scope: the only source of the 10 NEW targets is [FormalProof], announced on 20 November 2026 and unrefereed. The announcement says no written account exists yet (Announcement lines 45–49, 72–76).
- Not tested: [FormalProof], the reference with the largest share, could not be read as text: only a kernel export and its module list. Wording and arrangement were not checked against it.
- Licence: [FormalProof] is cited at a GitHub repository whose host the sources service does not classify. Its licence was not checked.
- The sibling roadmaps ThetaChainsOnDefiniteUnitaryGroups and BesselPoincareSeriesAndGramBounds cite [FormalProof] the same way, without locators, so R02 concerns the whole family.
