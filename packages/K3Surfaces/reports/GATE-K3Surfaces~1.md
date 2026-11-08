# GATE-K3Surfaces~1: answers to human review of TauCetiRoadmap/K3Surfaces (head c11a7c4 → 23b0674)

## H01 (roed-math) — applied

`TauCetiRoadmap/K3Surfaces/README.md` §0.2 now states the vector-field unirationality reduction as sub-target (U), for every algebraically closed field of characteristic p>0 with p=2 included (lines 269–278). Sub-target (i), ρ(X)=22 for a unirational K3, now has the binder "every algebraically closed field, of any characteristic" (line 280); before, both were only implicit inside the p>2 theorem. The Scope sentence (lines 24–33) changed from "K0.A owns … ; the Part II roadmap consumes them" to say that K0.A owns both, with binders wider than its vanishing theorem's and the Part II roadmap consuming both. The Conventions (line 47), the Layer 0 examples (line 332: the p=2 exponent, an abelian-surface negative control, vacuity of (i) in characteristic 0) and Downstream consumers (line 1017) match. The sources support both binders: huybrechts-k3 line 6797–6798 (Proposition 9.4.6, every p>0) and line 14076–14077 (Proposition 17.2.7, every algebraically closed field); Rudakov–Šafarevič 1976 §2 Theorem 5 and Corollary 1 (pp.1216–1217) have no restriction on p.

At the current head of K3SurfacesAndSymplecticBoundedness (c1d6da0, newer than the 3d48a98 head the comment cites), that roadmap already consumes (i) (its README lines 9, 74, 411, 858). It still proves the p=2 case of the reduction itself, "by the argument of K3Surfaces K0.A step 1" (lines 74, 406, 414). With this repair that roadmap's §2.1a should cite K0.A (U) at p=2 rather than rerun the argument; that edit belongs to that pull request.

## H02 (roed-math) — applied

