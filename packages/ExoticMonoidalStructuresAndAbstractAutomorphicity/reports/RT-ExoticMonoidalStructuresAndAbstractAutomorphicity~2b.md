<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1277#issuecomment-6482618910 -->
Red team round 2 pass b (claude) of 14b3171

Verdict: needs_changes

1. **F01** (P3) Four line locators point at neighbouring text, not the cited statement

   Location: `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:283` "(Dor23, Equation (2.2), p. 8; Remark 2.21, p. 17 (Dor23 line 768).)"; `README.md:373` "(Dor23, Definition 3.2 and Construction 3.3, pp. 19–20 (Dor23 line 967).)"; `README.md:962` "(Dor23, Proposition 4.19, p. 46; … (Dor23 line 2335).)"; `README.md:985` "(Dor23, Corollaries 4.21–4.22 … (Dor23 line 2357).)".

   Claim: each `(Dor23 line N)` is the line of the cited statement.

   Witness: Dor23 line 768 is Lemma 2.19 (p. 15), not Remark 2.21, which is Dor23 line 854 (p. 17). Dor23 line 967 is equation (3.1), the inverse convention π_R(g)=π_L(g⁻¹) that §2.2 explicitly does not use; the transpose convention (3.2) is line 969 and Definition 3.2 is line 976. Dor23 line 2335 is a display inside the proof of Proposition 4.16; Proposition 4.19 is line 2350. Dor23 line 2357 is the last line of Remark 4.20; Corollary 4.21 is line 2359.

   Repair: at `README.md:283` replace "(Dor23 line 768)" by "(Dor23 line 854)"; at `README.md:373` replace "(Dor23 line 967)" by "(Dor23 line 976)"; at `README.md:962` replace "(Dor23 line 2335)" by "(Dor23 line 2350)"; at `README.md:985` replace "(Dor23 line 2357)" by "(Dor23 line 2359)". Tested: each replacement line begins with the cited statement's label (Remark 2.21, Definition 3.2, Proposition 4.19, Corollary 4.21). The printed page numbers in all four citations are already correct and need no change.

2. **F02** (P3) The away-S decomposition is attributed to Completed/RestrictedProducts Layer 1; it is Layer 2

   Location: `README.md:13` "Completed/RestrictedProducts, Scope and ownership and Layer 1, owns coordinate maps, finite change of reference, reindexing and away-S decomposition"; `README.md:103` "Consume Scope and ownership, Layer 1 and Change of family and double cosets: … and the finite exceptional-set decomposition."

   Claim: Layer 1 of Completed/RestrictedProducts supplies the away-S (finite exceptional-set) decomposition.

   Witness: `Completed/RestrictedProducts/README.md:268` "### Layer 1: functoriality, change of family, reindexing"; `Completed/RestrictedProducts/README.md:305` "### Layer 2: packaging and the away-`S` decomposition", whose §2.2 constructs `restrictAway` and the decomposition.

   Repair: at `README.md:13` write "Completed/RestrictedProducts, Scope and ownership and Layers 1–2, owns coordinate maps, finite change of reference, reindexing (Layer 1) and the away-S decomposition (Layer 2)"; at `README.md:103` write "Consume Scope and ownership, Layer 1, Layer 2 and Change of family and double cosets: maps from eventually integral coordinates, finite changes of reference and reindexing (Layer 1), the finite exceptional-set decomposition (Layer 2)." The three `*Needs:*` lines that cite "Completed/RestrictedProducts Layer 1" (§6.1 and the Layer 6 and Layer 7 dependency paragraphs) only consume transports and need no change. Tested: the two supplier headings quoted above exist on main.

Two P3 findings (S01, S02). Every round-1 finding is repaired at this head and no repair introduced an error (see "Round-1 repairs verified" below).

## Round-1 repairs verified

Each earlier finding, checked at 14b3171:

- Pass a F01 and pass b F04 (idempotent coherence headline absent): **repaired**. `Suggested.lean:51–68` defines `UnitFreeTensor` (tensor on objects and morphisms, `tensor_id`, `tensor_comp`, `assoc`, `assoc_naturality`, `pentagon`); `Suggested.lean:75–82` states `idempotent_defect_eq_id` with `hdef`, `hl`, `hr` and conclusion `a.hom = 𝟙 P`, with `sorry`. The hypotheses agree letter for letter with GH11 diagram (3.1) at GH11 line 466–477 and diagrams (3.2) at GH11 line 483–499. I re-proved the statement by hand: with m₁ = θ∘(θ⊗1)∘((θ⊗1)⊗1) and m₄ = θ∘(1⊗θ)∘(1⊗(1⊗θ)), naturality of α in each variable plus `hdef`, `hr`, `hl` give m₄∘(short pentagon route) = a²∘m₁ and m₄∘(long route) = a³∘m₁; m₁ is invertible because θ is an isomorphism and tensors of isomorphisms are isomorphisms, so a² = a³ and a invertible gives a = id. The docstring (`Suggested.lean:8–9`) names the stated headline. README §5.1 (`README.md:679–704`) names both Lean names and carries three Checks on the structure and three on the theorem.
- Pass a F02 (restricted tensor attributed to the wrong suppliers): **repaired**. `README.md:13`, `README.md:99`, `README.md:804` and the `*Needs:*` lines of §6.1 (`README.md:819`), §9.2 (`README.md:1152`) and §11.2 (`README.md:1368`) cite AutomorphicFormsOnReductiveGroups §3.4, Restricted tensor products and finite corners. At the head of #1037 that heading is `AutomorphicFormsOnReductiveGroups/README.md:552` and its text supplies `RestrictedTensor(W,w⁰)` for a countable index set with nonzero references, `ofFinite`, `tprod`, `map`, `rescale`; the contract sentence at `README.md:99` restates exactly that (empty stage ℂ, finite index gives the ordinary tensor, zero reference excluded). AutomorphicFormsOnReductiveGroups is line 77 of the merge order; this roadmap is line 288.
- Pass a F03 (matrix Schwartz residual action unspecified): **repaired**. `README.md:1080` now fixes (γ·Φ)(m)=Φ(γ⁻¹m), (g·Φ)(m)=|det g|⁻¹Φ(mg⁻ᵀ), T={diag(a,1)}, the (23) exchange and Q. Recomputed: middle diag(a,1) acts by |a|Ψ(m,ay) (Dor23 line 780, equation (2.12)); Q(diag(a,1)·Ψ)=∫|a|Ψ(m,ay)|y|d×y=QΨ; third outer action Ψ(mg⁻ᵀ,y det g) gives Q(g·Ψ)(m)=|det g|⁻¹QΨ(mg⁻ᵀ); first outer action for rational γ gives |det γ|⁻¹QΨ(γ⁻¹m)=QΨ(γ⁻¹m). Checks: QΨ(0)=1 and Q(diag(π_v,1)·Ψ)(0)=∫1_{Ô×}(yπ_v)|y|d×y=q_v; E₀₁·u(π_v⁻¹)⁻ᵀ=[[−π_v⁻¹,1],[0,0]] ∉ E₀₁+M₂(Ô), value 0, against Φ(E₀₁g⁻¹)=Φ(E₀₁)=1.
- Pass a F04 (§2.4 and §9.3 Checks not discriminating): **repaired**. §2.4 (`README.md:434–435`): over 𝔽₃((t)) with e(t⁻¹)=ζ, W(g)=∫_U θ(u)⁻¹1_{GL₂(O)}(ug)du gives W(1)=1, W(u(t⁻¹))=θ(u(t⁻¹))W(1)=ζ, W(diag(t⁻¹,1))=0 since [[t⁻¹,b],[0,1]] is never integral; the inverse character gives ζ². The φ Check: for h∈GL₂(O) the middle action of wh⁻ᵀ fixes 1_{M₂(O)}1_{O×} (mirabolic phase e(by det m)=1 on integral data, |a|=1, w is the self-dual Fourier transform of the self-dual lattice M₂(O), the centre acts by Φ(d⁻¹m)f(d²y)), so φ(f⊗Ψ)(g)=1_{M₂(O)}(g⁻¹)1_{O×}(det g)=1_{GL₂(O)}(g). §9.3 (`README.md:1171–1173`): u=η_I∘ε_A gives u⋆f=m_I∘(η_I⊛id)∘(id⊛f)∘(ε_A⊛id)∘Δ_A=m_I∘(η_I⊛id)∘λ_I⁻¹∘f=f by the counit law, unitor naturality and the unit law; 2⋆ gives 2f. With f=1_A/a−1_B/b: p(f)=1_D−1_D=0, p(f²)=(1/a+1/b)1_D, for a=b=1 the pushforwards are 0 and 2·1_D; the fibre volume of ΓxJ over its determinant image is vol(J∩SL₂(A))/#(Γ∩xJ¹x⁻¹), independent of the J-translate because J¹=J∩SL₂(A) is normal in J.
- Pass b F01 (§§6.1 and 6.3 read as MetaplecticAutomorphicForms sections): **repaired**. `README.md:11` "This roadmap's §§6.1 and 6.3 own the restricted tensor triality kernel and its rational theta invariance."
- Pass b F02 (§10.4 locator at the forward mention): **repaired**. `README.md:1275` "(Dor21 line 1067; Dor21 line 1368)": Dor21 line 1067 is "Proposition B.5.4" (p. 25), line 1368 is "Theorem B.6.1" (p. 30).
- Pass b F03 (§10.1 torus action on 1_T unstated): **repaired**. `README.md:1209` "with T acting by ((a,d)·f)(x,y)=f(ax,dy)". Recomputed: ((a,d)·ηf)(λ,y)=|a/d|·|d⁻²λ²·ady|⁻¹f(aλy,dλ⁻¹)=|λ²y|⁻¹f(aλy,dλ⁻¹)=η((a,d)·f)(λ,y). Check 3 (`README.md:1226`): path one q⁻¹·q·1=1, path two f(π,1)=1; under f(a⁻¹x,d⁻¹y) path two is f(π⁻¹,1)=0 for the small indicator.

