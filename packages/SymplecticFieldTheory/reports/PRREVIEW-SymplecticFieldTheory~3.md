# Review of SymplecticFieldTheory (pull request #1054 at 6ffc8ff)

**Verdict:** accepted

Gate at this head: every check passed (`depcheck=0 build=0`). `lake env lean` on `TauCetiRoadmap/SymplecticFieldTheory/Suggested.lean` from the pull-request worktree gives exactly three `sorry` warnings (lines 72, 80, 93) and nothing else; the file is byte-identical to the one the previous review read (`git diff 8a8ce9d5 HEAD -- Suggested.lean` is empty). The pull request changes nothing outside the roadmap folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SymplecticFieldTheory'` is empty). The dependency check on the README as it stands:

```
depcheck: 204 roadmaps, 1418 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Three P3 notes (a misdescribed closed stratum, three Checks that put an automorphism in the wrong codimension, two locator slips); no blocking finding.

**The previous review's findings at this head.**

- R01 (Layers 4.1–4.2 plan the virtual-cycle engine that ImplicitAtlases plans; repair proposed: make ImplicitAtlases a supplier). The intermediate commit did that and the worker's gate refused it (`depcheck` UPWARD: ImplicitAtlases is #200 in the merge order, this roadmap #193). The head reverts to the brief's rule for a notion needed from a later roadmap: the notion moves down. Lines 59–73 now state that ImplicitAtlases owns the general engine, that nothing from it is consumed, and that 4.1–4.2 state the package "for the contact moduli problems only", each statement cited at the theorem of Pardon's 2016 paper that proves it (lines 854–899 cite Definitions 4.2.4–4.2.7, 6.2.2, 6.3.2, A.2.5, A.5.1, Lemma 4.3.2, 5.2.6, A.2.11, Propositions 4.3.3, 6.2.3, A.5.4, Theorem 4.3.4, Example 6.2.1, and the References list the paper at lines 1865–1870). Line 897–899: "nothing is stated for an arbitrary compact Hausdorff space with an implicit atlas". Repaired in the sanctioned form; the move is recorded under Verified sound. The one statement with no counterpart in ImplicitAtlases, the stratification by a finite category rather than a poset, is now a named target of 4.1–4.2 (lines 773–783, 880–892).
- R02 (degree of the Fock-level brackets l_k): repaired at lines 1405–1411 ("l_k has degree |H_Y|=−1 … for every k, because the normal-order representation preserves degree"), with the n = 2 witness as the fourth Check of 7.8 (lines 1421–1425) and the rational-bracket degree −1−(k−1)·2(n−3) cited to Latschev §2.1, p. 3, where the r-fold bracket map has degree d−2Nr (latschev22 line 96). Recomputed below.
- R03 (four Checks): 0.2 third Check (lines 288–293) now has exactly one eigenvalue in (−1,0) and its partner below −1, with the positive-hyperbolic and dimension-five controls; 7.3 third Check (lines 1257–1260) now says the master equation does not exclude p-free terms; 7.4 second Check (lines 1290–1292) has the minus sign; 6.3 fourth Check (lines 1134–1138) is the promised example (da=1, dw=0, dv=w, du=v−a·w with d²=0 and d₁²u=w≠0, recomputed below). Repaired.
- R04 (locators): line 510 (BEHWZ §10, Theorems 10.1–10.3, p. 51; Pardon Theorem 2.27, p. 34), line 1236 (Latschev §2.1, pp. 3–4), line 1615 (Latschev §2.4, pp. 10–11), line 268 (Definition 2.46, p. 41), lines 428 and 579 (Definition 2.36, p. 36), line 1035 ((1.11), p. 6), lines 477–478 (EGH Proposition 1.6.4, p. 16, Proposition 2.2.1(c) and (18), p. 48), lines 1275–1276 ((41) and the sentence following it, p. 57), and 4.2 cites Pardon 2016 at the statements §4.1 names. Repaired.

## R01 (P3) — The closed strata of M(T) are described as subsets of M(T); they are the spaces M(T′), which map to M(T) non-injectively

Location: `TauCetiRoadmap/SymplecticFieldTheory/README.md` lines 779–781: "The strata of M(T) are indexed by the category S_(/T) of tree types over T, whose objects are the degenerations T′→T and whose closed strata are the images of M(T′)/Aut(T′/T), in general not embedded".

Claim: the closed stratum attached to T′→T is the image of M(T′)/Aut(T′/T) in M(T).

Witness: pardon15 lines 943–946 define the closed stratum X_(/t) of a stratification by a category as the space of pairs (x, f_x: t_x→t), with the remark that X_(/t)→X "may fail to be injective"; lines 956–957: the closed stratum associated to T′→T "is naturally isomorphic to M(T′)" (the compactified moduli space of type T′), and lines 918–919 warn that (2.3) M(T′)/Aut(T′/T)→M(T) "is not always an inclusion". So the closed stratum is M(T′) itself, a space with its own stratification by S_(/T′), not a subset of M(T): in Pardon's Figure 8 (lines 947–952) the closed stratum of the three-vertex tree is two points whose image is one point. An image carries neither the restricted atlas (M(T)_I)_(/T′) nor the boundary that lines 825–826 and 880–882 use ("each closed stratum M(T)_(/T′) inherits the restricted atlas … from the thickenings (M(T)_I)_(/T′)"; "the virtual complexes of the closed strata relative to their boundaries"), so the sentence contradicts the roadmap's own later use, which follows Pardon.

Repair: replace "whose closed strata are the images of M(T′)/Aut(T′/T), in general not embedded" by "whose closed stratum M(T)_(/T′) is the compactified moduli space M(T′) itself, stratified by S_(/T′), with the natural map M(T′)/Aut(T′/T)→M(T) which need not be injective (Pardon §2.4, pp. 23–24, and Figure 8)".

## R02 (P3) — Three Checks place a tree automorphism Aut(T′/T)=ℤ/2 in a codimension-one degeneration, where it is trivial

Location: `TauCetiRoadmap/SymplecticFieldTheory/README.md` lines 845–848 (4.1, fourth Check: "For a degeneration T′→T of codimension one whose two lower vertices are identical, Aut(T′/T)=ℤ/2 (Pardon Figure 6, p. 20)"), lines 922–927 (4.2, third Check, the same degeneration, "the face then contributes half of its own class to the boundary, the factor 1/|Aut(T′/T)| of (4.23)"), lines 958–959 (4.3, second Check: "A codimension-one face with a tree automorphism of order 2 enters the boundary identity with the factor 1/2").

Claim: a codimension-one degeneration can have Aut(T′/T)=ℤ/2 by exchanging two identical lower vertices.

Witness: codim(T′/T)=vdim T−vdim T′ and codim(T′/T)>1 iff T′→T factors nontrivially (pardon15 Lemma 2.44, lines 1661–1663), so a codimension-one morphism contracts exactly one interior edge e. An automorphism of T′ over T (Definition 2.3, lines 806–808: an automorphism φ of T′ with f∘φ=f) is then the identity on vertices, since f is injective off the two endpoints of e and those are the source and the sink of a directed edge, which a directed-tree automorphism cannot exchange; it is the identity on external edges because f is a bijection E_ext(T′)=E_ext(T) (line 683) and its marker paths must compose to those of f. So Aut(T′/T)=1 in codimension one and the factor in (4.23) is 1. Figure 6 (lines 804–805) exchanges "the lower two vertices of T′", which both collapse into one vertex of T: two edges contracted, codimension two. Computed instance: T one vertex, T′ the fork with top vertex v₀ and two identical lower vertices v₁, v₂; codim(T′/T)=2, Aut(T′/T)=ℤ/2; the two codimension-one intermediates T′→T″ (collapse either lower edge) are the two morphisms exchanged by the automorphism, which is why the closed stratum M(T″) meets M(T′) in two points over one point of M(T) (Figure 8). A codimension-one face with a factor 1/2 arises only from the junction marker group Aut({T₁,T₂}/T₁#T₂)=ℤ/d_γ of (4.24) for a doubly covered edge orbit (lines 808–810, 2653), which is not a tree automorphism over T.

Repair: in 4.1 and 4.2 make the degeneration codimension two (the fork of Figure 6), say that its stratum enters the category-stratified complex through the ℤ/2-invariants of C_vir(M(T′)) and that its two codimension-one faces are exchanged by the automorphism; add the control "every codimension-one degeneration has Aut(T′/T)=1, so the factor of (4.23) is 1 and a poset would already see the codimension-one faces". In 4.3 replace "a tree automorphism of order 2" by "a junction edge along a doubly covered orbit, Aut({T₁,T₂}/T₁#T₂)=ℤ/2 in (4.24)".

## R03 (P3) — Two locators

Location: `TauCetiRoadmap/SymplecticFieldTheory/README.md`.

- Line 783: "Definition 2.13 and (2.5), p. 23". Definition 2.13 is on p. 23 (pardon15 line 902); the stratification (2.5) is on p. 24 (line 954). Correction: "Definition 2.13, p. 23, and (2.5), p. 24".
- Lines 818–820: "the normal identifications of (3.1)–(3.3) (Pardon §3.2, Lemmas 3.5–3.6, p. 47)" for the stratification of M(T) by S_(/T). (3.1)–(3.3) (lines 1936–1939) are the dimension function and orientation data on the under-category S_(T/) that stratifies the local models G_(T/); the data on S_(/T) for M(T) are induced from them through the local models of §3.8 (Theorems 3.31–3.32, pp. 57–58). Correction: "the dimension and orientation data of S_(/T) induced from those of the local models, (3.1)–(3.3) on S_(T′/) (§3.2, p. 47), through the local structure theorems of §3.8".

## Verified sound

**Principles.** No route-specific shortcut: the contact construction is over ℚ for every closed cooriented contact manifold with nondegenerate orbits and tame cylindrical J (lines 99–113), as in Pardon's Setups I–IV. No roadmap is re-planned: ContactGeometry, HeegaardFloer, DGAInfinity, StablePeriodicCurved, MorseTheory and MorseNovikov are imported by section; the ImplicitAtlases overlap is the brief's move (below). No copied passage: 4.1 and 4.2 paraphrase Pardon Definition 3.2 and §4.1 clause by clause in the README's words (compared against pardon15 lines 1889–1932 and 2462–2628). No algorithm, no sorry'd data, no `set_option`, no `lemma`; the only import beyond `Mathlib` is `TauCeti.Algebra.Module.GradedModule.Internal`, present at the pin. Grep of the README for process words ("so far", "removed", "upstream", "proposal", "when available", "round", "checkpoint", pull-request numbers): none.

**The move recorded.** ImplicitAtlases (#974, merge order 200) states the virtual-class engine for an implicit atlas on an arbitrary compact Hausdorff space, stratified by a finite poset (its README line 685), and names SymplecticFieldTheory as a consumer (lines 25 and 853). SymplecticFieldTheory is #193, so it cannot cite ImplicitAtlases, and the worker's gate refused the head that did. Following the brief, Layer 4.2 states the package it needs as its own target, restricted to the contact atlases of 4.1 (lines 854–899), cited to Pardon 2016 at the statements Pardon's 2015 review names, and the stratification by a finite category with poset undercategories (Pardon Definition 2.15, §3.1) is a genuinely new statement with no counterpart in ImplicitAtlases. The two roadmaps therefore both construct the virtual cochain complex, the Čech comparison, the subatlas quasi-isomorphisms, the stratified complex and the product map on the contact instance; ImplicitAtlases remains the owner of the general statements, and the Scope paragraph says so (lines 69–72). The cleaner state, ImplicitAtlases before SymplecticFieldTheory in the merge order with 4.2 becoming citations of ImplicitAtlases §§2.3, 3.4, 4.3, 6.3, 6.5, is a merge-order decision for a human, not a finding. Supplier-vocabulary grep (`roadmaps grep -i 'cell-like|stratified virtual|category-stratified'`): hits in this roadmap and ImplicitAtlases, and as consumers of ImplicitAtlases V0–V6 in AnalyticStableMaps, DGFloer (open and on main) and HamiltonianFloerOperations (on main); no second owner of the category-stratified complex.

**Gate, build and order.** `gate.md`: every check passed. Depcheck quoted above. ORDER.txt: SymplecticFieldTheory 193, ImplicitAtlases 200, GromovWittenTheory 284; neither later roadmap is on a `*Needs:*` line or a supplier heading (grep). The 44 `*Needs:*` lines name only Layers of this roadmap, ContactGeometry CG2/CG4, HeegaardFloer §§2.2, 3.1–3.5, 4.1, 4.3–4.5, DGAInfinity Layers 0–1, StablePeriodicCurved Layer 3, MorseTheory M1, MorseNovikov N1, Mathlib and Tau Ceti declarations.

**Supplier citations resolved on main** (as in the previous review, unchanged content): ContactGeometry CG1, CG2, CG4 (`ω=dθ=−dλ`), CG6 in `TauCetiRoadmap/SymplecticGeometry/ContactGeometry/README.md` lines 59, 75, 121–126, 242; HeegaardFloer §2.2 = F0.0 (line 1222), §3.1–3.5 = F1.1–F1.5 (1818–1982, the small-rotation witness at 1960–1970 and the punctured Riemann–Roch sign at 2022–2029), §4.1 = F2.1 (2081), §4.3–4.5 = F2.3–F2.5 (2259–2282); DGAInfinity Layers 0–1 (lines 263, 293); StablePeriodicCurved Layer 3 (273); MorseTheory M1–M6 (90–649); MorseNovikov N1 (75–77); HamiltonianFloerOperations line 22 names this roadmap as the owner of contact/Reeb buildings.

**Pinned declarations opened.** `CategoryTheory.cechComplexFunctor` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean` line 65), `Representation.invariants` (`Mathlib/RepresentationTheory/Invariants.lean` line 73; a `Submodule k V`, for any group, so the README's "finite group" is a restriction of use, not of the declaration), `TauCeti.InternalGrading` with `piece : ℤ → Submodule R M` and `isInternal` (`TauCeti/Algebra/Module/GradedModule/Internal.lean` lines 85–89); `TensorAlgebra`, `RingQuot.mkAlgHom`, `SymmetricAlgebra`, `GradedTensorProduct`, `Int.negOnePow`, `TauCeti.IsDGAlgebra`, `gradedTensorGrading`, `isInternal_gradedTensorGrading`, `gradedTensorLift`, `isDGAlgebra_gradedTensorGrading`, `dgTensorLift`, `GradedAlgebra.quotientPiece`, `isInternal_quotientPiece` as located by the previous review (files unchanged at the same pin).

**Signatures.** A scratch file with the seven declarations and `#check @name` for each was elaborated with `lake env lean`; the seven elaborated types agree with the worker's `signatures.md` and with the README's 0.3 and 0.5 statements (internal ℤ-grading on a ℚ-module, ℚ-linear maps, hδ into the piece of degree p+1, the Leibniz rule for homogeneous a and arbitrary b, `Int.negOnePow` elaborating as (−1)^natAbs). No binder lost; nothing changed.

**Padding probe.** On the same scratch copy each sorried theorem was tried with `first | infer_instance | exact ⟨inferInstance⟩ | rfl | simp | aesop | simp [LinearMap.ext_iff] | decide`: `nonempty_gradedAlgebra_signedSymPiece` fails ("expected type must not contain free variables" for the instance search, no other tactic applies), the other two leave their goals unsolved. None is padding. The three are the only headline statements statable at the pins; the docstring names the unstatable ones with the missing carriers (contact structures, Reeb fields, punctured maps with Reeb asymptotics, virtual counts), which neither library has.

**Sources read** (arXiv texts in the worker's cache; printed page = arXiv page): pardon15 (1508.03873v4), pardon16 (1309.2370v6), egh00 (math/0010059v1), behwz03 (math/0308183v3), latschev22 (2212.01814v1), hindsiegel24 (2410.19936v1), ishikawa18 (1807.09455v3). The seeded sample:

- 0.1: BEHWZ §2.3, p. 6 (behwz03 lines 200–208: periodic trajectories counting multiples, nondegeneracy of the return map including multiples); EGH §1.2, p. 5 (egh00 lines 221–227). Supports the statement.
- 1.4: BEHWZ §7, pp. 35–37 and §10, Theorems 10.1–10.3, p. 51; Pardon §2.9, p. 29 (line 1166), §2.10, p. 32 (line 1292), Theorem 2.27, p. 34. Supports the statement.
- 1.5: Pardon §1, p. 1 (lines 25–34: the smaller compactification, no trivial cylinders, codimension-one strata in bijection with the master-equation terms); §2.1, p. 16 (line 645); §2.4, p. 23 (line 920); §§1.4–1.5, pp. 6–7 (lines 237, 272). Supports the statement.
- 2.1: Pardon §2.11, p. 34 (line 1393); Definition 2.34, p. 35; Definition 2.36, p. 36. Supports the statement.
- 2.2: Pardon §2.6, p. 26 (line 1048), §2.7, p. 27 (line 1091), §2.14, p. 44 (line 1810). Supports the statement.
- 4.1: Pardon §3.1, Definition 3.1, pp. 45–46 (lines 1855–1888: final object, finite, poset undercategories, dim non-decreasing with equality iff isomorphism, orientation lines along isomorphisms, codimension-one normal identifications); Definition 2.15, p. 23 (line 927); Definitions 2.2–2.3 and Figure 6, p. 20 (lines 799–810); Definition 2.13, p. 23 (line 902); Definition 3.2, pp. 46–47 (lines 1889–1924, data (i)–(vii), compatibility (i)–(v), transversality (vi)–(x), each clause matched); Definition 3.3 and Remark 3.4, p. 47 (lines 1925–1932, including virtual dimension and orientation line of the final object); §3.3 Definitions 3.9–3.12, pp. 49–50 (lines 2059–2094: r_α, E_α=ℝ^(n_α) with S_(r_α), D_α compact codimension two, ν_α equivariant); §3.4 Definitions 3.13–3.16, pp. 50–52; §3.5 Definitions 3.17–3.22, pp. 52–54; §3.6, p. 55 (lines 2317–2328); Theorem 3.23, p. 55 (lines 2329–2332: covering axiom from §3.7, openness and submersion from §3.8); Definition 4.4, p. 63 (line 2667, effective objects; |S_(/T)| finite by that restriction, line 3117); §4.1.3, p. 60 (lines 2550–2553); Lemma 2.44, p. 40. The two slips are R03; the closed-stratum sentence is R01.
- 4.2 (every statement, against pardon15 §4.1 and pardon16): (4.1) line 2472 with Definition 4.2.4 (pardon16 line 1502, p. 36); (4.2)–(4.3) lines 2478–2480 with Definitions 4.2.5–4.2.6 (lines 1507–1537, pp. 36: homotopy colimit over I⊆J⊆A, pushforward on the p=0 part); (4.4) line 2482 with Theorem 4.3.4 (line 1623, p. 39); (4.6)–(4.7) and footnote 5 lines 2498–2514 with Definition 4.2.7 (line 1542, p. 37); the direct limit lines 2505–2507; Lemma 4.2 line 2508 with Lemma 5.2.6 (line 1806, p. 43); (hSh1)–(hSh3) lines 2521–2525 with Definition A.2.5 (line 5141, p. 117); (4.8)–(4.9) lines 2531–2533 with Definition A.5.1 (line 5460, p. 124); Proposition 4.3.3 line 2542 (pardon16 line 1608, p. 38) and Lemma 4.3.2 (line 1591, p. 38); (4.10) with Proposition A.5.4 (line 5477, p. 124); (4.12)–(4.15) lines 2559–2594 with Definition 6.2.2 (line 2100, p. 49), Proposition 6.2.3 (line 2130, p. 50), Example 6.2.1 (line 2066, p. 49), Lemma A.2.11 (line 5176, p. 118), and the remark that the poset argument "applies without modification" to categories (lines 2570–2572); (4.16)–(4.17) lines 2598–2603 with Definition 6.3.2 (line 2160, p. 51); Lemma 4.3 and (4.18)–(4.19) lines 2607–2628; (4.23) line 2652, p. 63. Every page agrees; every statement is restated for the contact atlases only.
- 5.1: Pardon §4.3 p. 63 (line 2660) through §4.8 p. 74 (line 3204), §4.9 p. 76 (line 3291): "§§4.3–4.8, pp. 63–76" correct.
- 5.3: Pardon §1.3, pp. 5–6 with (1.11), p. 6 (lines 218–236: unital ℚ-algebra map for exact cobordisms, chain map by #∂M_II=0, exactness gives finiteness); §1.4, p. 6 (lines 237–269, chain homotopy from #∂M_III=0); §1.5, p. 7 (lines 272–300, composition homotopy from #∂M_IV=0); §1.7 (1.22), pp. 8–9 (lines 343–358). Supports the statement.
- 6.3: no external locator; the four examples are recomputed below.
- 7.2: Latschev §2.1, p. 2 (lines 68–72), EGH (19) p. 49 (line 2151), degrees pp. 47–48, Example 2.2.4 p. 50 (line 2260). Supports the statement.
- 7.5, 7.7: Latschev §2.1 p. 2 and EGH §2.2 p. 48 (H at p=0, lines 2082–2096); the weight argument recomputed below.
- 9.1: EGH (38), p. 56 (lines 2523–2537: the Novikov-type inequality [ω](d) > −|Γ| with |γ_i| the action). Supports the statement.
- 9.2: Latschev §2.4, pp. 10–11 (lines 400–425, (4) and Definition 8 on p. 11). Supports the statement.
- 9.5: EGH Lemma 2.5.1, p. 68 (lines 3052–3059: ⋆ associative; e^F⋆e^G=e^H for a unique H=F♦G); (79), p. 69 (line 3105); Latschev Lemma 10, p. 12 (lines 471–483: Φ(e^a)=e^(f_*(a)) with f_*(a) unique) and Φ_a=Ψ_(−f_*(a))∘Φ∘Ψ_a with Φ_a(1)=1, p. 13 (lines 492–494); Pardon §1.5, p. 7 (the composition homotopy, lines 272–300). Supports the statement; "in general a_21 is not a_2+a_1" is the README's own control, recomputed below.
- 7.8 (R02 repair): Latschev §2.1, p. 3, lines 93–104: the r-fold bracket map of h of degree d has degree d−2Nr. Supports the repaired bullet.

**Duplication by object.** As in the previous review (`roadmaps grep` over the open pull requests and main for "contact homology", "holomorphic building", "supercommutative", "Reeb orbit", "symplectic field theory", "implicit atlas", "virtual fundamental"): no second owner of the orbit algebra, the Reeb-end compactification, the Weyl, Fock and potential carriers, the twisted receiving maps or the contact atlases; the stratified-complex vocabulary grep is reported under the move.

**Adversarial pass** (values recomputed at this head; the rows for unchanged sections were recomputed from the text, not copied):

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `signedSwapRel` (0.3) | x=y odd; (p,q)=(0,5), (−1,3) | x²~−x², 2x²=0, x²=0 over ℚ; signs +1, −1 via `Int.negOnePow` | correct | none |
| `signedSymPiece` (0.3) | V=0; ℚx with \|x\|=1 piece 2; \|x\|=0 piece 2; empty word | ℚ in degree 0 only; x²=0 so 0; ℚx²≠0; 1∈piece 0 | agrees with the five Checks | none |
| `nonempty_gradedAlgebra_signedSymPiece` | T(⊕V_p) words; relation homogeneous | pieces ⊕V_(p₁)⊗…⊗V_(p_k); relation generators in one piece; `isInternal_quotientPiece` | true | none |
| `exists_unique_odd_extension` | relation compatibility; hδ dropped: V=ℚ³ odd, δx=z | d(xy)=δx·y+(−1)^p x·δy vs d((−1)^(pq)yx) equal when \|δx\|=p+1; without hδ, 2zy=0 but zy≠0 | true with hδ; fails without | none |
| same, uniqueness and d(1) | a=1∈piece 0; induction on word length | d1=2d1 so d1=0; words determined by δ | determined | none |
| `odd_square_zero_iff_generators` | a∈piece p, b arbitrary; hdeg dropped: \|x\|=\|y\|=0, d=y∂_x | d²(ab)=d²a·b+a·d²b (cross terms cancel); d²=0 on generators, d²(x²)=2y²≠0 without hdeg | true; hdeg needed | none |
| parity grading (0.4) | ℚx⊕ℚy, \|x\|=0, \|y\|=3 | even ℚx, odd ℚy; signs depend on parity only | sound | none |
| good/bad (0.2) | simple; odd cover; double cover with one eigenvalue in (−1,0); with two; positive hyperbolic | ℤ/1; hom from odd cyclic trivial; count 1 odd ⇒ bad; 2 even ⇒ good; (0,∞) eigenvalues count 0 ⇒ good | Checks right | none |
| parity = sign det(I−A) (0.2) | (−1)^CZ=(−1)^(n−1)sign det(I−Ψ(1)) (egh00 line 260) | (−1)^(CZ+n−3)=sign det(I−A) | agrees | none |
| ellipsoid (6.4) | n=2, a₁<a₂, k=1 | CZ=1+2(1+0)=3, \|q\|=2; parity of CZ is n−1, \|q\|≡2n−4 | all even, d=0 | none |
| trivial-loop spectrum (1.1) | A=−i∂_t, period 1; S=ε | 2πℤ; 0↦−ε, CZ=−1 (HF line 1962) | agrees | none |
| trivial-cylinder kernel (2.1) | ∂s−A on ξ⊕ℝ² | 0 on ξ; 2 tangential constants; 0 with positive weights | 2 then 0 | none |
| index formula (2.3) | trivial cylinder; plane; one-positive tree | 0, vdim −1; (n−3)+CZ⁺+2c₁; (n−3)(1−k⁻)+CZ⁺−ΣCZ⁻+2c₁ = (2.50) | agrees | none |
| trivialization change (2.3) | winding w | CZ+2w, 2c₁−2w | unchanged | none |
| plane automorphisms (2.2) | Aff(ℂ), g=0, k=1 | 6g−6+2k=−4 | formula subtracts 4 | none |
| two negative ends on an odd orbit (3.3) | swap sign −1 | labelled count = −itself ⇒ unlabelled coefficient of q_γ² is 0; q_γ²=0 | consistent | none |
| codim and Aut in one edge contraction (4.1) | T′→T contracting one edge e=(v,w) | f injective off {v,w}; v source, w sink of e, not exchangeable; identity on E_ext; marker paths trivial mod d | Aut(T′/T)=1 in codim 1; Checks say ℤ/2 | R02 |
| fork of Figure 6 (4.1–4.2) | T one vertex; T′ with v₀ and identical v₁, v₂ | codim 2; Aut=ℤ/2 exchanging the two morphisms T′→T″; M(T″) meets M(T′) in 2 points over 1 point of M(T) | this is the right instance | R02 |
| closed stratum (4.1) | Figure 8: three-vertex tree | X_(/t) two points (pardon15 line 951), image one point | README's "image" is the wrong object | R01 |
| dim(T′→T)=vdim(T′) (4.1) | Lemma 2.44 | codim(T′/T)=vdim T−vdim T′, equality iff isomorphism | dim strictly increasing along non-isomorphisms | none |
| atlas axioms (4.1) vs Definition 3.2 | data (i)–(vii), axioms (i)–(x) | footprint of a union = intersection; homeomorphism axiom; free action; X_I^reg×ℝ^(dim E_(J∖I)); covering | faithful | none |
| obstruction complex (4.2) | C_(dim E+•)(E,E∖0; o^∨_E)^Γ | H=ℚ in degree 0 (the twisted fundamental class is Γ-invariant) | agrees with (4.1), Definition 4.2.4 | none |
| virtual class degree (4.2) | pushforward C^(d+•)_vir→C_(−•)(E) and (4.4) | functional on Ȟ^d(M; j_!o), d=vdim(T) | agrees | none |
| one-object category (4.2 Check 4) | T with no degenerations | Aut(T/T)=1, ∂=∅, (4.12) = C_vir(M rel ∅)=C_vir(M) | Check right | none |
| regular rigid point (4.2 Check 1) | M a point, trivial isotropy | Ȟ=ℚ in degree 0; Lemma 5.2.6 gives ±1 | agrees | none |
| subatlas enlargement (4.2 Check 2) | A⊆A′ by one datum | (4.6)–(4.7) compatible with (4.3), footnote 5 contracts with [E_α] | functional unchanged | none |
| d on generators (5.2) | plane; ellipsoid; hypertight | constant term; odd d on even generators vanishes; word length preserved | agrees | none |
| disjoint union symmetry (5.3) | a⊗b↦(−1)^(\|a\|\|b\|)b⊗a | matches (1.22) and the super tensor product | agrees | none |
| augmentation (6.1) | da=1; d=0 | ε(1)=1≠0; functionals killing products | agrees | none |
| da=bc (6.3) | a odd, b, c even | d²a=db·c+b·dc=0; [bc]=0 | agrees | none |
| da=1 (6.3) | H=m_a | d(ax)=x−a·dx ⇒ dH+Hd=id | homology 0 | none |
| projection loses d²=0 (6.3 Check 4) | \|a\|=\|v\|=1, \|w\|=0, \|u\|=2; da=1, dv=w, du=v−aw | d²u=w−(w−a·0)=0, d²a=d²v=d²w=0; d₁u=v, d₁v=w, d₁²u=w≠0 | the promised phenomenon | none |
| finite coefficients (7.1) | output p-word of length 2; Σp_γq_γ | finitely many right subwords; (Σκℏ)² infinite | agrees | none |
| degrees (7.2) | n=1,2,3 | \|ℏ\|=−4,−2,0; bracket degree −2(n−3) | agrees | none |
| κ_γ=2 (7.2) | p=2ℏ∂_q | p(q)=2ℏ | agrees | none |
| K=ℏq_γ, q_γ odd (7.3) | master equation | K⋆K=0, D=[q_γ,−], D²=0, D(p_γ)=±κℏ | p-free solution; Check now says so | none |
| D_X² (7.4) | \|m\| even | H⁻H⁻m−mH⁺H⁺ | sign now right | none |
| \|F\|=0, \|H\|=−1 (7.4) | rigid term q⁻p⁺ℏ^(g−1)z^d | Σ(CZ⁻+n−3)−Σ(CZ⁺−(n−3))+(g−1)2(n−3)−2c₁=−vdim=0; −1 for H | agrees | none |
| weight w=N+length (7.5) | ℏ^(−k)F₀^k; one contraction | ≥0; N+1, length −1 | preserved | none |
| genus law (7.6) | k=1; k=2; self-loop | g₁+g₂; +1; +1 genus, +1 ℏ | agrees with (78) | none |
| identity kernel (7.6, 9.3) | g=q⁺, q⁺=κℏ∂_(p⁺) | κℏq⁻/(κℏ)=q⁻; without ℏ⁻¹, g(ℏq⁻) | README right; egh00 (80) misprint | none |
| vacuum filtration (7.7) | ℏ⁻¹c scalar; one term of energy e | diverges; e^k/k! at ke | agrees | none |
| l_1, curvature (7.8) | f homogeneous; c odd | l_1(f)=Q(f)−(−1)^(\|f\|)fc; l_1(c)=0; l_1²=−l_2(c,−) | hold | none |
| degree of l_k (7.8, R02 repair) | n=2, \|ℏ\|=−2, H=q₃p₁p₂ with \|q₁\|=\|q₂\|=0, \|q₃\|=3 | Q(g)=ℏ²q₃∂₁∂₂g; l₂(q₁,q₂)=ℏ²q₃ of degree −4+3=−1=Σ\|f_i\|−1; rational degree −1−(k−1)·2(n−3) = d−2Nk with d=2N−1 (latschev22 line 96) | repaired bullet right | none |
| ℏ^(k−1) part of l_k (7.8) | H₀ term with m p's, p↦κℏ∂_q, ℏ⁻¹ normalization | ℏ^(m−1)∂^m; k single contractions survive at 1 only for m=k | ℏ^(k−1)·{…{h,f₁},…,f_k}\|_(p=0) | none |
| graph examples (8.3) | γ=η; η=θ odd; two edges | 1/2; q²=0; ℏ¹, κ_γκ_η | agrees | none |
| energy completion (9.1) | Σ_k q_(γ^k) | energies kT→∞, finitely many below each cutoff | agrees | none |
| admissibility (9.2) | a∈F¹ mod F^r; scalar of filtration 0 | polynomial of degree r−1; divergent | agrees | none |
| Z_W, T_W, Q^(−,a) (9.3) | H⁻E=EH⁺; p⁺=0 | Q⁻Z=ZQ⁺; (Q^(−,a))²=0; T(1)=1; c^(−,a)=T(c⁺) | hold | none |
| φ_W multiplicativity (9.4) | q₁q₂ | κ₁κ₂ℏ²(∂₁∂₂F+∂₁F∂₂F): O(ℏ)+φ(q₁)φ(q₂)+O(ℏ) | agrees | none |
| regraded bracket degree (9.4) | h of degree d−1, k inputs | ((d−1)+Σ\|f_i\|−kd)−d=Σ(\|f_i\|−d)−1 | −1 | none |
| nonexact regression (9.4) | n=3, κ=1, h⁻=θp₁p₂, h⁺=θ(p₁+t)p₂, f=tx₁⁻+Σq⁻p⁺ | h⁻\|_L=θ(t+p₁⁺)p₂⁺=h⁺\|_L; d⁻x₂=0, d⁺x₂=tθ, d^(−,b)x₂=tθ | regression correct | none |
| composition (9.5) | T₂^[a₁]=e^(−a₂₁)Z₂m_(e^(a₁)) | T₂₁=T₂^[a₁]T₁; intertwines Q₁^(a₁), Q₂^(a₂₁) via Z₂Q₁=Q₂Z₂ | holds | none |
| a₂₁≠a₂+a₁ (9.5) | a₁=tx₁, E₂ of the regression | Z₂(e^(a₁)) has the contraction terms of E₂ against x₁ | holds | none |
| gauge transport (9.5) | U̇=AU | d/dt(U⁻¹d_tU)=U⁻¹(ḋ−Ad+dA)U=0 | holds | none |
| supplier order | ORDER.txt positions | SFT 193; suppliers on main; IA 200 and GWT 284 not cited | no upward edge | none |

## Not verifiable

- The geometric statements of Layers 1–9 have no carrier at the pins, so they were checked on paper against the sources, not elaborated.
- Pardon's Figure 6 and Figure 8 are figures; their captions (pardon15 lines 804–805, 947–952) were read, the drawings were not.

## Source issues

- **Misprint** in egh00 at §2.5, proof of Proposition 2.5.2, printed page 69 (line 3115): the source says the trivial-cylinder element in the identity (80) is the sum over orbits of κ_γ⁻¹p_γq_γ; it should carry a factor ℏ⁻¹, since under the normalisation (78) the exponential of the displayed element sends g(q) to g(ℏq) rather than to g(q); affects nothing.