The supplier table gains the row "PCurvature §§0.1–0.3" (line 108): Jacobson's formula, restricted Lie algebras, and the p-th power of a derivation of a commutative algebra, including Hochschild's formula and localization. Scope (lines 29–31) assigns those objects to PCurvature. A new paragraph, "Restricted structure on vector fields" (lines 213–266, with API bullets and five Checks), states the passage to global vector fields on a scheme as a target of this roadmap. That paragraph is built on the pinned Tau Ceti `AlgebraicGeometry.Scheme.relativeDifferentialsHomEquiv` and `AlgebraicGeometry.Scheme.Modules.Derivation` (TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean lines 72 and 101). It also states the p-closed-field lemma (Rudakov–Šafarevič 1976 §1 Lemma 1 and Corollary, pp.1206–1207), which step 1 now cites (line 280) in place of "the actual restricted p-power of derivations". PCurvature is an open new-roadmap pull request (#1747, head 7ff8fa7) and is not in ORDER.txt. The pull-request description's merge-order paragraph must therefore name it as a dependency; the worker makes that edit.

## Same defect elsewhere in §0.2

The search for other inputs that §0.2 uses without naming a supplier found two more, both now named in the text, the *Needs:* line (line 289), the supplier table (line 109) and Scope (lines 31–33):
- Case (b) uses "the norm along the finite flat π". ModularCurves §2B on main owns the norm functor on invertible sheaves (its README lines 685–687); the pins have none.
- Step 3 uses Ogg's formula in residue characteristic 3. NeronModelsAndSemistableAbelianVarieties §5.3e (the head of #852, earlier in the merge order) proves it in every residue characteristic over complete DVRs with perfect residue field.

## Build

`lake build TauCetiRoadmap.K3Surfaces.Suggested`: `Build completed successfully (9021 jobs).` The only warnings are `declaration uses 'sorry'` at Suggested.lean:51:8 and :74:8. Suggested.lean is unchanged this round. (U) and (i) are K0.A sub-targets, not headlines, and need ℙ²_k as a k-scheme (only `ProjectiveSpectrum` and `Scheme.RationalMap` exist at the pin) and the Néron–Severi group (absent at the pins).

## Signature check

I elaborated `#check @name` once, in one scratch file, for `IsAlgebraicK3`, `algebraicK3_differential_vanishing`, `discriminantGraph` and `gluing_isometry_extension_iff`. Each elaborated type matches its README statement: the vanishing theorem keeps `[IsAlgClosed k] [CharP k p] (2 < p)` and `IsAlgebraicK3 k X`, and the gluing theorem keeps both nondegeneracy instances, evenness, the anti-isometry hypothesis and the carrier equation. Nothing changed.

## Gate

`gate … K3Surfaces --base origin/main`:

    gate K3Surfaces: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
      depcheck: NOT IN ORDER: K3Surfaces (insert it after its last supplier)

The only failure is the design-stage placement case: the roadmap is not yet in ORDER.txt. The brief does not count that as a defect. An earlier run flagged `tex` for `Ω¹_{X/k}` at line 215; I rewrote it before the commit.

Prescribed direction check (`gate --depcheck … --movable`):

    NOT IN ORDER: K3Surfaces (insert it after its last supplier)
    depcheck: 239 roadmaps, 2362 edges, 1 problem(s)

Candidate placement (`gate --candidate TauCetiRoadmap/K3Surfaces/README.md …`):

    candidate: K3Surfaces is not in the merge order yet; checked as if placed after FourManifolds (the intake inserts it when its design is accepted)
    note: supplier IndexTheory of K3Surfaces is not in the merge order; it must be inserted before K3Surfaces
    depcheck: 239 roadmaps, 2362 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. The scanner does not report PCurvature, which is also outside ORDER.txt and must be inserted before K3Surfaces (see H02). `roadmaps resolve` on the README lists no cross-roadmap citation or Lean name found nowhere. Commit: `23b0674 K3Surfaces: review repairs (all-characteristic unirationality and rank-22 sub-targets; PCurvature restricted structure on vector fields)`. Not pushed.

## Ownership

- Restricted Lie algebras and the p-th power on `Der_R(A)`: PCurvature §§0.1–0.3 is the only owner. The pins have no restricted Lie algebra (grep of Mathlib and Tau Ceti). ReductiveGroups on main (line 1691) only uses a group's restricted Lie algebra.
- The passage to vector fields on a scheme: no owner on main or at any open head (search for restricted Lie, p-closed, p-th power of a derivation). This roadmap owns it because §0.2 is its consumer, and PCurvature's scope stops at `Der_R(A)`. PCurvature's Downstream consumers section already names K3Surfaces §0.2.
- (U) and (i): a search for "unirational" finds only this roadmap, #1375, and incidental mentions in #850, #1061 and #1313.
- No declaration of Suggested.lean takes the fully qualified name of a declaration in another roadmap.

## Overlaps

- `scratch/overlaps.md` lists IntegralLattices §0G, §5J and §6A as defined only at #1239's head. All three exist on main as labelled paragraphs (IntegralLattices README lines 568, 1597, 1643), so there is no dependency on #1239.
- No open pull request changes this roadmap.
- K3SurfacesAndSymplecticBoundedness: see H01 for the one change needed on its side.
- EnriquesSurfaces E1 consumes the §0.2 vanishing theorem, which is unchanged.

## Sources

No `needs-references.toml` was written: every text relied on is legally readable. The work is cited in the README as Rudakov–Šafarevič 1976, read from mathnet.ru in the sources cache. Its lines are 75–90 (§1, Lemma 1 and Corollary, pp.1206–1207) and 438–486 (§2, Theorem 5 and Corollaries 1–2, pp.1216–1217). This roadmap's `sources.toml` records only `liedtke-surfaces` and `huybrechts-k3`. The worker should add this text under the key K3SurfacesAndSymplecticBoundedness already uses for it, `rudakov-shafarevich-inseparable`. Huybrechts locators: huybrechts-k3 lines 6797–6798 and 6816–6818 (p.180), and 14076–14090 (pp.367–368). The review contained no suspicious instruction.

## Adversarial pass

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| p-th power on vector fields (definition) | 𝔸¹: ∂_x, x∂_x | ∂_x^p(x^n)=n(n−1)⋯(n−p+1)x^(n−p)≡0; (x∂_x)^p(x^n)=n^p x^n=n x^n; coefficientwise model gives x^p∂_x≠x∂_x | holds; wrong model excluded | Check 1 |
| Hochschild formula | f=x, D=∂_x (all p); f=x², D=∂_x at p=2 and 3 | x^p·0+x·∂_x=x∂_x; p=2: (x²∂)²=2x³∂+x⁴∂²=0 and RHS 2x³∂=0; p=3: n(n+1)(n+2)≡0 and RHS (x²∂)(2x³)=6x⁴≡0 | holds; dropping the correction gives 0≠x∂_x | Check 2 |
| global fields of ℙ¹ | ∂_t, t∂_t, t²∂_t; p=2,3 | in s=1/t: −s²∂_s, −s∂_s, −∂_s; (t²∂_t)^p(t)=p!·t^(p+1)≡0 (p=2: 2, p=3: 6) | both types occur | Check 3 |
| a field need not be p-closed | ℙ¹×ℙ¹, p=3, k=𝔽_9, c=i | D^[3]=t∂_t−i·u∂_u≠λD; (−iD−iD^[3])/(−2i)=(D+D^[3])/2=t∂_t | lemma needed; extraction formula correct | Check 4 |
| empty open, zero ring, characteristic 0 | Γ(X,∅)=0; ℚ[x]; p=2 | zero ring has characteristic 1, so a CharP-p requirement fails there; ∂²(x·x)=2 vs Leibniz 0; at p=2, 2=0 | binder p>0 needed; zero ring handled separately | Check 5, API bullet 1 |
| restricted Lie algebra laws on global fields | openwise transfer; 𝔸¹ laws | ad(D^[p])=(ad D)^p kills D, so iterates commute; scalar law (cD)^[p]=c^p D^[p], e.g. (2x∂_x)^[p]=2^p x∂_x=2x∂_x mod p | holds | API bullet 2 |
| p-closed lemma | n=0, n=1 with E^[p]=aE, a=0 and a≠0 | n=0 excluded by "some field nonzero" (p^0=1 fixed vector, zero); a=0: kernel vector; a≠0: k[x]/(x^p−a^(−1)x) étale (derivative −a^(−1)), p roots, p−1 nonzero with x^(p−1)=a^(−1) | holds | API bullet 4 |
| `relativeDifferentialsHomEquiv` use | Spec k[x], M=O | Hom(Ω,O)≅Der_k(k[x])=k[x]·∂_x | matches the pinned docstring (Basic.lean line 98) | Tau Ceti contract |
| (U), p>0 including 2 | p=2, 3; abelian surface; Fermat quartic in char 3 | canonical exponent p−1=1, 2 (both >0); A: H⁰(T)=k², c₂(T_A)=0 (no contradiction in (b)), b₁(A)=4≠0 so not unirational; Fermat quartic: H⁰(T)=0, (U) vacuous | holds; K3 hypotheses needed | Examples line 332 |
| (i), any characteristic | char 0; char 3 Fermat; b₂ count | char 0: σ pulls back to a nonzero 2-form on a blow-up of ℙ², which has h^(2,0)=0, so (i) is vacuous and consistent with ρ≤20; Fermat: ρ=22; 1−0+b₂−0+1=24 gives b₂=22 | holds | binder at line 280; Examples |
| p-closedness of the saturation | open where saturation = O_X·D | (fD)^[p]=f^p D^[p]+(…)D∈O_X·D since D^[p]∈{0,D}; map to T_X/L p-linear (Λ_p of sections of the rank-one involutive L lies in L) | holds | step 1 |
| norm in case (b) | degree 1 and degree p, M=ω_Y | Nm(π^*M)=M^⊗deg; π^*ω_Y≅O gives ω_Y^p≅Nm(O)=O; π flat over Y_sm (finite between regular schemes of equal dimension) | holds | case (b), supplier ModularCurves §2B |
| Ogg's formula in step 3 | I₀* in residue char ≥5; residue char 3 | 6=2+5−1; §5.3e covers residue characteristics 2 and 3 with perfect residue field (k algebraically closed) | holds | step 3, supplier NeronModels… §5.3e |
| Scope: Part II consumes (U) and (i) | #1375 head c1d6da0 | (i): consumed at lines 74, 411, 858; (U) at p=2: proved at line 406 | (i) holds; (U) needs a change in #1375 | reported under H01 |
| RS76 locators | page markers | Lemma 1 at cache line 75 is on p.1206 (page 3 = p.1207 starts at line 85); Theorem 5 at line 440 is on p.1216 (p.1217 starts at line 459); Corollary 1 at line 481 is on p.1217 | correct | References line 1051 |
| Lean context | `algebraicK3_differential_vanishing` | binder `[CharP k p] (2 < p)` with field k forces p prime; `IsAlgebraicK3` carries `[IsAlgClosed k]` | unchanged and correct | none |
