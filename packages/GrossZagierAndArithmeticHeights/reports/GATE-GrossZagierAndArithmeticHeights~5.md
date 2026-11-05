# GATE-GrossZagierAndArithmeticHeights~5: answers to human review

The review was made at `8c2b7e7` and raises six numbered findings. All six are correct, and all are repaired in commit `6e5a528e` on the PR branch. That commit touches only `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md`. `Suggested.lean` is unchanged, because no finding touches its single statement (`canonicalHeightRat_exists_unique`). The review's closing "Checked and found sound" list asks for nothing and is not numbered. Line numbers below refer to the README at `6e5a528e`.

## H01 (CBirkbeck) — applied

§7.25 item 3 (line 3417) used to say "both identities hold with 1 replaced by any g". It now states two identities for all g∈GL₂(F_v) at a good place:

- **Off E:** k_(φ_v)(g,y,u)=m_(r(g)φ_v)(y,u)·log N_v.
- **On E:** c_(φ_v)(g,·,·)=0 and d_(φ_v)(g,y,u)=2n_(r(g)φ_v)log N_v−c_(φ_v)(g,y,u)+(2log δ_v(g)+log|uq(y)|_v)r(g)φ_v=0. This is the source's definition at yuan-zhang line 4334, with δ_v(n(b)diag(α,β)κ)=|α/β|_v^(1/2).

It also says that the closed valuation formulas hold only at g=1, and gives the correct one for general g: n_(r(g)φ_v)=(½v(q(y))+v(α))r(g)φ_v. The outline now states the upper-triangular covariance, r(p)φ(x,u)=ψ(buq(x))|α/β|φ(αx,(αβ)⁻¹u) (disegni line 1297), before it invokes the Iwasawa decomposition. Two new Checks compute the reviewer's example g=diag(ϖ,ϖ⁻¹): n=N_v⁻², d=0, and 2N_v⁻²log N_v≠0 without the δ-term. They also compute g=diag(1,ϖ). §7.47 item 2 (line 3776) now cites the all-g identities with the δ-term and the R_f grouping (yuan-zhang line 4302).

## H02 (CBirkbeck) — applied differently

The missing interface is confirmed. At the HeightsRationalPointsAndObstructions head, §§0.22–0.24 define point-metric Weil and Néron functions of a single Cartier divisor, and the RP.0/RP.1 labels do not exist there.

§2.5 (line 793, now "Finite-place Néron symbol on curves") constructs ⟨a,b⟩_v=−[L_w:H_v]⁻¹(A·B)log q_w for degree-zero divisors on X over H̄_v. It owns:

- existence of the orthogonal ℚ-extension, by Zariski's lemma on the StableReduction Layer 4–5 intersection matrix;
- independence of L_w, of the model, of A modulo ℚ·F and of B;
- symmetry, biadditivity and the principal-divisor law (gz86 lines 151 and 1065);
- continuity with its logarithmic singularity, and uniqueness;
- compatibility with the §2.9 flat extensions as an API item.

It is "applied differently" because the construction is local rather than built from the global §2.9 extension. §7.19 takes limits y→x over points defined only over finite extensions of H_v, which a number-field model does not reach.

The rest of the repair:

- §2.11 gains the matching complex singularity law.
- §§7.19 and 7.37 now consume §§2.5, 2.11 and 2.12, with Mathlib `NumberField.prod_abs_eq_one` for the product formula.
- Every RP.0/RP.1 locator is replaced by the actual Heights targets: §§0.11–0.12, 0.16, 0.18–0.21 and 1.7–1.8. In §0.2 the label is replaced by the pinned Tau Ceti `Point.canonicalHeight_nonneg` and `Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder`.
- The supplier row (line 103) and Scope (line 15) are updated, and a StableReduction row is added (line 106).

## H03 (CBirkbeck) — applied

The §8.15 outline (line 5074) used to end "(f, f)_(R^×) = deg f". It now uses f₁, f₂ with the coefficient c=f₁∘λ_J⁻¹∘f₂^∨∈M, the idempotent e=λ_J⁻¹∘f₂^∨∘c⁻¹∘f₁ (e²=e) and the §1.1 adjunction. These recover ĥ_K(P_χ^φ) at the coefficient embedding of φ, and deg f is kept only for elliptic A (CST p. 5, cst line 249). §8.15's *Needs* now include §§1.1 and 3.6.

The same pattern needed one more fix. §3.6 (line 1233) wrote (f₁,f₂)_U for the volume-normalized pairing, which contradicts CST and §8.14, where (f₁,f₂)_U=f₁∘λ_J⁻¹∘f₂^∨. It now uses CST's notation: (f₁,f₂) is the normalized pairing, (f₁,f₂)_U=vol(X_U)(f₁,f₂), and (f,f)_U=deg f only in dimension one.

## H04 (CBirkbeck) — applied

