# Review of SchubertGeometry (pull request #1224 at d65c5f0)

**Verdict:** needs changes

This is an incremental re-review of 49 changed lines since 3cffcc8, all of them in `TauCetiRoadmap/SchubertGeometry/README.md`. `Suggested.lean` is byte-identical to 3cffcc8, and nothing outside the folder changes. Both previous findings are repaired. The two repairs introduce two P3 findings. First, the new native-sheaf contract names consumers that the rewritten *Needs:* lines do not carry. Second, the new KnutsonBottSamelson locator labels a proof step as that source's "related result", and the source's proof of that result is wrong for nonreduced words. Every library name below was opened at the pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`. Every roadmap citation was resolved on main `1bea835`.

## R01 (P3) — The native sheaf contract names consumers that the rewritten *Needs:* lines do not carry

**Location:** `README.md:113–129`: “the determinant `FiniteLocallyFreeSheaf.det` at locally constant rank … with `FiniteLocallyFreeSheaf.pullbackDetIso` … pullback comparison `Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent` … is invertible when a factor is quasi-coherent. S1.1, S1.4 and S3.1 use these”. S1.1 (640) exports “tensor/exterior/determinant pullbacks”, but its *Needs:* (659–663) names only “the native tensor product and `FiniteLocallyFreeSheaf.dual`”. S3.1 (921) says “Construct the forgetful map to the ordinary Picard group”, and its *Needs:* (941) names no Picard carrier.

**Claim:** There are three mismatches in the repaired contract.
1. No *Needs:* line consumes `FiniteLocallyFreeSheaf.det` or `pullbackDetIso`. S1.1 exports exterior-power and determinant pullbacks, yet its rewritten *Needs:* line lists only the tensor product and the dual.
2. S3.1's forgetful map lands in the Picard group of G/P−. Its native carrier `LineBundleClass` appears nowhere in the README (grep: 0), so the codomain of an S3.1 target has no contract.
3. The named instance assumes that the *left* factor is quasi-coherent. The sentence says “a factor”, and the right-factor case is a separate instance.

**Witness:** At the pin:
- `LineBundle/Class.lean:50` defines `LineBundleClass X := Skeleton (InvertibleSheaf X)`, with `CommGroup` at :142.
- `LineBundle/Functoriality.lean:189` defines `pullbackHom`.
- `Modules/Pullback/Quasicoherent.lean:151` takes `[M.IsQuasicoherent]` (the left factor), and :172 (`_right`) takes `[N.IsQuasicoherent]`.

**Repair:**
1. S1.1's *Needs:* (661–662): replace “the native tensor product and `FiniteLocallyFreeSheaf.dual` with their pullback comparisons (From Tau Ceti)” by “the native tensor product, `FiniteLocallyFreeSheaf.dual`, `FiniteLocallyFreeSheaf.exteriorPower` and `FiniteLocallyFreeSheaf.det`, with `Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent`, `FiniteLocallyFreeSheaf.pullbackDualIso`, `FiniteLocallyFreeSheaf.pullbackExteriorPowerIso` and `FiniteLocallyFreeSheaf.pullbackDetIso` (From Tau Ceti)”.
2. The Picard group, in two edits:
   - From Tau Ceti: at line 109, delete “or tensor structure”, and after “assumed of it.” (also 109) add: “The Picard group of a scheme X is native. `TauCeti.AlgebraicGeometry.LineBundleClass X` (`TauCeti/AlgebraicGeometry/LineBundle/Class.lean`) is the commutative group of isomorphism classes of invertible sheaves. Its product is induced by `InvertibleSheaf.tensorProduct` (`LineBundle/TensorProduct.lean`) and its inverse by `InvertibleSheaf.dual` (`LineBundle/Dual.lean`). `LineBundleClass.pullbackHom` (`LineBundle/Functoriality.lean`) is pullback along a morphism of schemes, as a group homomorphism. S3.1's forgetful map lands in this group.”
   - S3.1's *Needs:* (941): after “with their pullback comparisons”, insert “, and the Picard group `LineBundleClass` with `LineBundleClass.pullbackHom`”.
3. Lines 125–128: replace “whose pullback comparison `Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent` (`TauCeti/AlgebraicGeometry/Modules/Pullback/Quasicoherent.lean`) is invertible when a factor is quasi-coherent” by “whose pullback comparison is invertible when either factor is quasi-coherent: the left case is `Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent` and the right case is `Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent_right` (`TauCeti/AlgebraicGeometry/Modules/Pullback/Quasicoherent.lean`)”.

**Tested:**
- All ten names elaborate at the pin with the types the repair states. I ran `#check` in a scratch file after building the object files of their modules.
- Determinant: take Spec(k×k) with E of rank 1 on one point and rank 2 on the other. Then `det E` is ∧¹E on the first point and ∧²E on the second, of rank 1 on both. The fixed-rank `FiniteLocallyFreeSheaf.determinant r` does not apply, so S1.1's determinant pullback is `pullbackDetIso`.
- Picard group, GL₂/B− = ℙ¹: the forgetful map sends X*(T) = ℤ² to Pic(ℙ¹) ≅ ℤ by (a,b) ↦ a−b. Its kernel ℤ(1,1) is the set of restrictions of X*(GL₂), which is S3.1's kernel statement. On a torus flag, a point, every character maps to the identity class `1`, which is S3.1's second Check.
- Tensor comparison: S1.1's and S3.1's factors are finite locally free, hence quasi-coherent, so either instance applies.