No repair introduced a new error: every passage quoted above was recomputed or compared with the source at the line cited.

## Verified sound

Counts. Suggested.lean declarations read: 2 of 2 (`UnitFreeTensor`, `idempotent_defect_eq_id`), with their elaborated types from the worker's signature scratch compared with README §5.1: all binders explicit, no section variables, no lost instance; no Lean was run (the brief forbids it). README targets read: 58 of 58 plus Conventions, Normalisation witnesses, the ten supplier subsections and the 16 gap sentences. Locators verified: 73 `(<source> line N)` locators resolved against the four cached extractions; 69 land on the cited statement or its proof, 4 are off by a few lines (S01); printed pages recomputed from the `=== page N ===` markers for 56 citations (Dor23 41, Dor21 15), all agree, plus GH11 Theorem 3.1.2 p. 10 (line 481) and Appendix A p. 15 (line 705), Dor20Z Theorem A.1 p. 25 and Claim A.3 p. 26. Checks tested with computed values: 56 (listed in the table). Sibling and library citations resolved: SmoothRepresentationsOfLocalGroups at the heads of #792 and #1688 (identical except one link): SR.0.1–SR.0.4, SR.0d.1–SR.0d.2, SR.1.1–SR.1.3, SR.2.1–SR.2.3, SR.3.2, SR.3a.1 with *jacquet-subrepresentation* and *admissibility-of-irreducibles* (countable Schur stated there), SR.4.1, SR.5.1 with *mirabolic-derivatives* (unnormalised Ψ±, Φ±, generic-character hypothesis, EH coefficient scope) and *derivative-exactness* (Φ⁻Φ⁺=Id and 0→Φ⁺Φ⁻→Id→Ψ⁺Ψ⁻→0), SR.5.2 with *segment-representations*; MetaplecticAutomorphicForms at #1063: §§0.15–0.18, 1.1, 1.3–1.4, 2.4b–2.7 (local field of characteristic ≠ 2, so dyadic and equal-characteristic fields are in scope), 4.1, 4.1a (function fields, char ≠ 2), 4.2–4.4; AutomorphicLFunctionsAndLocalFactors at #924: AL.0 "Local Schwartz–Bruhat spaces and finite Fourier levels" (line 644), AL.1 (number-field completions only, line 915–935, which is what gap:normalization-module-freeness extends), AL.2 "Godement–Jacquet standard functions" (line 1583), AL.3 "Curve additive analysis" (line 2447) and "Function-field local factors, multiplicity one and converse theorem" (line 2459), "Representation prerequisites, Restricted tensor realizations" (line 263); GL2AutomorphicRepresentationsAndTransfer at #931: R16.2.1 (characteristic zero, the four-class classification and the I(χν^{1/2},χν^{−1/2}) orientation the README repeats) and R16.2.8 (supercuspidal Kirillov); AutomorphicFormsOnReductiveGroups at #1037 §3.4; FunctionFieldArithmetic at #1474: §§0.1–0.3, 2.1–2.3, 4.8–4.10, 5.8, 6.1–6.4 (6.2 defines automorphic modules with a central lattice Ξ, which the README's §6.2 explicitly does not impose); AlgebraicVectorBundles on main L0B–L0C; EnhancedDerivedSheaves on main E5:presentability.2 with the target "Tensor products of presentable categories and module base change" (line 1674, stable/HA-based, which is why gap:ordinary-presentable-linear-tensor is needed); Completed/RestrictedProducts on main (S02). Mathlib at the pinned f6090c7: `Matrix.det_fin_two` Determinant/Basic.lean:809, `Matrix.trace` Trace.lean:43, `Matrix.trace_transpose` :71, `Matrix.trace_mul_comm` :156, `Rep.coinvariantsTensor` Coinvariants.lean:410, `CategoryTheory.SymmetricCategory` Braided/Basic.lean:366, `CategoryTheory.CommMon` CommMon_.lean:26, `CategoryTheory.Mod` Mod.lean:227; Mathlib has no unit-free or semigroupal monoidal structure (`MonoidalCategoryStruct` at Category.lean:86 carries the unit), so `UnitFreeTensor` is this roadmap's.

Ownership: `roadmaps grep` over main and the 410 open roadmap pull requests for unit-free/semigroupal/idempotent coherence, abstractly automorphic, triality, exotic monoidal or exotic tensor, theta characteristic or spin structure, Whittaker unit and degeneracy-free returns no owner of these objects (the hits are D₄ triality, Šilov idempotent theorem, topological Spin structures). No other Suggested.lean declares `TauCetiRoadmap.ExoticMonoidalStructuresAndAbstractAutomorphicity.*`.

