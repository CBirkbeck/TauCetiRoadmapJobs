# FIX-RT-TriangulineVarietyAndItsLocalModel~2: repair of red-team round 2 (passes a and b)

Files edited: `packages/TriangulineVarietyAndItsLocalModel/README.md`, `Suggested.lean`, `design/plan.json` (one `gaps` entry's `section` only), `sources.toml`.

## RT-TriangulineVarietyAndItsLocalModel~2a/F01 (P1) — applied

The witness holds: for n=1, K/ℚₚ unramified quadratic, weight 0, the crystalline space has dimension 1 and `Res_(K_0/Q_p)G_m` dimension 2, so no morphism from the space itself is smooth. §8.6 now states the period-frame torsor P (bases of the period family, relative dimension [K′₀:ℚₚ]n²) and the smooth period morphism P→M_τ of relative dimension n² (fibres the representation frames), proved through LocalGaloisDeformationRings §3.6's formal smoothness over the filtered-module groupoid; for trivial type this is the base change of Hartl–Hellmann's trivialization torsor over the admissible quotient stack (HartlHellmann Corollary 8.16, Proposition 8.17; lines 2101, 2137), which is what BHSsmooth17 line 449–452 cites. The Hodge-flag morphism is now h̃ on the adapted-frame torsor P_B (bases of D_dR adapted to the refinement flag), smooth by the same Artinian lifting argument; Bruhat cells are torsor-invariant and descend. §8.7's proof takes closures on P_B and descends along the open surjective torsor map. New Checks: the witness (torsor dimension 1+2=3, relative dimension 1=n², basis change (a,b)↦(au₂/u₁,bu₁/u₂) with ab invariant). Old → new: "Locally choose a basis of D; the Frobenius matrix and the Hodge filtration define a smooth morphism to (Res GL_n×Flag)^rig" → torsor formulation above. Note on the source: BHSsmooth17's bibliography entry [28] misprints Hartl–Hellmann's arXiv identifier as 1202.4408 (that is Hellmann's finite-slope paper); the paper is arXiv:1312.6371, Algebra & Number Theory 14 (2020), now recorded as `HartlHellmann`.

## RT-TriangulineVarietyAndItsLocalModel~2a/F02 (P2) — applied

BHS19 Remark 4.2.4 (line 3098) states the crystabelline extension. §8.6 is now the refined crystabelline deformation space of fixed weight k and abelian inertial type τ (T_τ the closed space of ordered smooth-character tuples with unit restrictions τ, `T_tau/S_n = prod_j (G_m)^(m_j)/S_(m_j)`, fibre product through the characteristic polynomials of Art_K(ϖ_K) on the isotypic parts of the Weil–Deligne family), with the crystalline case as trivial τ. §8.7 states: r crystabelline, distinct labelled weights, refinement χ=(χ_i) with `WD(r) ~= sum chi_i o Art_K^(-1)`, χ_i pairwise distinct and χ_iχ_j⁻¹≠|·|_K; x_w∈X_tri iff w_x≤w; the crystalline reading φ_iφ_j⁻¹∉{1,p^f} and the source's Remark 3.7.9 formulation are recorded. Suppliers: LocalGaloisDeformationRings §§3.4, 3.5 (type τ, L=K′), 3.6, 3.10 (regular potentially crystalline generic fibre of fixed type, which §3.10 at its head states), PadicHodgeTheory §§5.2 (finite descent dictionary) and 5.3 (D_pst, Weil–Deligne representation, inertial type). Contracts and Scope updated accordingly; `Suggested.lean`'s Layer 8 docstring bullet names the crystabelline companion criterion and its missing carriers. New Checks: n=1 ramified finite-order χ gives x_e=(χ,χ); a finite-order twist of a generic crystalline point keeps all ratios, flags and companion counts.

## RT-TriangulineVarietyAndItsLocalModel~2a/F03, RT-TriangulineVarietyAndItsLocalModel~2b/F03 (P3) — applied

`lake-manifest.json` pins Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a; both checkouts' heads agree. The two hashes in "From Tau Ceti" were replaced. The eight Mathlib locators were not changed (both reviews re-checked them at the actual pin).

## RT-TriangulineVarietyAndItsLocalModel~2a/F04 (P3) — applied

