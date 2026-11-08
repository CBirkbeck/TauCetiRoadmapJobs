# FIX-RT-GeometricSatakeAndFusionPartII~2

Two red-team reviews of round 2 were merged: pass a (seven findings, F01 to F07) and pass b (four findings, F01 to F04). Two pairs overlap (a/F02 with b/F04, a/F04 with b/F03) and are settled once each. Every finding was checked against the cached sources, the pinned libraries and the supplier roadmaps at their current heads; all nine distinct findings hold and were applied. Edits touch `packages/GeometricSatakeAndFusionPartII/README.md`, `sources.toml` (one locator) and the `gaps` list of `design/plan.json` (four `section` fields). `Suggested.lean` is unchanged: it declares nothing and no finding concerns it.

## RT-GeometricSatakeAndFusionPartII~2a/F01 (P1) — applied

Verified: AGLR Definition 3.14 and Lemma 3.15 (AGLR line 1336 and AGLR line 1356) define depth zero as the L⁺𝒢-action factoring through G^perf_k̄, the perfection of the special fibre of the parahoric group scheme, and the proof of Theorem 3.16 (AGLR line 1414) shows that L⁺𝒢 "acts via 𝒢_k̄". Nothing there passes to the maximal reductive quotient. The witness holds: for the GL₂ Iwahori with Λ₀=O²⊃Λ₁=Oe₁⊕πOe₂, 1+aE₁₂ reduces into the unipotent radical of 𝒢_k̄ (reductive quotient the torus), is the identity in the basis (e₁,πe₂) of Λ₁, and moves the line [0:1] of Λ₀/πΛ₀ to [a:1].

§3.4, old → new: "depth-zero perfect Schubert schemes, on which the positive loop group acts through its reductive quotient" → depth zero defined as the action through the perfection of 𝒢_k̄ (smooth connected, not reductive in general), with the explicit statement that it does not factor through the maximal reductive quotient; the identification 𝒢_k̄≅𝒢′_k̄ with the companion is retained. The Iwahori computation is a new fourth Check. The phrase occurs nowhere else in the README.

## RT-GeometricSatakeAndFusionPartII~2a/F02, RT-GeometricSatakeAndFusionPartII~2b/F04 (P2) — applied

Verified: SW Theorem 21.7.1 (SW line 7820) gives M_r≅M_Dr⊗_(O_F)O_E; the Drinfeld chart at the node is xy=π_F (SW line 7816: regular). Over O_Ĕ with π_F=ϖ_E^e·unit the local ring at (ϖ_E,x,y) has dimension 2 and, for e≥2, embedding dimension 3. RZ17 Corollary 5.6 (RZ17 line 1112) asserts normality only and Remark 5.7 (RZ17 line 1115) leaves semistability open. The witness F=Q₃(∛3), r=(1,2,0) has trivial stabilizer, E=Q₃(∛3,ζ₃), e(E/F)=2.