Gaps: the 16 slugs of `design/plan.json` are the 16 contracts under "Exact supplier contracts" with identical `needs` sentences (compared mechanically); every supplier and section exists at the supplier's head; none asks for what a supplier, Mathlib or Tau Ceti provides (checked by object as listed above); gap:sl2-rational-unipotent-generation is true (SL₂(O_v) and SL₂(F_v) are generated by elementary matrices of uniformly bounded length, so SL₂(A)=⟨U(A),wU(A)w⁻¹⟩ with w∈GL₂(F)). The `plan.json` diff since the design (`58a1131`) touches only the `gaps` list.

Policy: `git diff --stat origin/main...HEAD` lists nine files, all under `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/`. README and Suggested.lean contain no pull-request number, process word, `lemma`, `set_option`, `#eval`, `#print` or `#synth`; the only `sorry` is the theorem's proof; the import is `import Mathlib` alone; every target has a locator; no computational algorithm. Build order: every `*Needs:*` line points to an earlier target or a supplier; the only forward mentions (§2.4 to §3.4, §3.1 to §3.5) are interface remarks, not `*Needs:*` edges.

Dependency check, run on this head:

```text
depcheck: 184 roadmaps, 1204 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Citation resolver: no cross-roadmap citation or Lean name found nowhere.

Headline inventory (from the Summary and layer introductions): rigidified triality lift; singular-stratum and Kirillov spectral theorems and local zeta comparison; Whittaker unit, trace, unit-centre theorem and degeneracy-free equivalence; spherical equivalence and joint generation; unit-free idempotent coherence; unique exotic associator; categorical Frobenius self-duality; generic idempotent algebras and local convolution; adelic monoidal structure, theta invariance and multiplication, global zeta; Poincaré image and the compact algebra I; fully faithful realization and matrix Schwartz automorphicity; spin coalgebra, convolution, section independence and ι; normalized induction, lax structure, localized unit and intertwiner; automorphic adjunction, Weyl lifting, components, irreducible comparison and finite length. Exactly one is statable at the pins and it is stated; the module docstring names each other family with the carrier it lacks. One-tactic probe: `idempotent_defect_eq_id` needs the pentagon, naturality in three variables and the three hypotheses (the hand proof above), so it is not padding; `UnitFreeTensor` is the one definition the headline needs and has a real body.

Declaration table:

| Declaration | Section, variable and instance context | Instances and values | Result |
|---|---|---|---|
| `UnitFreeTensor C` (structure, `Suggested.lean:51`) | §5.1; `C : Type u`, `[Category.{v} C]`; no section variables | Mathlib monoidal category with unit forgotten: all fields hold. Discrete ℕ with +: associators are identities, pentagon holds. Cantor pairing θ(x,y)=(x+y)(x+y+1)/2+y: θ(θ(0,0),1)=θ(0,1)=2, θ(0,θ(0,1))=θ(0,2)=5, no morphism 2→5, no `assoc`. Vect with associator cα: pentagon LHS c³, RHS c², so c=1 | admits the intended models, excludes the two wrong ones |
| `idempotent_defect_eq_id` (theorem, `Suggested.lean:75`) | §5.1; explicit `T`, `P`, `θ : T.tensorObj P P ≅ P`, `a : P ≅ P`, `hdef`, `hl`, `hr` | ℂ-line with θ(x⊗y)=cxy: both triple products c²xyz, a=1, a²=a³=1. Zero object: a=id. Cantor pairing on Set with cartesian tensor: a(0)=0, a(2)=5, θ(a(0),1)=2≠5=a(θ(0,1)), so `hl` fails and the theorem does not apply. Nonzero object with a=0: a²=a³ but a is not an iso, excluded by `a : P ≅ P` | true as typed; matches GH11 (3.1)–(3.2) |

Adversarial pass, one row per statement (values computed on each side; "source" means compared word for word at the locator):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions L, A, Z and witnesses | B on E₀₀/E₁₁ and E₀₁/E₁₀; w²; ν=1, h=diag(1,−π); 𝔽₃((t)) with e(t⁻¹)=ζ; C₂ averaging | 1, −1; (−I)·Ψ; h u(c)h⁻¹=u(−π⁻¹c) so hKh⁻¹∩U=u(π⁻¹O); e(t⁻²)=1 with t⁻²∉O so ν=0 and ker e ⊋ O; ((x+y)/2,(x+y)/2) | sound | — |
| 0.1 Determinant pairing | E₀₀/E₁₁, E₀₁/E₁₀, m=E₀₁, (1,2,3,4)·(5,6,7,8), 𝔽₂, ℤ[ε]/ε², zero ring, simultaneous transpose | au+dr−bt−cs=8+20−14−18=−4 (positive convention 60); B(E₀₁,E₀₁)=0=2det; Gram antidiag(1,−1,−1,1), reversal of 4 is even, det=+1; over 𝔽₂ B(E₀₀,E₁₁)=1, B(m,m)=0; tr(mᵀ)tr(nᵀ)−tr(mᵀnᵀ)=tr m tr n−tr(nm)=B(m,n) | sound; Dor23 line 496 | — |
| 0.2 Triality symplectic action | scalars aI,bI,cI; (13)²; (13)(g₁,g₂,g₃)(13); (π,π⁻¹,1), (π,1,1) | (abc)²=1; E₀₁↦E₁₀↦E₀₁; (g₁mᵀg₃ᵀ)ᵀ=g₃mg₁ᵀ, so conjugation swaps factors 1 and 3; multipliers 1 and π | sound | — |
| 0.3 Rigidified lift | identity triple; (13); σ³ | uniqueness from the abelianisation ℤ/2 generated by (13), Dor23 line 631; transpose squares to 1 | sound; Prop. 2.12 | — |
| 0.4 Triality kernel | (2.4) with g₂=[[a,b],[0,1]]; g₂=w; g₂=dI; outer (g₁,1,g₃) | diag(y,1)g₂diag(y⁻¹a⁻¹,1)=u(yb), phase e(yb det m), factor \|a\|, f(ay): equation (2.12); diag(y,1)w diag(y⁻¹,1)=w·diag(y⁻¹,y), m(y⁻¹) gives \|y\|⁻²Φ(y⁻¹m), Fourier gives \|y\|²∫Ψ(n,y)e(−yB(m,n))dn; w² with self-dual measure for yB: Ψ(−m,y), dropping both \|y\|² leaves \|y\|⁻⁴; centre: \|d\|²·\|d\|⁻²Φ(d⁻¹m)f(d²y), equal to the outer central action; outer Ψ(g₁⁻¹mg₃⁻ᵀ, y det(g₁g₃ᵀ)) is Example 2.14 verbatim | sound; Dor23 lines 571–610 | — |
| 0.5 Open kernel | Ψ=1_{M₂(O)}1_{O×} over 𝔽₃((t)); (m,y)↦(m,y det m) | values 1,1,0 at (0,1),(I,1),(t⁻¹I,1); (I,y)↦(I,y), (diag(π,1),y)↦(diag(π,1),πy); Lemma 2.19 image = support off {det·y=0} | sound | — |
| 1.1 Threefold balance | z=1, z=0; e_c twice | id, 0; e_c²=e_c; Lemma 2.17 | sound | — |
| 1.2 Singular comparison | V=1_G; E²₁,₀, E²₀,₁ | 1⊗_G S(F×)⊗_G 1=S(F×)_{F×}=ℂ≠0 so the hypothesis is needed; both outer actions on the zero stratum are y↦y det g, so SL₂ acts trivially on Q and on Tor₁(V,Q), hence Ṽ⊗_G Tor₁ is a quotient of Ṽ_{SL₂}⊗Tor₁=0; source (2.14) and the spectral sequence at line 848 | sound given gap:smooth-tor-residual-action | — |
| 1.3 Open integral | Ψ=Φ(g)f(y det g); ℂχ vs ℂχ² | μ=(∫βΦ)f; End dimensions 1 and 4; formula at Dor23 line 857 is ν(ṽ⊗Ψ⊗v)(y)=∫⟨ṽ,π(g)v⟩Ψ(g,det(g)⁻¹y)d×g | sound | S01 (locator) |
| 1.4 Kirillov extension | 𝔽₃((t)): ν(t), ν⁻¹(t); I(ν^{1/2},ν^{−1/2}); I(1,1) | 1/3 and 3; St sub and χ∘det quotient, the R16.2.1 orientation; ratio 1∉{ν,ν⁻¹}; target K(V(−1))(1) verbatim at Dor23 line 420 | sound | — |
| 1.5 Local zeta | uniformiser shell | \|π\|^{s−1/2}·\|π\|=\|π\|^{s+1/2}; exponents s+1/2 on det and s−1/2 on y, Dor23 lines 459–471 | sound | — |
| 2.1 IRL | diag(π,1); u(b); double transpose; (gh)ᵀ | ρ(diag(π,1)); u(b)ᵀe₁=e₁+be₂; identity; (gh)ᵀ=hᵀgᵀ so (v·g)·h=ρ(hᵀ)ρ(gᵀ)v=ρ((gh)ᵀ)v | sound; (3.2) | S01 (locator) |
| 2.2 Exotic product | M=0; swap twice; V⊛V′=V⊗_G Y⊗_G V′ | 0; identity; Dor23 line 2004 | sound | — |
| 2.3 Weak data | Vect, unitor cλ, c=2 | flip on ℂ⊗ℂ is id so cλ∘s=cλ; identity functor needs unit comparison 2 | sound; Def. 3.7 | — |
| 2.4 Whittaker unit | relation f(ug)−θ(u)f(g), action (π(h)f)(g)=f(gh); W_f; φ formula; Check 2 and 3 values | Construction 3.10, Remark 3.14 and Warning 3.13 verbatim; W(ug)=θ(u)W(g); (3.3) verbatim; 1, ζ, 0, ζ²; φ=1_{GL₂(O)} | sound | — |
| 2.5 Trace and symmetry | M=Iunit | Φ⁻(Iunit⊛N)=IRL(Iunit)⊗_G N=Φ⁻N, Remark 3.17 | sound | — |
| 3.1 Degeneracy-free | 1_G; St; 0→1→E→St→0; 1⊛1 | Φ⁻(1_G)=0 since 1−θ(u)∈ℂ×; Ext¹(St,1)≠0; Hom(E,1)=0; 1⊛1=(1_G over St) nondegenerate, Dor23 lines 1331–1337 | sound | — |
| 3.2 Bernstein modules | two blocks; (1,1,…)∈∏ℂ | e₁+e₂ unit; not finitely supported; firmness Z⊗_Z M≅M is Dor23 line 1310 | sound | — |
| 3.3 Unit and centre | f=id; z=0; ψ(f)_{Iunit} | s=id on Iunit⊛Iunit from λ∘s=λ; f⊛id=id⊛f there; λ∘(id⊛f)∘λ⁻¹=f by unitor naturality | sound; Claim 3.32 | — |
| 3.4 Enhanced adjunction | N=Z; one block; ⊕N_n | Iunit; e_dF(N)=0; finite support; Theorem 3.26 | sound | — |
| 3.5 Degeneracy-free equivalence | F(0), F(Z); St | 0, Iunit; excluded by Ext¹ | sound | — |
| 4.1 Spherical generator | ramified χ; k∈SL₂(O); diag(u,1) | χ(det k)=1; χ(u)≠1 kills K-fixed vectors; c-Ind_{SL₂(O)}^K 1=S(O×) via det | sound; Def. 3.36 | — |
| 4.2 Counit and comultiplication | well-definedness of f(u(b)hk)=e(b)δ₁(det k); ν=0,1 | u(b)hk=u(b′)hk′ forces b′−b∈π^{−ν}O where e=1; (1,δ₁), (q⁻¹,δ_{π⁻¹}); Constructions 3.44–3.45 verbatim (the source's "left-SL₂(O)-invariant, right-θ-equivariant" is reversed: Source issues) | sound | — |
| 4.3 Centre equivalence | Zsph↦E; End(c-Ind_K^G χ∘det) | E=⊕_χ c-Ind_K^G(χ∘det), each in the block [T,χ⊗χ] of χ∘det, endomorphisms the spherical Hecke algebra of that block; Theorem 3.42 | sound given gap:twisted-spherical-centre | — |
| 4.4 Joint generation | (Z,0)⊗(0,Zsph); ε | (0,Zsph); ε not in the product category; Corollary 3.51 at Dor23 line 1700 | sound | — |
| 5.1 Idempotent coherence | see the declaration table | a²m₁=a³m₁ with m₁ invertible | sound | — |
| 5.2 Exotic associator | pentagon on E; uniqueness | a² vs a³; Theorem 3.52 "unique extension" | sound | — |
| 5.3 Frobenius trace | Vect; zero object | Remark 3.54: Φ⁻∘⊛ is M⊠N↦IRL(M)⊗_G N, "perfect pairing" asserted without proof there; the coevaluation is an owned target | sound | — |
| 5.4 Generic idempotent algebras | general principle for 1↠X; χ∘det | K⊗X→X factors through K→1→1/K=X, so it is 0 and X⊗X=1/K=X; Hom(Iunit,χ∘det)=0 | sound; Example 3.55 | — |
| 5.5 Spherical invariants | A=Iunit; (1,1,…) | Remarks 3.56–3.57 verbatim; Z→Φ⁻A and Zsph→A^{SL₂(O)} commute | sound | — |
| 6.1 Adelic product | reference y_v; Claim 4.3 | y_v=1_{M₂(O_v)}1_{O_v×} at Dor23 line 1997; counit sends 1_{GL₂(O)} to the distinguished vector (source prints 1_{GL₂(F_v)}: Source issues) | sound | — |
| 6.2 Automorphic functions | balance of B; model of Dτ(S) | B(f·g,f′)=∫f(xgᵀ)f′(x⁻ᵀ)dx=∫f(y)f′(y⁻ᵀg)dy=B(f,g·f′); the function model has (g∗F)(x)=F(xg); integrand f(γg)f′((γg)⁻ᵀ)=f(g)f′(g⁻ᵀ) since γ⁻ᵀ∈Γ | sound | — |
| 6.3 Theta functional | (E₀₁,1)↔(E₁₀,1); rational q,b | a+b; \|q\|=1, e(bq det ξ)=1; Definition 4.5 and Proposition 4.9 | sound | — |
| 6.4 Theta multiplication | Construction 4.10 | m(Ψ)(g)=μ(g·Ψ) with the middle action, Dor23 line 2174 | sound | — |
| 6.5 Global zeta | ±1 patches; rational a | signed 0, absolute 2; \|a\|=1; Remark 4.11 formulas verbatim, W with θ(u) and volume one, Dor23 lines 2183–2208 | sound | — |
| 7.1 Poincaré map | rational u(b); U(F)\Γ | e(b)=1; Construction 4.15 sum verbatim | sound | — |
| 7.2 Petersson identity | q det ξ=1 | ∫_{A/F}e(x(q det ξ−1))dx selects q det ξ=1, Dor23 line 2344; Corollary 4.18 | sound | — |
| 7.3 Ideal | nonnegative compact indicator; I_Eis element | fibre integral >0; p=0 with CT≠0; Proposition 4.19 and its proof via Hom(Iunit,S(A×/F×))=0 | sound | S01 (locator) |
| 7.4 Algebra | id_I; epi cancellation | Corollaries 4.21–4.22, Remark 4.24 ⟨x,yz⟩=⟨xy,z⟩ and "not self-dual" | sound | S01 (locator) |
| 7.5 Ambient module | — | Corollaries 4.25–4.26, Remark 4.27 | sound | — |
| 8.1 Module objects | I; S | Remark 4.30 criterion verbatim | sound | — |
| 8.2 Realization | limits; duals; subquotients | Proposition 4.32, Remark 4.33; Dor21 Theorem A.1.1(1)–(4) at line 157 | sound | — |
| 8.3 Matrix Schwartz | m=0, g=diag(π_v,1); m=E₀₁, g=u(π_v⁻¹); rational γ | q_v=q_v; 0 vs 1; \|det γ\|=1; Example 4.35 S⊛S(A\G) with A={diag(a,1)} | sound | — |
| 9.1 Spin structure | ℙ¹, dt at ∞; ord ω=2k; s↦as | dual of π^aO under e_ω with conductor 2k is π^{−a−2k}O, self-dual iff a=−k; ord_∞ dt=−2 gives Λ_∞=πO; a²ω gives a⁻¹Λ | sound; Definition A.1, Remark A.3 | — |
| 9.2 Global coalgebra | unramified place | 1_{M₂(O_v)}δ₁ from Construction A.5; local q^{−ν}1_{M₂(O)}δ_{π^{−ν}} under middle diag(π^{−ν},1) becomes 1_{M₂(O)}δ₁ (δ_c(ay)=δ_{c/a}(y), factor q^ν) | sound as a construction target | — |
| 9.3 Spin convolution | ⋃_J I^J; u⋆f; f=1_A/a−1_B/b | J=SL₂(O_A)·K(N) is compact open so ⋃_J I^J=I^H; u⋆f=f; p(f²)=(1/a+1/b)1_D | sound; Construction A.7 | — |
| 9.4 Section independence | g=diag(π,1); det pushforward of ιf | \|det g\|⁻²=q², then q⁻²; p(ιf)(t)=\|t\|⁻²p(f)(t⁻¹) so ι preserves I; Remark A.8 exponent −2 verbatim | sound | — |
| 10.1 Normalization module | action; η; Weyl twist | Definition B.3.1 verbatim \|a/d\|F(d⁻¹λ,ady); B.2.8 verbatim \|a/d\|π(d,a); equivariance identity and Check values as in the repair verification | sound for f(ax,dy) | — |
| 10.2 Normalized induction | adjunction | Hom_G(W,i(Hom_T(L,V)))=Hom_T(rW,Hom_T(L,V))=Hom_T(L⊗_T rW,V), so r̂=L⊗_T r; Definition B.4.1, Remark B.4.2 (no √q) | sound | — |
| 10.3 Rank-one multiplication | μ: Ψ↦Ψ(diag(0,λ),y); (π,1) | Construction B.3.4 and Claim B.3.5 twist ((1,−1),(0,0),(1,−1)) verbatim; scalar q⁻¹ | sound | — |
| 10.4 Lax induction | i(\|a/d\|) | Example B.5.1 obstruction, Remark B.5.6; Theorem B.6.1, Corollary B.6.2 | sound | — |
| 10.5 Intertwiner | double composite | Theorem B.7.8(1) η⊗η(w), (2) trace, (3) unit; Proposition B.7.10 | sound | — |
| 11.1 Torus category | rational t with ρ(t)≠id | Definition C.3.1 and Remark C.3.2 (I_T-modules) | sound | — |
| 11.2 Automorphic adjunction | η_v at infinitely many places | Warning C.2.2/C.2.4: no global η; Theorem C.3.3, Remark C.3.5 r̂_aut=(r̂V)_{T(F)}, Claim C.3.7 constant term | sound | — |
| 11.3 Weyl lifting | S(uz,v)S(1,z); degrees; conjugation; 𝔽₃ stabiliser; geometric class field | D(uz,vz)+D(uz²,v)+D(v,uz²)+D(vz,uz) on both sides; N,N,2N and N,N−m,2N−m; h=\|a/d\|^{−1/2}f: q^{−1/2} at both pairs, +1/2 gives q^{1/2}, q^{−3/2}; (𝔽₃×)²=4; the class field of ⟨z₀⟩KF× with deg z₀=1 is geometric, and deg π_v=deg x forces π_v≡x in C | sound; repairs Lemma C.4.9 (Source issues) | — |
| 11.4 Components | I_Eis orthogonal complement | Proposition C.4.1 and proof (finite dimension at fixed level and bounded \|det\|); C_cusp as twists up to \|det\|^s, Dor21 line 2323–2326 | sound | — |
| 11.5 Decomposition | e(1−e) | 0; Theorem C.4.12 | sound | — |
| 11.6 Irreducibles | St-modules | St≅St⊛St, St⊛(1 over St)=0, St⊛(St over 1)=St, Lemma C.5.2; Eisenstein case cites [Lan79], hence gap:eisenstein-constituent-automorphicity | sound | — |
| 11.7 Finite length | length n | ≤2n; Theorem C.5.4 | sound | — |

## Not verifiable

- Suggested.lean was not elaborated here (the brief forbids Lean builds); the binder comparison used the worker's `signatures.md`, which shows no section variables and all binders explicit, and the repair report's `#check` run.
- §10.1's explicit formula for η is the roadmap's own; Dor21 line 1065 only says "canonical embedding". Whether Proposition B.5.4's almost-unit square and Theorem B.7.8's double composite hold with exactly this normalization is a proof obligation of §§10.4–10.5 (the README's proof route says it computes them); not recomputed.
- §1.2: neither Dor23 Lemma 2.20 nor the README fixes the modulus normalization of the rank-one stratum identification S(U\G)⊗_T S(U\G)≅S(rank one×F×); the statement is read as a vector-space isomorphism with Ṽ balanced as a right T-module, which is what §1.4 consumes.
- §9.2 lattice-adapted transports of ε_v and Δ_v at ramified places: construction targets by the README's own statement; the source has no formula to compare.
- §5.3 coevaluation and triangle identities, §9.4 multiplicativity of ι: owned targets; the source asserts them without proof.
- Arm67 is uncertified (paywalled) and cited by locator only; rational theta characteristics are a declared gap.
- The 16 declared gaps are contracts, not implementations.
- Ownership against open pull requests was checked by object through the search index (410 pull requests) and the sibling checkouts listed in the brief; pull requests without supplied files received no file-level comparison.

## Source issues

- **Error** in Dor23 at Remark 3.47, printed page 33 (Dor23 line 1626): the source says any h with hKh⁻¹∩U equal to the kernel of θ works; it should be the conductor lattice u(π^{−ν}O), since hKh⁻¹∩U is always u of a fractional ideal while ker e need not be one (𝔽₃((t)), e(t⁻²)=1); affects a stated result.
- **Misprint** in Dor23 at Construction 3.44, printed page 32 (Dor23 line 1571): the source says the distribution is left-SL₂(O)-invariant and right-θ-equivariant; with its own display f(u(b)hk)=e(b)δ₁(det k) it is left-θ-equivariant and right-SL₂(O)-invariant; affects nothing.
- **Misprint** in Dor23 at the proof of Claim 4.3, printed page 41 (Dor23 line 2035): the source says the counit sends 1_{GL₂(O)} to the distinguished vector 1_{GL₂(F_v)}; it should be the class of 1_{GL₂(O_v)}, the whole-group indicator having no compact support; affects the proof.
- **Misprint** in Dor23 at the Petersson pairing before Proposition 4.16, printed page 45 (Dor23 line 2271): the source integrates over GL₂(A); it should be GL₂(F)\GL₂(A), as the coinvariant description that follows states; affects nothing.
- **Misprint** in Dor21 at Theorem C.2.1, printed page 43 (Dor21 line 2035): the source says î: Mod(G)→Mod(T); it should be Mod(T)→Mod(G), as at line 2030; affects nothing.
- **Gap** in Dor21 at Remark C.4.5, printed page 49 (Dor21 line 2297): the source chooses a place of degree one; such a place need not exist, and a degree-one idele (which exists) suffices; affects the proof of Proposition C.4.6.
- **Error** in Dor21 at the proof of Lemma C.4.9, printed page 52 (Dor21 lines 2460–2463): the source says Chebotarev gives a place v with π_v equivalent to xy⁻¹ in F×\A×/K; that group is infinite and classes of nonpositive degree contain no place; it should pass through the finite quotient by a degree-one idele, large-degree classes and the convolution identity S(uz,v)S(1,z)=D(z,z)S(u,v)+S(uz²,v); affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "14b31712c823863ba972437afb65741674a56a93", "job": "RT-ExoticMonoidalStructuresAndAbstractAutomorphicity~2b", "model": "fable", "worker": "chris-x9"} -->
