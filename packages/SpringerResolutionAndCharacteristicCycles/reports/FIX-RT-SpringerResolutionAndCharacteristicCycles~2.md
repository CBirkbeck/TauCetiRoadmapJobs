# FIX-RT-SpringerResolutionAndCharacteristicCycles~2: red-team round 2 repaired

Reviews settled: RT-SpringerResolutionAndCharacteristicCycles~2a (F01–F05) and RT-SpringerResolutionAndCharacteristicCycles~2b (F01–F05). Every finding was verified against the cached sources (BR12, BHS19, M23), the pinned Tau Ceti (358314d4) and Mathlib (f6090c70), and the cited sibling heads before any edit. Nine of the ten findings are applied; one pair of overlapping findings is settled once. Files changed: `packages/SpringerResolutionAndCharacteristicCycles/README.md`, `packages/SpringerResolutionAndCharacteristicCycles/sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged (no gap is added or altered).

## RT-SpringerResolutionAndCharacteristicCycles~2a/F01 (P1) — applied

Verified. BR12 lines 1116–1118 define regularity as ⟨λ+ρ_BR,α∨⟩∉pZ with ρ_BR the half-sum of the roots of g/b, so ρ_BR=−ρ in our convention; BR12 line 1114 shows the character parameter is the actual t-character of D̃ (tensoring with O_B(μ−λ) moves λ to μ). For SL₂, p=3, ν=ρ the old condition gave pairing 2 (admitted) while L_B(ρ)=O(−1) is a nonzero module over the ν=ρ twisted operators with RΓ=0. §4.2's localisation paragraph now names ν as the actual t-character (ν=0 is D_F), states regularity as ⟨ν−ρ,α∨⟩∉pZ with the transport from BR, uses (ν,χ) for the Harish–Chandra/Frobenius fibre, and separates ν from the Layer 10 Beilinson–Bernstein parameter and the §10.4 labels. The p=3 Check now records ν=0 (−1, regular), ν=ρ (0, excluded, RΓ(P¹,O(−1))=0), ν=2ρ (1, regular), ν=4ρ (3, excluded) and the wrong answers of the untransported condition. No other occurrence of the old condition exists in the README (grep `λ+ρ,α∨`, `pZ`); the §12.1 pairings ⟨−wρ−ρ,α∨⟩ are a different object and are unchanged.

## RT-SpringerResolutionAndCharacteristicCycles~2a/F02, RT-SpringerResolutionAndCharacteristicCycles~2b/F01 (P2) — applied

Verified. BR12 lines 233–235 define F⋆G=R(p₁₃)_*(p₁₂^*G⊗p₂₃^*F); BR12 lines 955–958 put Z_w over the orbit of w⁻¹, so X_u=Z_(u⁻¹). With BR's product, O_(X_s₁)⋆O_(X_s₂) is supported over Ū_(s₂s₁); the displayed identity needs the opposite product. §4.2 now fixes K⋆L=R(p₁₃)_*(Lp₁₂^*K⊗ᴸLp₂₃^*L) on kernels proper over each factor, states the reading-order composition rule, records that it is BR's product with the arguments exchanged, and derives the displayed K_w and K_w^∨ from BR's theorem for the word sₘ⋯s₁ of w⁻¹. Added: the support of K_w^∨ is X_(w⁻¹), and the factor swap σ carries it to the same-order product on X_w (the one-letter twists are σ-invariant because ⟨2ρ−α,α∨⟩=0 makes L_B(2ρ−α) descend to G/P_s). New SL₃ Check: z=diag(1,2,4), s₁⁻¹z=diag(2,1,4), (s₁s₂)⁻¹z=diag(2,4,1) for the reading-order product versus diag(4,1,2) for BR's order; SL₂ cannot distinguish them.

## RT-SpringerResolutionAndCharacteristicCycles~2a/F03 (P2) — applied

Verified at the heads. ComplexComparisonPartII (merge order 42) says at its C5.1 "Shared algebraic operators and principal parts" block that C5.1 is the single owner of the order predicate, its laws, all-order principal parts, localization and sheafification, and that FormalConnectionsOpers F2.2 consumes them; FormalConnectionsOpers F2.2 at its head opens with "Consume ComplexComparisonPartII C5.1's characteristic-free algebraic interface" and retains symbols, Lie–Rinehart PBW and gr D_X≅Sym T_X. DeformationAndDerivedPatchingAlgebra §6.7 (merge order 69) makes its module cycle "a definitional abbreviation of PadicLocalLanglandsForGL2Qp §0.5's module cycle" with additivity and quotient comparison being §0.5's; PadicLocalLanglandsForGL2Qp (merge order 32) §0.5 states that cycle. Changes: Scope bullets for FormalConnectionsOpers and DeformationAndDerivedPatchingAlgebra rewritten; new contract "From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp" (§0.5); C5.1 paragraph added to the ComplexComparisonPartII contract; F2.2 and DeformationAndDerivedPatchingAlgebra contracts restated (§6.7 is an abbreviation, not consumed); the SchemeAndStackFoundations contract's completed-local grading now cites §0.5; §7.2 text and Needs cite PadicLocalLanglandsForGL2Qp §0.5; §8.1 and §8.2 text and Needs cite ComplexComparisonPartII C5.1 for the operator sheaf and FormalConnectionsOpers F2.2 for symbols/PBW. Both owners precede this roadmap; no gap or new carrier.

## RT-SpringerResolutionAndCharacteristicCycles~2a/F04 (P2) — applied

Verified at the pin: `TauCeti.exists_pow_toEnd_eq_zero_of_mem_rootSpace_neg` (TauCeti/Algebra/Lie/HighestWeight/Integrable.lean:118) and `TauCeti.locallyFiniteSubmodule_eq_top_of_isSl2Triple` (line 154), for Killing-semisimple finite-dimensional L over a characteristic-zero field with triangularizable Cartan, irreducible M with a highest-weight vector, simple root i with lam(coroot i)=n∈ℕ; no dominance elsewhere. The Tau Ceti contract now lists both with their hypotheses and what they do not give. §12.1 consumes them for α∈I_w (transported along RepresentationTheory/LieHighestWeight Layer 9, the centre acting by scalars) and proves only the converse (e_α f_α^(k+1)v=(k+1)(−m−k)f_α^k v≠0 when ⟨λ,α∨⟩=−m<0) and the P_I-integration and uniqueness. Needs line and a Check (SL₂ λ=0, λ=−2ρ; SL₃ λ=−2ρ+α₁ with pairings 0,−3) added.

## RT-SpringerResolutionAndCharacteristicCycles~2a/F05, RT-SpringerResolutionAndCharacteristicCycles~2b/F04 (P2) — applied

Verified: §9.4's Needs are §8.5 and §9.3, while finite length and CC-additivity are §9.5's theorem. §9.4's proof route now says the Bernstein inequality (§9.3) and Ch(M)=Ch(M′)∪Ch(M″) (§8.5) make the subcategory closed under subobjects, quotients and extensions, hence abelian, and that finite length, additivity and the K₀ homomorphism are §9.5's theorem. The API bullet "CC gives an additive map K₀(Hol(D_Y))→Z_n(T*Y)" is deleted; a Check records that δ₀⊕δ₀ is holonomic with the same characteristic variety as δ₀ and that only §9.5 sees the coefficient 2. §9.5 is unchanged.

## RT-SpringerResolutionAndCharacteristicCycles~2b/F02 (P3) — applied

Verified: BR12 lines 1713–1727 quote the isomorphism Q[W]≅H^BM_top from [28, Proposition 5.3], its description from [28, §6] or [43], and s↦[Z′_s] from [54, §6.2]. Sources fetched through the service: G86 (Ginzburg, Adv. Math. 61) resolves only to a paywalled DOI, recorded `uncertified`; KT84 (Kashiwara–Tanisaki, Invent. Math. 77) likewise `uncertified` with its DOI (the GDZ volume page the service fetched is a landing page without article text, so its entry was rewritten by hand to the uncertified form); R08 (Riche, Represent. Theory 12) is `certified` from the AMS open-access journal PDF, and Proposition 6.2.2 (R08 line 1564) identifies the kernel morphism Z[W]→L(Z) with Ginzburg's isomorphism. §11.1's statement and route now name G86 §§5–6/Proposition 5.3, KT84 §§2 and 5.5 (both by locator) and R08 Proposition 6.2.2 as the references of the Weyl-action/convolution comparison, which stays a proof target. References section extended. `needs-references.toml` is not left behind: every requested text is either read or settled as uncertified.

## RT-SpringerResolutionAndCharacteristicCycles~2b/F03 (P3) — applied

Verified on the witness: for H=Z/2 swapping two points, O_Y=k⊕k is the unique simple equivariant object but not a simple D_Y-module. §9.9 now classifies "the simple objects of the category of strongly H-equivariant regular holonomic modules, which for connected H are the D_Y-simple strongly equivariant modules", with the Z/2 Check added.

## RT-SpringerResolutionAndCharacteristicCycles~2b/F05 (P3) — applied

Verified by script (union of the external items of each layer's Needs lines against its Dependencies paragraph). Regenerated the Dependencies paragraphs of Layers 4, 6, 7, 8, 10, 11 and 12 as that union, after the edits above (so Layer 7 lists PadicLocalLanglandsForGL2Qp §0.5, Layer 8 lists ComplexComparisonPartII C5.1 and FormalConnectionsOpers F2.2 and no longer lists ReductiveGroups Layer 2, Layer 12 lists the two Tau Ceti theorems and RepresentationTheory/LieHighestWeight Layer 9). Layers 1–3, 5, 9, 13 and 14 already agreed and are untouched.

## Checks

- `lake env lean` on `Suggested.lean`: exit 0, no output. The file (docstring and empty namespace, no declarations) now opens with the `module` header and `public import Mathlib`, the form used by the merged roadmap CoboundaryExpansion, which removes the module-system warning the worker's check reported for a bare `import Mathlib`; nothing else in the file changed. The `#check @name` audit has an empty domain, since the file declares nothing.
- Dependency check: `depcheck: 234 roadmaps, 2114 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The new citations (PadicLocalLanglandsForGL2Qp §0.5, ComplexComparisonPartII C5.1, RepresentationTheory/LieHighestWeight Layer 9) were also read at their heads or on main.
- `sources check` on `sources.toml`: 0 problem(s).
- No gate failure was listed in the brief.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| §4.2 regularity ⟨ν−ρ,α∨⟩∉pZ | A₁, p=3: ν=0, ρ, 2ρ, 4ρ | pairings −1, 0, 1, 3; RΓ(P¹,O(−1))=0 with O(−1)≠0 at ν=ρ; old condition gave 1, 2, 3, 5 | ν=ρ excluded, ν=2ρ admitted; Check rewritten |
| §4.2 ν=0 is D_F; tensoring by L_B(μ−ν) | SL₂, ν=0→ρ | D̃⊗k_0=D_F; ⊗L_B(ρ)=O(−1) gives the operators on O(−1) | agrees with BR12 line 1114 |
| §4.2 convolution composition rule | SL₃ w=s₁s₂; SL₂; empty word | Cartan coordinates (1,2,4)→(2,1,4)→(2,4,1) versus (4,1,2); SL₂ both orders equal; empty word is the diagonal | reading order fixed; Check added |
| §4.2 support of K_w^∨ and σ-invariance of the one-letter twist | SL₂ (ρ,ρ); SL₃ (ρ,α₁−ρ) | SL₂: swap fixes (ρ,ρ); SL₃: difference (2ρ−α,α−2ρ), ⟨2ρ−α,α∨⟩=2−2=0, trivial on G/B×_(G/P_s)G/B | K_w^∨ on X_(w⁻¹), σ^*K_w^∨ on X_w |
| §12.1 converse of the criterion | SL₂ λ=−2ρ; λ=0; SL₃ λ=−2ρ+α₁ | e f^(k+1)v=(k+1)(−2−k)f^k v, never 0; λ=0: f v=0; SL₃: pinned theorem at α₁ (0), converse at α₂ (−3) | criterion holds in both directions; Check added |
| §9.4 abelian without §9.5 | δ₀, δ₀⊕δ₀, D_A¹, 0 | Ch dimensions 1, 1, 2, ∅; lengths 1, 2 invisible to Ch | bullet deleted; Check added |
| §9.9 simple objects | Z/2 on two points; SL₂ double flags | one orbit, trivial stabilizer, k⊕k simple equivariant, not D-simple; SL₂: two orbits, two simples | category named; Check added |
| §7.2 / §8.1 on the new owners | k[ε]/ε²: 2=1+1; k[x]: [∂,x]=1, gr D=k[x,ξ] | cycle coefficients on the §0.5 carrier; order laws on the C5.1 sheaf, symbol ring from F2.2 | same values, owners renamed |

## For the maintainer

- BR12 Theorem 2.2.1 prints the dualizing sheaf of Z_w as the reversed-order product O_(Z_sₙ)(…)⋆⋯⋆O_(Z_s₁)(…). With BR's own product (BR12 lines 233–235) and BR's labelling (Z_w over the orbit of w⁻¹), that reversed product composes to the orbit of w, i.e. it is supported on Z_(w⁻¹)=σ(Z_w), the swap of Z_w. The README therefore only claims concentration of K_w^∨ and records its support and its swap; it does not identify K_w^∨ with ω_(X_w) on the same support. This precision point in the source is worth a register entry.
- The sources service resolved the title "Geometric braid group action on derived categories of coherent sheaves" to arXiv math/0610751, which is a different paper; the manifest entry R08 was corrected by hand to Riche's AMS open-access PDF before any locator was taken from it. The fetched GDZ page for KT84 is a volume landing page, not the article; KT84 is recorded uncertified with its DOI.
- Ownership against open pull requests was checked through `roadmaps resolve` and by reading the cited heads (ComplexComparisonPartII, DeformationAndDerivedPatchingAlgebra, PadicLocalLanglandsForGL2Qp, FormalConnectionsOpers); other open heads were not read file by file.
- No name another roadmap cites changed; no supplier gap was added, altered or removed.