## R02 (P3) — S2.3 labels a proof step of KnutsonBottSamelson as that source's “related result”, and the source's proof of that result fails for nonreduced words

**Location:** `README.md:849`: “that the images of the initial segments of an arbitrary word form a weakly increasing chain of Schubert varieties, growing exactly at the letters that increase the length, is the related result of KnutsonBottSamelson §4, p. 4 (lines 141–148)”.

**Claim:** The source's “related result” (lines 137–138) is a different statement: every word for v contains a reduced subword whose product is v. The chain of images is the first step of the source's proof of it (lines 141–145). The proof then takes the letters where the image grows as that reduced subword. For a nonreduced word, those letters multiply to the Demazure product, not to v. So the citation points readers to a passage whose conclusion contradicts S2.3's own warning (“Do not substitute the ordinary group product of the letters”).

**Witness:** KnutsonBottSamelson lines 137–138 state the related result; lines 141–145 give the chain and the subword where the image grows; lines 146–148 claim that this subword has the original product. For the word (i,i), the subword is the first letter i, with product s_i, while the ordinary product is e.

**Repair:** Replace “is the related result of KnutsonBottSamelson §4, p. 4 (lines 141–148)” by:

> is the first step of the proof of the “related result” in KnutsonBottSamelson §4, p. 4 (lines 141–148). That proof's further claim, that the letters where the image grows multiply to the word's ordinary product, holds only for reduced words: for (i,i) they multiply to s_i, the Demazure product, not to e. Only the chain is used here.

**Tested:** The examples use the right-word convention of S2.3 in A₂.

| Word | Images of the prefixes | Letters where the image grows | Their product | Ordinary product |
|---|---|---|---|---|
| (i,i) | point, X(s_i), X(s_i) | first only | s_i = δ | e |
| (1,2,1,2) | point, X(s₁), X(s₁s₂), X(w₀), X(w₀) | 1, 2, 3 | w₀ = δ | s₁s₂s₁s₂ = s₂s₁ (length 2), since s₁s₂ has order 3 |

In both rows the chain statement, as the repair keeps it, holds. The “same product” claim fails in both.

## Previous findings

- R01 — repaired: S2.3's *Needs:* (849) now reads “The element δ(Q) is the Bruhat-maximal product of a subword of Q, written w_max(i) and characterised as the product of a longest reduced subword (LLM §3.1, p. 312, LLM lines 804–806)”. That is correct. The new KnutsonBottSamelson label is R02.
- R02 — repaired: `grep -c 'AlgebraicVectorBundles\|L2A\|Successor'` on the README returns 0. The scope sentence (63–65) ends “which is not a target here: S7.3 constructs only the flag comparison”. The StableReduction contract (507–509) names `TauCeti.AlgebraicGeometry.GradedQuasicoherentAlgebra`. The sheaf operations are now cited from Tau Ceti (113–132), and their consumer lines are R01.