§8.17 (line 5098) changes A_f(K) ⊗_ℚ M_f → (A_f(K) ⊗_ℤ ℚ) ⊗_ℚ M_f = A_f(K) ⊗_ℤ M_f, "selected by the coefficient projector". A search for other integral point groups tensored over ℚ found no other occurrence.

## H05 (CBirkbeck) — applied

§9.16 (line 5581) changes log_(ω_f) : J(X*)(K_v) ⊗ O → K_v to log_(ω_f) : J(X*)(K_v) ⊗_ℤ O → K_v ⊗_(ℚ_p) L = L. Here O ⊂ L are the coefficients of §9.15, completed at ι_p, and ω_f ∈ Ω¹(J(X*)/ℤ_p) ⊗_(ℤ_p) O, as in §9.8. A sentence in the hypotheses records that JSW print the codomain as K_v (jsw line 1361). The squared-logarithm formula is unchanged.

## H06 (CBirkbeck) — applied

§3.1 outline (line 1100): "R14 supplies the generic differential correspondence only" → ModularCurvesPartII §7.2 (`weightTwoRegularDifferentials`, S₂(Γ)≅H⁰(X,Ω¹) over ℂ) and §13.7 (dualizing-module lattices), with the bad-prime Néron comparison owned here. Both sections were checked at the ModularCurvesPartII head; no other R14 shorthand remains.

## Build and gate

- `lake build TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested` at `6e5a528e`: `Build completed successfully (8981 jobs).` The only warning is `Suggested.lean:38:8: declaration uses 'sorry'` (the single headline).
- Gate: `gate GrossZagierAndArithmeticHeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check (`gate --depcheck … --movable`): `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
- `roadmaps resolve` on the edited README: no cross-roadmap citations and no Lean names found nowhere.

## Signatures

`Suggested.lean` is unchanged, so no new `#check` file was elaborated. The elaborated type of `canonicalHeightRat_exists_unique` in `signatures.md` was compared with README §0.2. Both have K a field with `Height.AdmissibleAbsValues` and `DecidableEq`, W elliptic, and ∃! q : QuadraticMap ℚ (ℚ ⊗[ℤ] W.Point) ℝ with q(1 ⊗ P) = P.canonicalHeight. They agree, and no section binder is dropped.

## Ownership and citations

The finite-place curve Néron symbol was searched by object ("Néron symbol", "local height pairing", "local intersection", "Hriljac") with `roadmaps grep` over main and all 354 open heads. The search covered:

- HeightsRationalPointsAndObstructions at its head;
- ArakelovGeometryAndAbelianHeights at its head;
- TropicalAndBerkovichArithmetic at its head, whose §6.4 gives Chambert-Loir local heights of metrized sections, not the curve symbol.

None of these owns the symbol, so §2.5 is its owner. Of the five board packages, four were read (AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LogicAndDefinabilityInNumberTheory), with no hits. LawrenceVenkateshMethod's README could not be fetched, so that package was not checked.

Every new citation was checked at its head or pin:

- MetaplecticAutomorphicForms §5.9 `extendedSchwartzWeil`;
- GL2AutomorphicRepresentationsAndTransfer `R16.1/iwasawa-cartan`;
- ModularCurvesPartII §§7.2, 13.7;
- StableReduction Layers 4–5 on main;
- Mathlib `NumberField.prod_abs_eq_one` (`Mathlib/NumberTheory/NumberField/ProductFormula.lean` line 98) and Mathlib `Northcott`;
- Tau Ceti `Point.canonicalHeight_nonneg` and `Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder` (`TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean` lines 260 and 332).

No notion moved down, and no new supplier is later in the merge order.

## Sources

Every passage relied on is in the manifest: yuan-zhang, disegni, gz86, cst and jsw. No source was fetched and no `needs-references.toml` entry was written.

## Suspicious passages

None. The review links publisher PDFs as data, and nothing in it was treated as an instruction.

