# GATE-ChromaticHomotopyTheory~2: answers to human review

Reviewed head 5055602. Repairs are committed as 839e6dc1 on the pull-request branch (not pushed). There is one unanswered comment (roed-math, 2026-11-06T06:20:45Z) with five numbered points, H01–H05 in order. GeneralAlgebraicKTheoryPartII (#1742) has moved from 90bcf29, the head the comment links, to 7f6a44d. That commit answers the same overlap check from its side: §§4.15–4.16 now give only an existential bound, and a new §4.30a states the real Bott comparison. Every GeneralAlgebraicKTheoryPartII citation below is checked at 7f6a44d. HomotopySpheres (#1287) is checked at 52ebd6f.

## H01 (roed-math) — applied

At 7f6a44d, GeneralAlgebraicKTheoryPartII §4.15 states "there is an integer m≥2 … every admissible m satisfies m≥n+1". Its Scope paragraph (its README line 7) gives the sharp value m=n+1 to this roadmap. The README changes are:

- Scope (line 7): "the sharp connectivity applications retain GeneralAlgebraicKTheoryPartII §§4.15–4.16" → "GeneralAlgebraicKTheoryPartII §§4.15–4.16 own connective periodic vanishing and its suspension–loop preservation with an existential bound m; §4.3 below proves that m=n+1 suffices, using §4.2".
- GeneralAlgebraicKTheoryPartII contract: "including the sharp bound m=n+1" → "with their existential connectivity bound m≥n+1, whose sharp value m=n+1 is §4.3 below".
- The n=1 sharp-bound Check moves out of the supplier Checks into a new **§4.3 The sharp connectivity bound in periodic vanishing**.

§4.3 has three assertions, each with m=n+1:

- the space vanishing statement;
- the map statement at every basepoint;
- Σ∞Ω∞ preservation.

It also shows that the bound is optimal, using K(ℤ/p,n). Its route is lmmt Remark 2.12 (lmmt line 406):

1. Use the existential m to reduce to τ_≤(m−1)X.
2. Induct up the Postnikov tower with GeneralAlgebraicKTheoryPartII §4.14.
3. For each finite layer K(A_α,k) with k≥n+1, apply csy Theorem 5.3.5 (csy line 3930, the consequence in §4.2) directly to K(A_α,k)→*.
4. At height zero, use Hurewicz modulo Tau Ceti's Serre class `AddCommGrpCat.isKilledBySomePower` (DGFloer Layer 1 item 4).

This route does not need csy Theorem 5.4.4, which is the weak-ring theorem that lmmt cites.

The same defect had a second occurrence, which is also repaired. `gap:weak-ring-finite-postnikov` asked BordismFormalGroups F6.5, a supplier on main, for csy Theorem 5.4.4. That theorem's (1)⇒(2) step "follows from Corollary 5.3.7" (csy line 4045), which is §4.2 here. Its (2)⇒(3) step uses the Ravenel–Wilson computation, which is also §4.2 here. So that contract ran against the merge order, just like the bound GeneralAlgebraicKTheoryPartII used to state. The changes are:

- The contract is narrowed and renamed `gap:higher-ambidexterity-norms`. It now asks only for the generic Hopkins–Lurie norms and cardinalities (csy Definitions 2.1.13 and 3.1.5; csy line 682 and line 1632).
- Its weak-ring Checks are replaced by norm Checks.
- The weak-ring criterion becomes the owned target **§4.4 The weak-ring height criterion**. This is where the human-reviewed round GATE~1 had placed it.

## H02 (roed-math) — applied

At 7f6a44d, GeneralAlgebraicKTheoryPartII §4.30a (its README lines 1194–1210) states the comparison. Both ko→KO and A→A⊗_ko KO, for every E₁ ko-algebra A, are T(n)-equivalences for n≥1 (lmmt Corollary 4.19). Its §8.6 consumes that section. The README changes are:

- Layer 5 is deleted: its §5.1 target, Examples, Checks and Dependencies. It is not reduced to Checks, because no other target of this roadmap uses ko or KO, so the Checks would have nothing to check.
- The Scope bullet for GeneralAlgebraicKTheoryPartII now names §4.30a as the owner.
- Old Layer 6 becomes Layer 5, and §6.1 becomes §5.1.
- Supplier material that only Layer 5 used is removed: the TopologicalKTheory contract, HomotopySpheres §4B and the `abs` reference.

GeneralAlgebraicKTheoryPartII's Downstream consumers paragraph (its README line 2418) is now stale on three counts:

- It says "ChromaticHomotopyTheory Layers 0–6 import …, including §4.30a"; this roadmap now has Layers 0–5 and imports no §4.30a.
- It says "§4.30a supplies the real Bott comparison of its Layer 5"; Layer 5 is now the Galois layer.
- It says Part II imports §§5.2, 5.5 and 6.5; Part II now imports §§4.4, 5.2 and 5.5, not 6.5.

That line should be updated in that roadmap.

## H03 (roed-math) — applied

The repair takes the reviewer's second option. The level-N Galois section, §6.1 then and §5.1 now, proves every N≥1 by one argument. Its inputs are:

- EllipticCohomology E1/E3/E6's level stacks and deck-group descent;
- gap:elliptic-spectral-affineness;
- gap:spectral-ringed-sites.

The route never takes N=3 as input. Putting `gap:elliptic-level-three-galois` in its Needs would therefore list a dependency the route does not have. The changes are:

- That gap is removed from this README.
- So are `gap:elliptic-supersingular-at-two` and `gap:elliptic-supersingular-at-three`. No target here used them; only GeneralAlgebraicKTheoryPartII §8.8 consumes the three (its README line 2141).
- The EllipticCohomology Scope bullet (line 11): "The level-three Galois and the supersingular comparisons at 2 and 3 retain its named contracts" → "The faithful GL₂(𝔽₃)-Galois extension TMF[1/3]→TMF(3), which GeneralAlgebraicKTheoryPartII requests from EllipticCohomology E6 for its §8.8, is the case N=3 of §5.1 below; §5.1 proves every level N≥1 by one argument from the level stacks and does not consume that request or the K(2)-local supersingular comparisons at 2 and 3".
- The N=2/N=3 Check no longer refers to the gap. It now computes ℤ[1/2]⊗ℤ_(2)=ℚ against ℤ[1/3]⊗ℤ_(2)=ℤ_(2).

## H04 (roed-math) — applied differently

The reviewer's observation is correct. At 7f6a44d:

- GeneralAlgebraicKTheoryPartII §5.2 (its lines 1546–1562) treats only K(A)←K(τ≥0A)→TC(τ≥0A).
- §6.5 (its line 1743) is redshift for E∞ rings.
- Neither gap id appears anywhere in that README.

The changes are:

- `gap:bhls-purity-comparison` and `gap:bhls-bp-redshift` are no longer requests to GeneralAlgebraicKTheoryPartII. They become Part II's own targets, stated under Scope and ownership as **Fixed-point trace comparison (Part II)** and **BP model theorem (Part II)**, with unchanged content and locators.
- The supplier contract now consumes only §§4.4, 5.2 and 5.5.

The suggested alternative, stating them as hypotheses of the separation target, is not used. Both are theorems: bhls Theorem 6.2 with Corollary 6.3 (bhls line 2886 and line 2906), and bhls Theorem 5.4 with hahn-wilson Theorem B (bhls line 2300, hahn-wilson line 93). Taking them as hypotheses would make the Part II headline conditional, a weakened substitute for it. A search by object found no other owner. The searches were `roadmaps grep` over main and every open head for Lichtenbaum–Quillen, BP Adams actions, fp-type, Levy's theorem and ℤ-homotopy-fixed-point rings.

## H05 (roed-math) — applied differently

The fact is confirmed. HomotopySpheres §3B at 52ebd6f has 3B.1–3B.5: reduced words, the word filtration, the James map, the connected James equivalence and James–Hopf. The stable splitting appears there only in a Check (its README line 883).

The suggested fix, keeping the gap as stated, is not the right one here. No target of this roadmap uses the stable James splitting. The James application is GeneralAlgebraicKTheoryPartII §4.33, which requests the same gap itself (its README line 192). The changes are:

- `gap:stable-james-splitting` is deleted here.
- The HomotopySpheres supplier section is deleted with it; its other consumed item, §4B, went with Layer 5.
- The Scope bullet records that GeneralAlgebraicKTheoryPartII's James application requests the splitting from HomotopySpheres.

HomotopySpheres is now asked for the splitting by one roadmap instead of two.

## Build and gate

- `lake build TauCetiRoadmap.ChromaticHomotopyTheory.Suggested`: `✔ [8976/8976] Built TauCetiRoadmap.ChromaticHomotopyTheory.Suggested`, `Build completed successfully (8976 jobs).`
- Gate: `gate ChromaticHomotopyTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 239 roadmaps, 2357 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name that is "found nowhere". The tool did not check Lean names outside TauCetiRoadmap. The three library names added were checked by hand at the pins:
  - `TauCeti.SymmetricSpectrum`: `TauCeti/AlgebraicTopology/Spectra/SymmetricSpectrum.lean`, `namespace TauCeti`, `abbrev SymmetricSpectrum`.
  - `AddCommGrpCat.isKilledBySomePower`: `TauCeti/AlgebraicTopology/SerreClass/PowerTorsion.lean` line 33, with its `IsSerreClass` instance at line 44.
  - `CategoryTheory.ObjectProperty.IsSerreClass`: `Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean` line 45.

## Suggested.lean

The file still declares nothing, so the `#check @name` comparison has no declarations to check. Its docstring now matches the README:

- The real Bott item is removed.
- §6.1 becomes §5.1, without the "extending the supplied level-three case" clause.
- §4.3 (sharp bound) and §4.4 (weak-ring criterion) are added as headlines that cannot be stated at the pins.
- Part II names its two own inputs.

One earlier claim was wrong and is corrected. The docstring said spectra are missing at the pins, but Tau Ceti has the point-set `TauCeti.SymmetricSpectrum`. Its own docstrings say it has no stable model structure, and so no stable homotopy groups or derived smash product. The docstring and the README's Scope paragraph now say exactly that, and the items name "the stable homotopy category" as the missing carrier.

## Ownership, overlaps and sources

- The sharp bound, the weak-ring criterion and the level-N Galois theorem have no other owner. A search by object covered main, every open head (`roadmaps grep` for weak rings, semiadditivity, TMF(N)/TMF[1/N]) and EllipticCohomology E6 on main, which states level stacks and deck-group descent but no Galois extension. GeneralAlgebraicKTheoryPartII is earlier in the merge order and now explicitly cedes the sharp value.
- No other open pull request changes this roadmap. Only the GeneralAlgebraicKTheoryPartII prose noted under H02 cites this roadmap's layer numbers. This roadmap is new, so no roadmap on main cites a dropped id.
- No new source text was needed, so `needs-references.toml` is not written. New csy locators are Definition 2.1.13 (p.17; csy line 682), Lemma 5.1.12 (csy line 3705), Example 5.1.13(4) (csy line 3726) and Theorem 5.1.14 (csy line 3731), all in the cached text. In the package's `sources.toml`, which this job may not edit, two fields should change:
  - `abs` is no longer cited by the README.
  - csy's `cited_for` should add §4.3–§4.4.

## Adversarial pass

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §4.3 space vanishing, m=n+1 | n=1, p=2, X=K(ℤ/2,2); n=2, p=3, X=K(ℤ/3,3); X=*; X=ℂP∞ | K(1)-rank of K(ℤ/2,2) is 2^C(1,2)=1, so reduced 0; K(2)- and K(1)-ranks of K(ℤ/3,3) are 3^C(2,3)=3^C(1,3)=1; Σ∞*=0; ℂP∞ has π₂[1/p]=ℤ[1/p]≠0, so it is outside the hypothesis, and H̃₂(ℂP∞;ℤ[1/p])≠0 | Holds; the hypothesis is not vacuous | Target and Checks added |
| §4.3 optimality | K(ℤ/p,n) for n=1,2 | ranks p^C(1,1)=p and p^C(2,2)=p, so reduced rank p−1≥1; F6.3 gives ⟨K(n)⟩≤⟨T(n)⟩, so not T(n)-acyclic | m=n is not admissible | Stated with the target; n=1 Check |
| §4.3 at n=0, excluded | X=B(B(m,pᵏ)), free Burnside group with odd exponent pᵏ≥665 | π₁ is p-primary torsion, but H₂ is free abelian of infinite rank (Ivanov–Ol'shanskii), so H̃₂(;ℤ[1/p])≠0 | The statement fails at n=0 with m=1 | Kept n≥1, matching GeneralAlgebraicKTheoryPartII §4.15 |
| §4.3 height-zero hypothesis | X=K(ℤ/q,n+1), q≠p | T(i)⊗Σ∞X=0 for 1≤i≤n, since it is q-torsion and T(i) is p-local; π_(n+1)[1/p]=ℤ/q; H̃_(n+1)(;ℤ[1/p])=ℤ/q≠0; Hℚ-homology 0 | Distinguishes S[1/p] from Hℚ | Check added |
| §4.3 map statement | id; K(ℤ/p,n+1)→*; BC_p→* at n=1 | fiber *; fiber 2-connective, so an equivalence; fiber only 1-connective with reduced K(1)-rank p−1 | Holds; connectivity is needed | Covered by the Checks |
| §4.3 Σ∞Ω∞ preservation | Σ^(n+1)H𝔽_p→0; Σ^nH𝔽_p→0; id | Σ∞K(ℤ/p,n+1) is L_n^(p,f)-acyclic; Σ∞K(ℤ/p,n) is not T(n)-acyclic; zero fiber | n+1 is needed | Check added |
| §4.3 infinite torsion | K(ℤ/p^∞,n+1) | colimit of the K(ℤ/pʳ,n+1), each reduced T(i)- and S[1/p]-acyclic | Holds; needs the filtered-colimit step | Check added |
| §4.4 weak-ring criterion | R=Hℚ, n=0; R=H𝔽_p; R=T(i), 1≤i≤n; R=I_(ℚ/ℤ); R=0 | Hℚ: all four conditions hold. H𝔽_p: K(∞)⊗R≠0 and H̃_(n+1)(K(C_p,n+1);𝔽_p)=𝔽_p, so all fail. T(i): support {i}, so all hold. I_(ℚ/ℤ): support ∅, but F⊗I=I(DF)≠0, so condition 3 holds and condition 1 fails. R=0: all hold trivially. | The weak-ring hypothesis and j=∞ are needed | Target and four Checks |
| §4.4 (2)⇒(3) step | j=n+1<∞; j=∞ | reduced K(n+1)-rank of K(C_p,n+1) is p^C(n+1,n+1)−1=p−1>0; H̃_(n+1)(;𝔽_p)=𝔽_p | The contradiction is reached | Route stated |
| §4.4 condition 4 | f=K(C_p,n+1)→*; A→τ_≤nA | the first is an equivalence on τ_≤n with fiber K(C_p,n+1); the second has fiber A⟨n+1⟩, which is π-finite and n-connected. A map that is an equivalence on τ_≤n can have π_n(fib)=coker(π_(n+1)A→π_(n+1)B)≠0, so the route compares both A and B with τ_≤n instead of using fib(f) | Route corrected for that point | Route stated |
| Norm contract: two-point space | q:{a,b}→* | norm X⊕X→X×X; unit (diagonal), inverse norm, then fold gives id+id=2 | \|{a,b}\|=2 | Check |
| Norm contract: \|BC_p\| in Sp_ℚ | trivial C_p on ℚ | norm on π₀ is multiplication by p, so unit, p⁻¹, counit gives p⁻¹; with the norm instead of its inverse the composite is p; agrees with csy Lemma 5.3.3 at n=0, p^C(−1,1)=p⁻¹ | Pins inverse against norm | Check |
| Norm contract: H𝔽_p | trivial C_p | norm on π₀ is p=0, so B²C_p→* is not weakly 2-ambidextrous in Sp | Kept | Check kept |
| Power-torsion Serre class | ℤ/p and its extension ℤ/p² | ℤ/p² has exponent p², not p | The class "killed by a fixed power p" is not closed under extensions; isKilledBySomePower is | Stated in the Tau Ceti contract |
| Fixed-point trace comparison | A=Hℤ₂ with trivial ℤ-action at p=2, h=1; A=0; h=0 excluded | A^hℤ has π₀=π₋₁=ℤ₂. As an Hℤ-algebra, its K and TC are T(2)-acyclic by Mitchell, so 0→0. A=0 gives 0→0. At h=0 Mitchell does not kill height 1. | Holds; h≥1 is needed | Moved to Part II, content unchanged |
| BP model theorem | p=2, h=1, ku₂^∧ | U=cofiber of v₁⁴ on S/2 gives π_*(U⊗ku)=𝔽₂[v₁]/(v₁⁴), which is finite | fp-type 1 holds; fp-type 0 fails (S/2⊗ku) | Moved; the existing Check retained |
| §4.30a citation | A=ko, KO, 0; n=0 | ko→KO; identity; 0→0; π₋₈ko=0 against π₋₈KO[1/p]=ℤ[1/p] | Matches GeneralAlgebraicKTheoryPartII §4.30a | Scope bullet |
| §5.1 level check | N=1,2,3,5; 2-localization | \|GL₂(ℤ/N)\|=1, 6, 48, 480; ℤ[1/2]⊗ℤ_(2)=ℚ; ℤ[1/3]⊗ℤ_(2)=ℤ_(2) | Holds | Check reworded without the gap |
| §5.1 Example at p=3 | supersingular curve over 𝔽₉ | \|Aut\|=12 and \|Gal(𝔽₉/𝔽₃)\|=2, so the order is 24; TMF(3) inverts 3, so its K(2)-localization at 3 is 0 | Holds | "supplied" removed |