## Verified sound

**Gate, build and dependencies.**

- My own gate run on d65c5f0: every check is 0, and the run ends `OK`. The worker's `scratch/gate.md` agrees.
- `lake env lean TauCetiRoadmap/SchubertGeometry/Suggested.lean`: five `declaration uses sorry` warnings (lines 68, 79, 91, 107, 123) and nothing else, in 3.6 s.
- `git diff 3cffcc88 HEAD -- TauCetiRoadmap/SchubertGeometry/Suggested.lean` is empty.
- `#check @name` for all five declarations in a scratch copy elaborates to types identical, after whitespace normalisation, to `scratch/signatures.md`. No binder changed. The previous one-tactic probe (no declaration closes with `simp`, `rfl` or a library `exact`) therefore still holds.
- Dependency check output: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. It prints no UPWARD, CYCLE or `moved:` line. The change only removes the AlgebraicVectorBundles supplier edge.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchubertGeometry'` is empty.
- `scratch/overlaps.md` reports no open pull request that changes this folder, no dropped cited id and no dropped id cited elsewhere.
- `git diff --stat 33196b1 1bea835 -- TauCetiRoadmap/` on main is empty, so every cross-roadmap citation the previous review resolved on 33196b1 resolves unchanged.

**Library declarations opened and elaborated at the pin (`#check`, 15 names; file:line in `TauCeti/AlgebraicGeometry/`).**

- The dual and its pullback:
  - `FiniteLocallyFreeSheaf.dual` (`VectorBundle/Dual/Basic.lean:64`) is the internal Hom into 𝒪_X.
  - `pullbackDualIso` (`Dual/Pullback.lean:46`) is defined for every `f : X ⟶ Y`, with no hypothesis.
- Exterior powers and their pullback:
  - `exteriorPower` (`ExteriorPower/Basic.lean:56`) is the functor `FiniteLocallyFreeSheaf X ⥤ FiniteLocallyFreeSheaf X` for each n.
  - `pullbackExteriorPowerIso` (`ExteriorPower/Pullback.lean:49`) is a natural isomorphism for every f.
- The determinant and its pullback:
  - `det` (`Determinant/LocallyConstantRank.lean:62`) is ∧^(rank E) at the locally constant rank and lands in `InvertibleSheaf X`. So the README's “at locally constant rank” is accurate.
  - `pullbackDetIso` (`Determinant/Pullback.lean:156`) holds for every f.
- The tensor comparison: `isIso_pullback_δ_of_isQuasicoherent` (`Modules/Pullback/Quasicoherent.lean:151`) and `_right` (:172) are in namespace `AlgebraicGeometry.Scheme.Modules`, as the README's short name implies.
- The graded algebra: `GradedQuasicoherentAlgebra` (`Modules/Quasicoherent/GradedAlgebra/Basic.lean:96`) is the full subcategory of `CommMon (GradedObject ℕ X.Modules)` whose components are all quasi-coherent (:82).
- Line bundles: `InvertibleSheaf` (`LineBundle/Basic.lean:119`), `InvertibleSheaf.tensorProduct` (`LineBundle/TensorProduct.lean:65`), `InvertibleSheaf.dual` (`LineBundle/Dual.lean:44`), `InvertibleSheaf.pullback` (`LineBundle/Pullback.lean:100`), `LineBundleClass` (`LineBundle/Class.lean:50`) and `LineBundleClass.pullbackHom` (`LineBundle/Functoriality.lean:189`).

**Cross-roadmap citations in the changed passages, resolved on main 1bea835.**