§6.5 Checks, old → new: the second bullet now asserts regularity only for the Drinfeld function, and for general r gives the chart xy=π_F over O_Ĕ with π_F=ϖ_E^e·unit, normal, regular exactly when e=1; the local ring is named as the localization at (X₁,X₂). The third bullet is the F=Q₃(∛3), r=(1,2,0) instance with its computed e=2 and non-regularity. No other Check asserts regularity after reflex base change (§6.6's bullet already denies it).

## RT-GeometricSatakeAndFusionPartII~2a/F03 (P2) — applied

Verified: RZ17 Definition 3.3 (RZ17 line 420) states (R_r) for O_Ẽ-algebras, where the decomposition O_(F̃^t)⊗O_Ẽ=∏O_Ẽ exists; RZ17 line 426–429 imposes it on an arbitrary O_E-algebra through a base change to an O_Ẽ-algebra and notes independence of that choice; Remark 3.4 (RZ17 line 430) gives independence of the unramified subfield of D. The witness holds: for F=E=Q_p, n=2, S=Spec F_p, O_(F̃^t)⊗F_p=F_(p²) has no nontrivial idempotents.

§6.5 bold target, old → new: "after the decomposition of L by the embeddings ψ̃ ... each graded piece L_ψ̃ has rank ..." → the decomposition is taken over the finite étale extension Ẽ=E·F̃^t, the condition is required there (open and closed, tested on geometric points), proved independent of the O_Ẽ-structure and of F̃ by Skolem–Noether, and descended to O_E; the Eisenstein condition is noted to use only the ψ-decomposition, available over O_E since E⊇φ₀(F)⊇F^t. The S=Spec F_p instance with split graded ranks (1,1) is a new first Check. The RZ17 manifest locator now includes Remark 3.4.

## RT-GeometricSatakeAndFusionPartII~2a/F04, RT-GeometricSatakeAndFusionPartII~2b/F03 (P3) — applied

Verified: LefschetzPencilsAndVanishingCycles at its open head (#873, 072e6cd) states §1.10 "The semisimple trace of Frobenius" in prose, with no backticked declaration; `roadmaps grep 'semisimpleTrace'` finds no match on main or at any open head, and the three names occur nowhere at the pins.

Old → new: the contract sentence at the LPV supplier now names the section title and its content (admissible filtrations; independence of filtration and Frobenius lift; additivity in short exact sequences and triangles; sign under shift); the §8.2 *Needs* line and the Layer 8 Dependencies cite "LefschetzPencilsAndVanishingCycles §1.10, “The semisimple trace of Frobenius”" and drop the three names. The resolver now reports no Lean name found nowhere.

## RT-GeometricSatakeAndFusionPartII~2a/F05 (P3) — applied

Verified: `lake-manifest.json` records Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a, and both checkouts report those HEADs. All eight cited declarations resolve at the cited lines there (span 46, trace 70, Grassmannian 66, traceForm_nondegenerate 501, Scheme 40, iff_isProper_and_mono 392, ZariskiTangentSpace 65, adjointWeightSpace 100).

Old → new: the two pin hashes in "From Mathlib" and "From Tau Ceti" are replaced by the manifest's; the file-and-line citations are unchanged. No other package file carried the old hashes.

## RT-GeometricSatakeAndFusionPartII~2a/F06 (P3) — applied

Verified: the §4.5 bullet restated the empty interval, and the §4.8 bullet holds for every span, including the zero space. The proposed replacements compute correctly: for SL₂, λ=μ=α∨, j=0,1,2 give dominant representatives α∨,0,α∨≤α∨ and j=3 gives 2α∨, so k_α=2, while k_(−α)=0; for λ=α∨, μ=2α∨, k_α=3 and k_(−α)=1. KPZ §4.3.1 (KPZ line 1741–1747) spans 𝔗^cur by t^(〈λ,α〉−k)H_α for 1≤k≤k_α; reflecting λ−jα∨ by s_α gives k_α=〈λ,α〉+k_(−α), so its negative exponents are exactly 1≤i≤k_(−α), as the README's definition says.

Old → new: §4.5 Check "If k_α=0 the root contributes no directions" → the λ=μ=α∨ computation (derivatives t¹X_α, t⁰X_α for the positive root, none for the negative root). §4.8 Check "Replacing X_α by −X_α preserves ..." → the λ=α∨, μ=2α∨ computation, its agreement with the §4.9 minimum l=1, the wrong model indexed by k_α, and the reconciling identity with KPZ's exponents.

## RT-GeometricSatakeAndFusionPartII~2a/F07 (P2) — applied

Verified: KZ Proposition 3.1.14 and its proof (KZ line 948–956) identify M^loc(k) with the μ-admissible locus of G(F̆)/G(O_F̆) through the v-sheaf special-fibre theorem and injectivity of ρ on cosets when 𝒢̃=𝒢; no polynomial companion appears. §3.4's comparison assumes a quasi-tame prime-to-p polynomial model; §7.8's datum is acceptable (G^ad quasi-tame), so G itself need not be quasi-tame.

§7.8, old → new: the route now uses the normal model of §7.6, whose diamond is M^v; the reduction of that kimberlite is the perfection of its special fibre (DiamondsAndVStacksPartII §D11.4), identified with A_(𝒢,μ) by GeometricSatakeAndFusion GS4, “Integral local models and admissible special fibres”; GS4's functoriality identifies the special-fibre map with g↦ρ(g). §3.4 is removed from the route and the *Needs* line. Three Checks were added (diag(π⁻¹,1), diag(π⁻²,1), μ=0) with the computed lattices. The Layer 7 Dependencies list was updated. §5.1 and §8.2 keep §3.4: both are stated in the tame companion range.

## RT-GeometricSatakeAndFusionPartII~2b/F01 (P3) — applied

Verified at #1731 (04a1a06): `TauCetiRoadmap/RootSystemsPartII/README.md` has "### 4.3 The existential orbit-sum step" and "### 4.4 Ambient cocharacters, central directions and torsion", no "RS2" label and no section with either quoted title; its line 13 says minuscule detection and integral representation bounds are not part of that roadmap, and its Downstream consumers name a minuscule-bounds continuation consuming §1.1.

Old → new: every "RootSystemsPartII §RS2.4" (Scope, contract, §5.1 *Needs*, Layer 5 Dependencies, worked example) now cites §4.3 and §4.4 by title; the contract sentence states what each supplies (§4.3: the positive-root orbit sum on the flipped coroot pairing with λ<λ+β≤μ; §4.4: central coordinate retained and the lift to the coinvariant lattice with torsion under its injectivity and equivariance hypotheses). The three minuscule gaps keep their slugs and needs; their `section` fields in `design/plan.json`, and the Scope sentence, now point to the minuscule-bounds continuation named in RootSystemsPartII's Downstream consumers, since no MB.1–MB.3 section exists at that head. The maintainer should re-point them again once the intake names the actual section or roadmap.

## RT-GeometricSatakeAndFusionPartII~2b/F02 (P2) — applied

Verified at #1235 (140b5a7): GS0 §0.37 "Bounded admissible affine flag loci" defines only A_(𝓚,μ) with membership, inclusion and union API; the v-closure 𝓜_(𝓚,μ), the identification of its reduced special fibre with A_(𝓚,μ) without minuscule or tameness hypotheses, and the bounded nearby-cycle comparison with constant-term compatibility are GS4 §4.17 "Integral local models and admissible special fibres"; functoriality under model morphisms is GS4 §4.18 "Functoriality of integral local models". GS4 precedes this roadmap within the same supplier, so the direction is unchanged.

Old → new: the Scope paragraph and the GS contract attribute the v-model, its functoriality, its reduced special fibre and the nearby-cycle comparison to GS4 §§4.17–4.18 and keep GS0 §0.37 for the perfect admissible locus; §0.4 names GS4's v-closure. GS4 §4.17 was added to, or replaced GS0 §0.37 in, the *Needs* of §§0.4 (with §4.18), 3.4, 3.5, 3.7, 7.1, 7.5, 7.8 (with §4.18), 8.1, 8.2, 8.3, 8.4 and the Layer 0, 3, 7 and 8 Dependencies; §§7.2–7.4 keep GS0 §0.37 alone. The `section` field of gap:central-nearby-cycles-algebraicity in `design/plan.json` now names GS4 §4.17; gap:wild-admissible-closedness keeps GS0 §0.37, since it concerns the canonical deperfection of A itself.

## Checks run

- Elaboration: `lake env lean` on `packages/GeometricSatakeAndFusionPartII/Suggested.lean` from the content checkout exited 0 with no output. The file declares nothing, so the `#check @name` binder audit has no names to run on; no signature changed.
- Dependency check (`gate --depcheck ... --movable`): `depcheck: 236 roadmaps, 2162 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- Citation resolver after the edits: no Lean name found nowhere; the single remaining lead is DiamondsAndVStacksPartII, which exists only as the board design `packages/DiamondsAndVStacksPartII/design/README.md` and is in the merge order (not a finding of this round; its D10/D11 labels were checked there, including the new §D11.4 citation).
- Gap consistency: 44 slugs in `design/plan.json`, 44 "must provide" contracts in the README, equal sets, every slug used in a *Needs* line declared.
- No gate failures were listed in the brief.
- Worker check repair: the worker's build logged the warning that `Suggested.lean` imports `Mathlib` without the module system. The file now opens with `module`, then `public import Mathlib`, and places `@[expose] public section` before its namespace; nothing else in it changed (it still declares nothing). After the change `lake env lean` exited 0 with no output and the dependency check again printed `depcheck: 236 roadmaps, 2162 edges, 0 problem(s)` with no UPWARD, CYCLE or moved line.

## Adversarial pass on the changed and added statements

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §3.4 depth-zero definition | GL₂ Iwahori, μ=(1,0); hyperspecial (1,0); μ=0 | Iwahori: kernel of 𝒢(O)→𝒢(k) ⊂ 1+πM₂(O), fixes lines of Λ₀/π and Λ₁/π; 1+aE₁₂ in basis (e₁,πe₂) is [[1,aπ],[0,1]]≡1, on Λ₀/π sends [0:1]↦[a:1]. Hyperspecial: 𝒢_k=GL₂ reductive, action is the standard one on P¹. μ=0: point | action through 𝒢_k̄, not its reductive quotient; depth 0 in all three | wording and new Check |
| §4.5 new Check | SL₂, λ=μ=α∨ | j=0,1,2: λ−jα∨=α∨,0,−α∨ → dominant α∨,0,α∨ ≤ α∨; j=3: 2α∨ ≰ α∨; so k_α=2. λ+jα∨ ≤ α∨ iff j=0, so k_(−α)=0. Derivatives t^(2−1)X_α, t^(2−2)X_α | positive root: two directions; negative: none | replaces restatement |
| §4.8 new Check | SL₂, λ=α∨, μ=2α∨; cross-check λ=0, μ=α∨ | k_α: j=0..3 give α∨,0,α∨,2α∨ ≤ 2α∨, j=4 gives 3α∨; k_α=3. k_(−α): (1+j)α∨ ≤ 2α∨ iff j≤1; k_(−α)=1. C^cur=k t⁻¹H_α. §4.9: candidates 2−1=1, 2+1=3, l=1. Identity k_α=〈λ,α〉+k_(−α): 3=2+1; for λ=0, μ=α∨: 1=0+1 | agreement with §4.9; k_α-indexed model gives three dimensions | replaces non-discriminating Check |
| §6.5 (R_r) after base change to O_Ẽ | F=E=Q_p, n=2, S=Spec F_p; Drinfeld r, F ramified of degree e over Q_p | F_(p²) has no idempotent pair; F_(p²)⊗F_(p²)=F_(p²)×F_(p²), ranks (1,1), total 2=n. General Drinfeld: A_ψ=∅, rank L_ψ̃=ε_ψ, 1 over ψ₀ and 0 otherwise, total rank n·1=n matches rank n of the quotient | condition statable only after the étale base change; descends | definition repaired, Check added |
| §6.5 E⊇F^t claim | any r with r_(φ₀)=1 and r_φ∈{0,n}, n≥2 | σ fixing r sends φ₀ to an embedding with value 1, so σφ₀=φ₀; E⊇φ₀(F)⊇F^t, and F^t/Q_p is Galois | ψ-decomposition exists over O_E | none (justifies E_r over O_E) |
| §6.5 regularity Check | Drinfeld r (e=1); r=(1,2,0) over Q₃(∛3) (e=2); unramified E/F | e=1: m=(x,y), regular. e=2: xy−uϖ² ∈ m², dimension 2, embedding dimension 3. E/F unramified: e=1, regular. E=Q₃(∛3,ζ₃): e(E/Q₃)≥lcm(2,3)=6=[E:Q₃], so e(E/F)=2 | regular iff e=1; normal always (flat, regular generic fibre, reduced special fibre) | Check corrected |
| §7.8 route and Checks | GL₂ hyperspecial (1,0): g=diag(π⁻¹,1), diag(1,π⁻¹), diag(π⁻²,1); μ=0 | πgΛ=Oe₁⊕πOe₂ ⊂ Λ, quotient k·e₁; conjugate gives k·e₂; both in Adm((1,0))={t^(1,0),t^(0,1)}. diag(π⁻²,1): πgΛ∋π⁻¹e₁∉Λ; double coset of (2,0)∉Adm((1,0)). μ=0: Adm={1}, πρ(g)Λ=πΛ iff ρ(g)∈GL(Λ) | membership and admissibility agree; no undefined quotient used | route re-sourced, Checks added |
| §7.8 reduction of M^v | GL₂ line model; μ=0 | (P¹_(O_E))^♦ has reduction (P¹_k̄)^perf=A_(𝒢,(1,0)); Spd O_E has reduction the point = A_(𝒢,0) | D11.4 reduction equals perfected special fibre | citation added |
| Contract for GS4 §4.17 | μ=0; GL₂ (1,0) | §4.17's own Checks: unit point / P¹ and its perfection | matches §0.4's Checks | citation moved from GS0 §0.37 |
| Contract for RootSystemsPartII §§4.3–4.4 | A₂ reversal, endpoints 0 and α₁+α₂; D₄ triality θ=(1,2,1,1); GL₂ (c,c)→(c+1,c−1) | §4.3 Check: orbit sum α₁+α₂ once, budget 0. §4.3 Check: sum of the three conjugates (1,3,1,1) exceeds θ on node 2, θ itself valid. §4.4 Check: central coordinate 2c preserved | matches the worked example and §5.1's three consumed facts | citation corrected |
| LPV §1.10 contract | two-dimensional unipotent block, eigenvalues q⁻¹,1; q=9 | LPV Check a+qa with a=q⁻¹: 1+q⁻¹=10/9; invariants q⁻¹=1/9 | matches §8.2 Check and the Layer 8 example | names dropped |

## For the maintainer

- Names other roadmaps cite: none of this roadmap's own names changed (it declares none). The citations into GeometricSatakeAndFusion now distinguish GS0 §0.37 (admissible locus) from GS4 §§4.17–4.18 (v-model, special fibre, functoriality, nearby-cycle comparison); any consumer copying this roadmap's earlier contract text should do the same.
- The three RootSystemsPartII minuscule gaps have no home section at #1731; their `section` fields point to the continuation its Downstream consumers announce. If the intake assigns them to a new roadmap, the `supplier` fields must change too.
- DiamondsAndVStacksPartII is cited from its board design only (no roadmap folder on main, no open pull request); the resolver flags it. It is in the merge order ahead of this roadmap.
- Ownership against open pull requests not listed in the brief with files was not checked. No new source was fetched; `needs-references.toml` was not created. No suspicious instruction was found in the reviews, roadmaps or sources read.