Added the third Check to §11.8: for n=2,d=2, P=G has derivative image of dimension 2+2=4 excluding (log_σ,0) (since (log_σ,0)−(ψ,ψ) is smooth only if ψ and log_σ are smooth), P=B has 2+4=6 and contains it.

## RT-TriangulineVarietyAndItsLocalModel~2a/F05 (P3) — applied

Witness recomputed: N=εE₁₂, B=diag(1,0) gives [N,B]=−εE₁₂≠0, ε[N,B]=0, and 1+εB commutes with N. The §1.1 Check now states the exact dichotomy: the transported matrix is N+ε[N,B]=N+ε[N̄,B̄] (reductions modulo ε), so the framed objects differ exactly when [N̄,B̄]≠0; N=E₁₂ (commutator −E₁₂, non-isomorphic) and N=εE₁₂ (isomorphic, same matrix) are both recorded. Same construction elsewhere: none (§1.2 and §2.4 use the matrix model with α fixed).

## RT-TriangulineVarietyAndItsLocalModel~2b/F01 (P2) — applied

PhiGammaModulesAndIwasawaCohomology at its head has no §4.0; the character spaces are §2.7 "Compact character spaces and scalar Mellin coordinates", which constructs W_G, the K× space as W×G_m through K×≃ϖ_K^ℤ×O_K×, generator/uniformizer changes and finite coefficient extension; none of `compactCharacterSpace`, `localMultiplicativeCharacterSpace`, `CharacterWeights` occurs in its README or Suggested.lean. All fifteen occurrences of "§4.0" / "§§4.0, 7.3" (Scope line, contract, gap line, Needs lines of §§3.1, 4.3, 6.2, 8.1, 8.4, 8.6, 9.1, 11.1 and the Layer 3, 4, 6, 8, 9, 11 Dependencies) now read §2.7 / §§2.7, 7.3; the three names are prose ("the compact character space of O_K×", "the character space of K×", "§7.3's weight function wt(δ)"); `design/plan.json` gap `general-character-spaces` has `section` "§§2.7, 7.3". The K=ℚ₂ sign-component Check is unchanged.

## RT-TriangulineVarietyAndItsLocalModel~2b/F02 (P3) — applied

PadicHodgeTheory at its head declares only `IsTateTwist` and `potentiallyMultiplicativeTwistReduction`; the §4.5 statement is prose. The contract line now reads "Section 4.5's full-rank quotient invariant identifies H⁰(M/N) …" with the Ding25 Lemma 2.1 locator kept.

## RT-TriangulineVarietyAndItsLocalModel~2b/F04 (P3) — applied

§3.4 now opens on "PhiGammaModulesAndIwasawaCohomology §3.9's localized Artinian category, whose objects are (φ,Γ)-modules M finite free over `R_(A,K)[1/t]` with a stable finite-projective R_K-lattice"; §3.9 was added to §3.4's *Needs:* and to the Layer 3 Dependencies; the contract reads "the localized Artinian category with its Herr complex and comparison". The D versus tD Check is unchanged.

## Checks run