- StableReduction on main (320–322, 439–443) builds Layer 2's relative `Proj` on “AlgebraicVectorBundles L2A's `GradedObject`-based quasi-coherent graded algebra”.
- AlgebraicVectorBundles on main identifies that carrier with Tau Ceti's `GradedQuasicoherentAlgebra` (113–120, and the numbering note at 364). So README 507–509, which says relative Proj is built on the native carrier, is correct, and S5.6 and S6.1's citation of StableReduction Layer 2 still resolves.
- AlgebraicVectorBundles on main lists the same natives this README now cites: both tensor instances at 65–66, and `det` and `pullbackDetIso` at 94–101.
- Its Downstream consumers paragraph (865–869) says SchubertGeometry cites it for exactly these Tau Ceti declarations. So moving the citations to Tau Ceti agrees with the supplier's own account.

**Seeded sample, where it falls in the change.**

- S1.4 is the only sampled target that the change touches (its *Needs:* line). Its determinantal functor is the vanishing of ∧ᵏ of the universal maps, and the cited `exteriorPower` with `pullbackExteriorPowerIso` supplies exactly that and its base change. Values are in the table.
- The other sampled targets are untouched; the previous review read their locators where they were in its sample (S1.3, S4.1, S7.2, S9.6).
- The new S2.3 locators were read at the text:
  - LLM §3.1 is headed at LLM line 787. Lines 804–806 define w_max(i) as the unique Bruhat-maximal subword product, generated by a longest reduced subword. They are on page 20 of the author copy, which is p. 312 of the published article. The offset +292 matches the manifest's version note (Theorem 4 at line 263 is p. 299).
  - KnutsonBottSamelson page 4 begins at line 127, and §4 “The Bruhat order” begins at line 130. The chain is at lines 141–145 (R02).