## Adversarial pass (changed or added statements)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 7.25(3) diagonal, split good v | g=diag(ϖ,ϖ⁻¹), y=1, u=1, φ standard | r(g)φ=q⁻²1_(ϖ⁻¹M₂(O)×O^×); 7.12(ii) upper sum (q−1)·(1/(q−1))·q⁻²=q⁻², same lower, half-sum n=q⁻²; formula (½·0+1)q⁻²=q⁻²; 2log δ=−2log q; d=2q⁻²log q−2q⁻²log q=0; without δ: 2q⁻²log q | old item 3 false; new holds | item 3 restated with δ-term; Check added |
| 7.25(3) diagonal, d(c) | g=diag(1,ϖ) | support v(u)=1, log\|u\|=−log q, 2log δ=+log q, n=½v(q(y))rφ, d=0; without δ: −log q·rφ | holds | Check added |
| 7.25(3) unipotent and compact parts | g=n(b); g=κ∈GL₂(O) | n(b): common factor ψ(buq(y)), δ=1, d(g)=ψ·d(1)=0; κ: r(κ)φ=φ, δ=1 | holds | covariance in outline |
| 7.25(3) off-diagonal | g=diag(α,β), y∈B(v)−E | m_(r(g)φ)(y,u)=\|α/β\|m_φ(αy,(αβ)⁻¹u); k(g,y,u)=\|α/β\|k(1,αy,(αβ)⁻¹u), derivative of \|α/β\|^(−s/2) times W_a(0)=0 adds 0; equal by item 1; α=β central: δ=1, y↦αy, u↦α⁻²u | holds | outline |
| 7.25(3) c(g)=0 | y∈E_v, good v | W°₀(s,g,u)=δ^(−s)r(g)φ₂(0,u) (W°₀(s,1,u)=1: inert remainder ∝ \|d q(j)\|−\|d q(j)\|^s=0); c=−log δ·r_Eφ₁·rφ₂(0)+log δ·rφ=0 | holds | outline |
| 7.47 item 2 | v∉S′ | δ_f(g_f)=Πδ_v(g_v), so R_f's 2log δ_f splits into the local 2log δ_v terms of d_(φ_v)(g) | consistent | item 2 restated |
| 2.5 value, sign | ℙ¹_(ℤ_p), a=(0)−(∞), b=(1)−(p) | (0̄·p̄)=v(p)=1, other pairs 0, (ā·b̄)=−1, value log p; f=(t−1)/(t−p): log\|f(0)/f(∞)\|_p=log p; +(A·B) gives −log p | holds; sign pinned | Check |
| 2.5 fibre correction | fibre C₁+C₂, C₁·C₂=2, C_i²=−2 | (ā·C₁)=1, (ā·C₂)=−1, V=½C₁ solves −2t+1=0; (A·b̄)=½, value −½log q; naive closure 0; symmetric choice B=b̄+½C₁ also gives ½ | holds | Check |
| 2.5 degree zero | b=(x′), deg 1 | (F·x̄′)=1, so A↦A+F changes value by log q | hypothesis needed | Check |
| 2.5 base change | ℚ_p(√p) | v_w(p)=2, q_w=p, −(A·B)log q_w=2log p, divided by 2 gives log p | invariant | Check |
| 2.5 degenerate | a=0; genus 0 | a=0 gives A∈ℚ·F, (F·B)=0, value 0; on ℙ¹ every degree-zero divisor is principal and value=log\|f(a)\| | holds | none |
| 2.5 uniqueness | difference δ of two symbols | δ vanishes on principal divisors and has no singularity, so it is a continuous homomorphism J(L)→ℝ from a compact group, hence 0; genus 0: J=0 | holds | outline |
| 2.11 singularity | m=1, m=0 | −2m·g_Ar(x,y) with g_Ar(x,y)=−log\|z(y)\|+O(1) gives m log\|z\|²; m=0 gives no term | holds | API bullet |
| 7.19 limit | r_A(m)=0; x simple in both | r_A(m)=0: no subtraction, the 2.5/2.11 symbol; ord·ord=1: ⟨a_y,b⟩−log\|g(y)\|_v converges by the 2.5 singularity law | holds | inputs rewired |
| 7.37 product formula | α∈H^× | Mathlib: (Π_w w(α)^(mult)))·Π_fin w(α)=1, complex mult 2 = squared \|·\|_v, so Σ_v log\|α\|_v=0 | holds | Needs |
| 8.15 projector | dim A=1; dim A=2, M=ℚ(√5) | e²=λ⁻¹f₂^∨c⁻¹(f₁λ⁻¹f₂^∨)c⁻¹f₁=e; dim 1: c=deg f (cst line 249); dim 2: c∈M, f₁↦[√5]∘f₁ multiplies c and the pairing by √5, ratio unchanged; a curve map X₀(N)→A of dim 2 has no degree | general statement needs c | outline restated |
| 3.6 notation | degree-d level cover | composition ×d, vol ×d, normalized unchanged; (f,f)_U=deg f for E matches §8.14's (f1,f2)_U=Vol(X_U)(f1,f2) | aligned | §3.6 statement and API |
| 8.17 carrier | torsion P of order n | P⊗1=n·(P⊗1/n)=0 in A⊗_ℤM_f; A_f(K)⊗_ℚ is undefined on a ℤ-module with torsion | fixed | statement |
| 9.16 codomain | L=ℚ_p(√5), ω_f=ω₁+√5ω₂ | log_(ω_f)(x)=log_(ω₁)x+√5 log_(ω₂)x∈L, not in ℚ_p unless log_(ω₂)x=0; L=ℚ_p: K_v-valued; torsion x: 0 | fixed | statement and source note |
| 3.1 supplier | ModularCurvesPartII §7.2 | S₂(Γ)≅H⁰(X,Ω¹) over ℂ with ω_f=2πif dτ (its §7.2); integral lattices in §13.7 | accurate | outline |
| 0.2 Needs | P torsion, P infinite order | Tau Ceti zero-iff-torsion needs `[Northcott canonicalHeight]`, matching §0.2's Check "under Northcott finiteness"; ĥ_ℚ(2⊗P)=4ĥ(P) | consistent | Needs |