- `lake env lean …/Suggested.lean` from the content checkout: exit 0, no output (the file declares nothing; the changes are the Layer 8 docstring bullet and the module header below). No `#check` comparison applies: there is no declaration.
- Worker repair: the targeted build warned that `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/Suggested.lean` imports `Mathlib`, a package designed for the module system, without a `module` header. The file now opens with `module`, a blank line and `public import Mathlib` (the header the merged CoboundaryExpansion roadmap uses); the gate's import rule accepts `public import Mathlib` as the single Mathlib import. Nothing else in the file changed; `lake env lean` on the edited file again exits 0 with no output. The warning is Lake's, raised by the build and not by `lake env lean`, so it could not be reproduced here; only the build will confirm it is gone.
- Dependency check: `depcheck: 210 roadmaps, 1833 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no citation and no Lean name found nowhere.
- No gate failures were listed in the brief.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §8.6 period morphism P→M_τ, relative dimension n² | n=1, K unramified quadratic, k=0, trivial τ; general (n,d,f) | dim X=1, dim Res G_m=2, dim P=1+2=3, 3−2=1=n²; general: (n²+dn(n−1)/2+fn²)−(fn²+dn(n−1)/2)=n² | consistent; stated on P, not X |
| §8.6 M_τ dimension and smoothness | n=1, K=ℚₚ, K′ unramified quadratic, trivial τ | descent datum (c,c⁻¹), Frobenius (a,b), relation c²=a/b: dimension 2=f′n², smooth | consistent |
| §8.6 Frobenius coordinates under basis change | n=1, f=2, basis e↦ue, u=(u₁,u₂) | (a,b)↦(au₂/u₁,bu₁/u₂); product ab fixed; φ²(e)=ab·e | Check added |
| §8.6 T_τ/S_n | n=2, τ={τ₁,τ₂} distinct; τ=(τ₁,τ₁) | two components swapped, cover étale of degree 2; one component, ramified along the diagonal | Check added |
| §8.6 refined space, n=1 | trivial τ; ramified τ₁ | T_τ=G_m in both; ι: χ↦(χ,χ); type spaces disjoint | Check added |
| §8.6 h̃ formal smoothness | A→A′ small extension, Fil lifted in an adapted basis | (D,Φ,ρ,F_•)=⊕ rank-one on W̃ (Ext¹ between distinct characters is 0), lift freely; Artinian deformation of weakly admissible is an iterated extension, hence weakly admissible | proof route recorded |
| §8.7 hypothesis translation | δ_i=z^(h′_i)χ_i | δ_i/δ_j algebraic ⟺ χ_i=χ_j; εδ_i/δ_j algebraic ⟺ χ_jχ_i⁻¹=\|·\|_K; crystalline: unr(φ_i/φ_j)=\|·\|_K⁻¹ ⟺ φ_i/φ_j=p^f | matches BHS19 lines 2851, 3035 |
| §8.7 companions | n=1, ramified χ, h=0; S₂ twisted by finite-order ψ; S₃ | w_x=e=w, x_e=(χ,χ); counts 2 (w_x=e) and 1 (w_x=s) unchanged; s₁≤s₁s₂, s₂≰s₁ | Checks added |
| §8.7 Weil eigenvalue convention | crystalline over ℚₚ, φ-eigenvalue λ | χ=unr(λ): geometric Frobenius ↦ λ, PadicHodgeTheory §5.3 arithmetic eigenvalue λ⁻¹ | contract sentence added |
| §1.1 frame Check | N=0; N=E₁₂, B=diag(1,0); N=εE₁₂, B=diag(1,0); rank 1 | [N,B]: 0, −E₁₂, −εE₁₂; ε[N,B]: 0, −εE₁₂, 0; (1+εB)N=N(1+εB) iff ε[N,B]=0 | dichotomy stated |
| §11.8 third Check | n=2,d=2, P=G and P=B | 2+1·2=4 and 2+2·2=6; (log_σ,0)−(ψ,ψ) smooth forces ψ, log_σ smooth | Check added |
| §3.4 category | D versus tD | same filtered colimit, same W_dR, lattices differ by t | citation only |
| Pins | manifest and `git rev-parse HEAD` of both packages | f6090c7…, 358314d… | replaced |

## Notes for the maintainer

- `sources.toml`: the sources service rewrote key order inside every entry (no content change). A first fetch of "arXiv:1202.4408" (BHSsmooth17's misprinted identifier for Hartl–Hellmann) returned Hellmann's "Families of trianguline representations and finite slope spaces", which the roadmap does not cite; that entry (key HH20) was deleted. Hartl–Hellmann was then fetched at arXiv:1312.6371 (v2, 2020) under key `HartlHellmann`, status certified, with a version note on the numbering; it is cited in §8.6.
- `design/plan.json` line 2539 still titles the §8.7 target "Generic crystalline companion points"; the brief allows editing only the top-level `gaps` list, so the title was left and the README's §8.7 heading is now "Generic crystabelline companion points".
- Names other roadmaps cite: none changed (`Suggested.lean` declares nothing). PadicHodgeParametersInLocallyAnalyticRepresentations consumes Layers 10–13, which are untouched.
- Ownership of the period-frame torsor and the crystabelline refined space: no roadmap on main, on the board or at the indexed open heads states them (object search "trianguline", "refined crystalline", "companion", "period-frame"); the frame torsor is an adapter over LocalGaloisDeformationRings §§3.5–3.6 families and belongs here. Open pull requests outside the brief's list were not checked.
- Lean docstring: the Layer 8 bullet now names the crystabelline companion criterion; no declaration was added (no carrier for crystabelline representations, refined deformation spaces or the trianguline variety exists at the pins).