**Adversarial table.** Rows marked “r15” are carried from the previous report (`PRREVIEW-SchubertGeometry_r15`) for statements this diff leaves untouched. The other rows were computed this round for the changed passages.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Tau Ceti sheaf operations: ranks (113–125) | E of rank r = 0, 1, 2; ∧ⁿ for n = 0…3 | dual rank r; rank of ∧ⁿE is C(2,n) = 1, 2, 1, 0; det rank C(r,r) = 1 for r = 0, 1, 2 (r = 0 gives 𝒪_X) | pass |
| Tau Ceti sheaf operations: locally constant rank | Spec(k×k), ranks (1,2) | det = ∧¹ on the first point, ∧² on the second, rank 1 on both; fixed-rank `determinant r` needs constant r | pass |
| Tau Ceti sheaf operations: “along every morphism” | elaborated signatures; f = id | no hypothesis on f in `pullbackDualIso`, `pullbackExteriorPowerIso` or `pullbackDetIso`; identity laws `pullbackDualIso_hom_id` (Dual/Pullback.lean:113), `pullbackExteriorPowerIso_hom_app_id` (ExteriorPower/Pullback.lean:87) | pass |
| Tensor comparison (126–128) | M quasi-coherent, N arbitrary; M arbitrary, N quasi-coherent | first case: :151 gives `IsIso δ`; second case: only :172 (`_right`) gives it, and the README names only :151 | R01(3) |
| Graded algebra (129–132; 507–509) | Sym(𝒪²) on Spec k; a grading whose degree-0 part is j_!𝒪_U | ranks of the components 1, 2, 3 (quasi-coherent), Proj = ℙ¹ (S6.1's values 1, 2, 3 in r15); j_!𝒪_U is not quasi-coherent, so `isGradedQuasicoherentAlgebra` excludes it | pass |
| S1.1 *Needs:* | E rank 3, ranks (1,2); exported determinant pullback | annihilator flag in E* has ranks (2,1), E* has rank 3, through `dual`; the determinant export needs `det` and `pullbackDetIso`, which the line does not name | R01(1) |
| S1.4 *Needs:* and Checks | k[ε]: line e₁+εe₃, plane ⟨e₁,e₂⟩; minor size 2 on F₁ of rank 1 | F₁ → E/F₂ ≅ k[ε]e₃ sends the generator to εe₃; ∧¹ is the map itself; ideal (ε) ≠ 0 while the reduced value is 0; ∧²F₁ = 0 since C(1,2) = 0, so no generators and ideal 0, not the unit ideal | pass |
| S2.3 δ(Q) (LLM characterisation) | Q = (1,2,1,2), (2,1,1) in A₂ | recursion s₁, s₁s₂, w₀, max(w₀, w₀s₂) = w₀; longest reduced subword (1,2,1), product w₀. Recursion s₂, s₂s₁, max(s₂s₁, s₂) = s₂s₁; both length-2 reduced subwords (positions {1,2}, {1,3}) multiply to s₂s₁ | pass |
| S2.3 chain (KnutsonBottSamelson) | (i,i); (1,2,1,2) | images point, X(s_i), X(s_i), growing at letter 1 only since δ(i)s_i = e < s_i; growing letters multiply to s_i versus ordinary e; for (1,2,1,2), growing letters 1, 2, 3 multiply to w₀ versus ordinary s₂s₁ | chain pass; label R02 |
| S3.1 *Needs:* | SL₂/B−; GL₂/B−; torus flag | L(ω) ↦ the degree-one generator of Pic(ℙ¹) ≅ ℤ; (a,b) ↦ a−b with kernel ℤ(1,1) = restrictions of X*(GL₂); point, Pic = 0, every character ↦ 1; codomain carrier `LineBundleClass` is not named | math pass; R01(2) |
| Scope (63–65) | S7.3 text (1547) | S7.3 constructs the flag-specific Chow-to-cohomology comparison only; no general Betti cycle map is claimed | pass |
| r15 · Lean thm 5 (decomposition) | SL₂ λ=μ=ω | minimal heights 0, −1 ≥ −1; right (e^(2ω)+1+e^(−2ω))+1; left (e^ω+e^(−ω))² = e^(2ω)+2+e^(−2ω) | pass |
| r15 · Lean thm 5 | SL₂ λ=ω, μ=2ω | heights 0, −1, −2; −2 fails ≥ −1; right char B(3ω)+char B(ω) = e^(3ω)+2e^ω+2e^(−ω)+e^(−3ω); left (e^ω+e^(−ω))(e^(2ω)+1+e^(−2ω)) | pass |
| r15 · Lean thm 5 | PGL₂ λ=μ=α | heights 0, −1, −2 ≥ −2; 5+3+1 terms = (e^α+1+e^(−α))² | pass |
| r15 · Lean thm 5 | SL₂ λ=0, μ=2ω | only the straight encoding has height ≥ 0; right char B(2ω); an endpoint-only test would add char B(0) | pass |
| r15 · Lean thm 5 | empty root system; λ=μ=0 | singletons; e^λ·e^μ = e^(λ+μ); 1·1 = 1 | pass |
| r15 · Lean thm 4 | PGL₂ λ=α; SL₂ λ=ω | (1−e^(−α))(e^α+1+e^(−α)) = e^α−e^(−2α) = J(e^α); e^ω−e^(−3ω) | pass |
| r15 · Lean thms 1–3 | SL₂ shape 2, straight path | H = 2t; lowering gives (s₁,1; 0,1/2,1) with endpoint 0, then (s₁; 0,1) with endpoint −2; raising reverses; three encodings reached by 0, 1, 2 lowerings | pass |
| r15 · S1.2 | S₃; torus; GL₃ | (123)⁻¹ = (132), twice (123); one point, dimension 0; 6 and 3 fixed points | pass |
| r15 · S1.3 | Gr(2,4) pivots (1,2), (1,3), (3,4); N = 0; k² pivot 2 | Σ(p_i−i) = 0, 1, 4 and \|λ\| = 4, 3, 0; point and empty; dim V∩F₁ = 0, V∩F₂ = 1 | pass |
| r15 · S1.5 | m = 1 | Q_src gives ω(u₁,f₁) = +1, Gram −J; native partner −f₁+cu₁ gives −1 | pass |
| r15 · S3.3 | m = 0, −1, −2, 1 | e^λ (1); 0 (0); −e^(λ+α_i) (−1); Δ_i(e^λ) = 0 against D_i = e^λ+e^(λ−α_i) | pass |
| r15 · S3.4 char 0 | SL₂ λ=ω | D_(w₀)e^ω = e^ω+e^(−ω) = char L(ω), with Δ = ∇ = L | pass |
| r15 · S4.1 Checks 1–4 | {tω, −tω}; −ω/2 then 3ω/2; kω then −kω; B(2ω) ∪ {c} | (ε,φ) = (0,1), (1,0); min −1/2, lowered endpoint −ω, min −3/2; ε = φ = 0 for every k ≥ 1; σ(fπ₀) = c but f(σπ₀) = π₁ | pass |
| r15 · S4.2 Checks | SL₂ straight; lower endpoint; GL₂ (t,t) | lowers to −tω (endpoint −1); H(1)−min H = 0 < 1, so f is undefined; height x−y = 0, strings 0 | pass |
| r15 · S4.3 Check 1 | bond 2 | 2·(1/2) = 1, 2·(1/3) = 2/3 | pass |
| r15 · S4.4 characters | PGL₂, SL₂, λ = 0 | J(1) = Δ gives char B(0) = 1; the unshifted alternant gives 0 at λ = 0 | pass |
| r15 · S5.6 | ℙ¹/ℤ; empty union; k[ε] chart | ranks 1, 2, 3 over ℤ, 𝔽₂, 𝔽₃; 0; ε ≠ 0 | pass |
| r15 · S6.1 | ℙ¹ O(1), O(2), O | 1, 2, 3; 3 in degree 1; 1 in every degree, Proj a point | pass |
| r15 · S7.2 | ℙ¹ O(m); Gr(2,4) X_(1) | m·[e]; p₂₄ = 0 gives the planes p₂₃ = 0 and p₁₄ = 0; X_(1) has dimension 3, X_(2,1) dimension 1 | pass |
| r15 · S8.1 | ℙ¹; point; Gr(2,4) | [O]−[O(−1)]: rank 0, χ = 1; ℤ with unit 1; six classes, each χ = 1 | pass |
| r15 · S8.2 | SL₂ | ℤ ⊗_(ℤ[z+z⁻¹]) ℤ[z^(±1)] = ℤ[z]/(z−1)², rank 2 = rank K₀(ℙ¹) | pass |
| r15 · S9.0 points and GAGA | 𝔸ⁿ (n = 0, 1, 2); G_m; doubled origin; O(−2) on ℙ¹ | point, ℂ, ℂ²; ℂ^× ⊂ ℂ an open embedding; non-Hausdorff; H⁰ = 0, H¹ = ℂ | pass |
| r15 · S9.6 | SU₂; torus; SU₃ | ℝP²: H⁰ = ℤ, H¹ = 0, H² = ℤ/2; point; χ = 2/2 = 6/6 = 1 | pass |
| r15 · S9.8 | SL₂ weight 1; 0; torus | O(1), degree +1; trivial line; one point | pass |
| r15 · Worked: type A | rows (1,0,2,0), (0,1,0,3) | minors 1, 0, 3, −2, 0, 6; 6−0−6 = 0; after the frame change p₁₂ = 2, p₃₄ = 12 | pass |

**Remarks on untouched text (no change asked).**
- S3.1's ampleness and global-generation targets (896) could name the native `IsAmple` (`LineBundle/Ample.lean:71`, a predicate on `LineBundleClass`) and `IsGloballyGenerated` (`LineBundle/GlobalGeneration.lean:139`).
- The scope sentence at 63–65 repeats itself: “Nor is … , which is not a target here”. It is the wording the previous report proposed, and it is true.

## Not verifiable

- Steinberg1975, Pittie1972, Jantzen and MehtaRamanathan1985 are uncertified and cited by locator only. The change touches none of their citations.
- Ownership against open pull requests was checked only through `scratch/overlaps.md` and the AlgebraicVectorBundles and StableReduction texts on main. The changed passages cite only Tau Ceti natives and roadmaps on main. The fully qualified names of the unchanged `Suggested.lean` were not re-searched across the open pull requests this round.

## Source issues

- **Error** in KnutsonBottSamelson at §4, proof of the “related result”, p. 4 (lines 141–148): the source says the letters where the images of initial segments grow form a reduced subword with the word's own product; it should be that they multiply to the Demazure product (for (i,i): s_i, not e), the statement itself following from the deletion condition; affects the proof.
