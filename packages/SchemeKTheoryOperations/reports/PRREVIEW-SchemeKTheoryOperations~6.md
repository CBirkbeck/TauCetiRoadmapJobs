# Review of SchemeKTheoryOperations (pull request #1229 at 78121a2)

**Verdict:** needs changes

🤖 Independent AI incremental review of the 33 lines changed since 6732a6a. `needs changes` means the author makes the repair below before the next review; the AI never approves or merges. There is one P3 finding, introduced by the new directed-union Checks; both r5 findings are repaired, and the gate passes.

## R01 (P3) — The directedness Check says the surjective half needs no directedness; it fails in degree 3

**Location.** TauCetiRoadmap/SchemeKTheoryOperations/README.md:2588: "Directedness is needed. `S₃` is the union of its cyclic subgroups, a family that is not directed. … The surjective half still holds for this family, since `H₁(⟨(12)⟩)→H₁(S₃)` is onto."

**Claim.** The target at 2580 states the surjective half for every `m≥0`. The Check's last sentence is true only in degree 1 (and trivially in degree 2, where `H₂(S₃;ℤ)=0`). As written, it suggests that directedness matters only for injectivity. The surjective half needs it as well.

**Witness.** `H₃(S₃;ℤ)=ℤ/6`. The images are `ℤ/2` from each `⟨(ij)⟩` and `ℤ/3` from `A₃`; inversion acts on `H₃(C₃)` by `(−1)²=1`. The trivial subgroup gives 0. Their union `{0,2,3,4}` misses the generators 1 and 5.

**Repair.** Replace the last sentence with: "In degree 1 the surjective half still holds for this family, since `H₁(⟨(12)⟩)→H₁(S₃)` is onto. In degree 3 it fails as well: `H₃(S₃)=ℤ/6`, while each cyclic subgroup reaches only `ℤ/2` or `ℤ/3`." On S₃ the corrected sentence holds in both degrees: in degree 1, (12) has sign −1; in degree 3, no member reaches 1 ∈ ℤ/6.

## Previous findings

- R01 — repaired: README:2580 now proves that the maps `H_m(G_i,A)→H_m(G,A)` "identify `H_m(G,A)` with the colimit". The injective half goes through injective chain maps. *Needs:* at 2582 cites `groupHomology.exists_map_subtype_eq`, and table row 55 adds the DirectedUnion module.
- R02 — repaired: README:2590 reads "exact in degrees `≤c`, where `c=n−t−2−s`, the action is transitive on frames of length at most `c+ε+1` … (3.4–3.6, pp.279–280, where c is written d…)". `d` is now only the Krull dimension.

## Verified sound

**Scope and diff.** This incremental re-review covers 33 changed lines (22 insertions, 11 deletions):

- README:11, the ownership sentence on the three inputs of §6.7 and the StableHomotopyKTheory §1.17 analogue;
- README:43, the pins;
- README:55, the new DirectedUnion module row;
- README:103, How to read the build;
- README:2544, "four targets";
- README:2580–2588, the new directed-union target, its *Needs:* line and three Checks;
- README:2590–2592, the van der Kallen paragraph, with `c` and its *Needs:* line;
- README:2878, the Layer 6 Dependencies;
- Suggested.lean:18–25, the docstring: the pins and the not-statable list.

`git diff --stat origin/main...HEAD` outside the folder is empty. No Lean statement changed.

**Gate and Lean.**

- My gate rerun at this head prints `gate SchemeKTheoryOperations: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate.md also shows build=0.
- The dependency check prints `depcheck: 236 roadmaps, 2269 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean` on Suggested.lean reports only `declaration uses sorry` at 57:8.
- A scratch `#check @name` file importing the module elaborates the three declarations. Their types equal signatures.md and r5. `exists_strictlyPerfect` keeps `CompactSpace`, `QuasiSeparatedSpace`, `HasDerivedCategory`, the finite-type quasicoherent-quotient hypothesis and `IsPerfectComplex X E`. No binder is lost, and nothing changed.
- The same file elaborates the four names newly cited in the README. Their types are given below.

**Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d, equal to lake-manifest.json).**

- TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean, read in full:
  - :67 `exists_chainsMap_subtype_f_eq` (one subgroup);
  - :88 `TauCeti.groupHomology.exists_chainsMap_subtype_f_eq_of_directed`, with hypotheses `Directed (· ≤ ·) S`, `⨆ i, S i = ⊤` and `[Nonempty ι]`;
  - :113 `groupHomology.exists_map_subtype_eq`, declared in the root `groupHomology` namespace;
  - :132 `isZero_groupHomology_of_directed`;
  - the docstring at 30–32 says injectivity is not proved. Row 55 says exactly this.
- Mathlib RepresentationTheory/Homological/GroupHomology/Functoriality.lean: `namespace groupHomology` at :42, `chainsMap_f_map_mono` at :111 (injective group map and `Mono φ` give mono chain maps) and `map` at :157.
- TauCeti/AlgebraicGeometry/Chow/Basic.lean defines `CH_k(X)` for locally Noetherian X. No file under Mathlib or Tau Ceti `AlgebraicGeometry` mentions Chern classes. Tau Ceti's other "Chern" hits are cyclic-cohomology Chern chains (RingTheory/CyclicCohomology/Normalized/Chern/Even.lean) and genus series. The docstring therefore now names correctly what Layers 6–7 lack: Chern classes and characters, and K→Chow comparison maps. Chow groups themselves exist at the pins.

**Kal80, read at the changed locators.** The GDZ scan is image-only for the extractor, so I rendered PDF pages 12, 13 and 20 (printed pp.279, 280, 287) and read the images.

- 3.4, p.279 puts d=n−t−2−sdim, ε=0 for square G and 1 otherwise, and transitivity on non-degenerate k-simplices for 0≤k≤d+ε. A k-simplex is a frame of length k+1, so this is "length at most `c+ε+1`" with c written d. Square means P=Q=[1,t] (3.2), which is P=Q when P∪Q=[1,t].
- 3.5.3–3.7, p.280: the stabilizers and Proposition 3.7 are unchanged and match.
- End of 4.6, top of p.287: `H_{m+1}(XL(R),A)=lim H_{m+1}(G_s^{∅∅},A)`, the directed-union identification used in van der Kallen's proof, as README:2580 says.
- Theorem 4.8, p.287: e=max(1,sdim); surjective at size ≥2m+e−1 and bijective at ≥2m+e. This matches 2590.

**Suppliers and citations resolved.**

- AlgebraicKTheory §1.2 "The stable general linear group", at its open head e4c7867: GL∞ is the directed colimit along `g↦diag(g,1)`, with injective stage maps, and every element comes from a finite stage. This supports the *Needs:* line at 2582. §§4.1–4.2 are still present (439, 455).
- StableHomotopyKTheory §1.17, at its open head 23a1323, is titled "Homology of classifying spaces commutes with filtered colimits". It covers constant coefficients over filtered diagrams of small categories. README:11 describes it correctly as an analogue on another carrier, not a supplier of §6.7.
- The roadmap citations tool found no cross-roadmap citation that resolves nowhere. Its six Lean-name leads all lie in untouched text that r5 passed. `exists_strictlyPerfect` is declared in Suggested.lean.

**Ownership by object.** I searched main and the 458 open heads for "directed union", "group homology commutes", "homology of a directed union" and "colimit of (their) homology".

- The only group-level hit is DGFloer's statement for `H_*(K(A,n))` with A abelian. It is not in the merge order before this roadmap and is on another carrier.
- AlgebraicKTheory, StableHomotopyKTheory and GeneralAlgebraicKTheory state no group-homology colimit.
- The ownership sentence at README:11 explains why §6.7 owns the injective half on Mathlib's group homology. No earlier roadmap owns it.

**Headlines and padding.** The headline list and the single statement are unchanged since r5. The docstring's not-statable list was corrected as above, and no headline became statable at the pins: the Chern-character and Riemann–Roch headlines need Chern classes and a K→Chow map. No declaration was added, so the r4 padding probe stands.

**Seeded sample.** Of the 15 seeded subsections, only §6.7 contains changed passages. Its changed locators (Kal80 3.4–3.6 and the end of 4.6) and the retained Theorem 4.8 were read on the page; see above. The other 14 sections are untouched, and their rows are carried below. The README flags no locator as unverified.

**Remarks (no change requested).**

- After the docstring edit, Suggested.lean:25 is 108 characters long. The repository sets no line limit, and many Suggested.lean files on main exceed 100.
- Both r5 remarks are resolved. The pins sentence at README:43 now matches lake-manifest.json. The description's "Depends on" and merge-order chain now list only suppliers.

**Adversarial table: changed statements.** All rows are fresh computations at this head. H₁ is written additively.

| Statement | Instances tried | Values computed on the two sides / negative control | Result; change |
| --- | --- | --- | --- |
| Directed union, injective half, 2580, Check 2586 | `GL(ℤ)=⋃GL_n(ℤ)`, m=1, A=ℤ | `E₁₂(1)` mod 2 fixes (1,0) and swaps (0,1),(1,1): sign −1, so `[E₁₂(1)]≠0` in `(ℤ/2)²`. det=1, so it is 0 in `K₁(ℤ)`. In GL₃, `E₁₃(1)E₃₂(1)E₁₃(−1)E₃₂(−1)=E₁₂(1)` (computed) | Correct; j=3 serves |
| Directed union, colimit value, 2580 | m=1, `GL_n(ℤ)` for n=1,2,3,… | ℤ/2 → (ℤ/2)² → ℤ/2 → ℤ/2 → …; colimit ℤ/2 = `K₁(ℤ)` = `H₁(GL(ℤ))` | Correct |
| Directed chain, Check 2587 | ℚ=⋃(1/n!)ℤ | Stage map is ×(n+1) on ℤ; colim H₁=ℚ=H₁(ℚ); colim H₂=0=Λ²ℚ | Correct |
| Torsion union, 2580 | ℚ/ℤ=⋃(1/n!)ℤ/ℤ, A=ℤ | colim H₁=colim ℤ/n!=ℚ/ℤ=H₁; colim H₂=0=Λ²(ℚ/ℤ) | Correct |
| Twisted coefficients, m=0, 2580 | G=ℚ, A=ℤ[ℚ] regular | `H₀(G_i,A)=ℤ[ℚ/G_i]`; colimit `ℤ[ℚ/⋃G_i]=ℤ=H₀(ℚ,ℤ[ℚ])` | Correct with nontrivial A |
| Nonempty family, 2580 | G=1, empty index set | No member: colimit 0 ≠ H₀(1,k)=k. "G is the union" forces a member, as Tau Ceti's `[Nonempty ι]` does | Correct |
| Directedness control, degree 1, Check 2588 | S₃, cyclic subgroups | H₁(A₃)=ℤ/3→ℤ/2 is 0, and A₃ lies in no larger member; H₁(⟨(12)⟩)=ℤ/2→ℤ/2 onto | Correct in degree 1 |
| Directedness control, degree 3, Check 2588 | S₃, cyclic subgroups | H₃(S₃)=ℤ/6; images ℤ/2 (each ⟨(ij)⟩), ℤ/3 (A₃), 0 ({1}); union {0,2,3,4} | Surjective half fails: R01 |
| `GL(R)` comparison via directed union, 2590 | ℤ, m=1 (s=1, e=1) | n=2: (ℤ/2)²→ℤ/2 onto, kernel `⟨[E₁₂(1)]⟩`; n≥3: det iso ℤ/2→ℤ/2; colimit `K₁(ℤ)` | Bijective from n=3; Kal80 p.287 uses the same colimit |
| Route sketch with c, 2590 | ℤ[x]: n=5, t=0, s=2; 𝔽₂: n=2, t=0, s=0 | ℤ[x]: c=1 while d=2. Length ≤c+ε+1=2 means k≤1=c+ε (Kal80 3.4). 𝔽₂: c=0; GL₂(𝔽₂) is transitive on the 3 nonzero vectors | Correct; r5 R02 repaired |
| Not-statable list, Suggested.lean:23–25 | Pins | CH_k at TauCeti/AlgebraicGeometry/Chow/Basic.lean; no Chern class of a vector bundle in Mathlib or Tau Ceti | Accurate |
| Pins, README:43 and Suggested.lean:18–19 | lake-manifest.json | revs 1b1ccf4b… and 2fd255d9… | Match |
| Module row, README:55 | `#check` at the pins | Both names elaborate with `Directed`, `⨆ i, S i = ⊤`, `[Nonempty ι]`; class- and chain-level surjectivity | Matches the row |
| Ownership sentence, README:11 | StableHomotopyKTheory §1.17 at 23a1323 | Classifying spaces of small categories, constant coefficients, filtered diagrams | Accurate; other carrier |

**Adversarial table: unchanged §6.7 statements, carried from r5.** These rows are carried verbatim from packages/SchemeKTheoryOperations/reports/PRREVIEW-SchemeKTheoryOperations~5.md (r5, at 6732a6a). This diff leaves their statements untouched. Line numbers are r5's. Add 1 up to r5's 2578 and 11 from r5's 2582 on; r5's 2579 and 2581 are now 2590 and 2592. r5's `GL(R)` comparison and Route sketch rows are superseded by the rows above.

| Statement | Instances tried | Values computed on the two sides / negative control | Result; change |
| --- | --- | --- | --- |
| Hyperhomology of a degree-0 complex, 2545, 2559 | G=ℤ/2, C=ℤ[0] | H₁(G;C)=ℤ/2 and H₂=0; the bare coinvariant complex gives 0 in degree 1 | Correct Check |
| First spectral sequence and d¹, 2545, 2560 | S₃, `C=(ℤ[S₃/A₃]→ℤ)` | E¹ maps: q=0 ℤ→ℤ identity; q=1 ℤ/3→ℤ/2 zero. So H₀=0, H₁=ℤ/2 (and H₂=ℤ/3). Second SS: H₀(C)=0 and H₁(C)=sgn, so H₁(G;C)=H₀(S₃;sgn)=ℤ/2 and H₂=H₁(S₃;sgn)=ℤ/3 | Both sequences agree |
| No converse to vanishing, 2561 | S₃, `C=(ℤ[S₃/⟨(12)⟩]→ℤ)` | H₁(C₂)→H₁(S₃) is an isomorphism, so H₀=H₁=0. Second SS: H₁(G;C)=H₀(S₃;V), V=ker(ℤ³→ℤ); (12) and (23) force e₁−e₂≡e₂−e₃≡0, so 0. Meanwhile H₁(C)=ℤ²≠0 | Correct |
| Vanishing for n≤t, 2545 | t=0 and t=1 in the S₃/A₃ example | H₀(C)=0 gives H₀(G;C)=0. H₁(C)=sgn≠0 and H₁(G;C)=ℤ/2: the hypothesis is needed at t=1 | Correct |
| Shapiro identification, 2545, 2555 | ℤ[S₃/A₃]; q=0,1 | H₀=ℤ=H₀(A₃); H₁=ℤ/3=H₁(A₃); matches `groupHomology.indIso` | Correct |
| Frame acyclicity (i), 2563, 2575 | 𝔽₃, n=1, δ=0 | 2 vertices, 0 edges: exact in degree −1=n−2−s; degree 0 fails (control s=−1) | Correct, sharp |
| same, 2576 | 𝔽₂, n=2, δ=0 | V=3, E=6, no 2-simplices; connected; rank H₁=6−3+1=4 | Exact through degree 0 only |
| same, δ=1, 2577 | 𝔽₂×𝔽₂, n=1 | 4 vertices (a,1); edges iff a−b=(1,1): {00,11} and {10,01}; 2 components | Bound −1 attained; Kal80 2.7.3 |
| Frame acyclicity (ii), 2563 | 𝔽₂, n=2, δ=0, u=(e₁), k=1 | F(u)={e₂, e₁+e₂}; no edge, since three vectors in 𝔽₂² are never a frame | Bound n−2−s−k=−1 attained |
| Stable-range convention, 72, 2563 | ℤ; a field | ℤ: (2,5) unimodular, 2+5c≠±1, so not ≤1 but ≤2: SR₃, s=1. Field: ≤1, SR₂, s=0 | Consistent with AlgebraicKTheory §4.1 |
| One-step stability, 2579, 2592 | 𝔽₂, m=1 (s=0, e=1) | n=1: 0→ℤ/2 not onto. n=2: ℤ/2→0 onto, not injective. n=3: 0→0 (GL₃𝔽₂ simple, GL₄𝔽₂≅A₈) | Bounds 2 and 3 attained; e=s=0 control fails at n=2 |
| m=0; zero ring, 2591, 2594 | m=0, any R; R=0 | H₀: ℤ→ℤ identity for all n≥0 (onto bound e−1≥0). GL_n(0)=1, so H_m=0 for m>0 | Correct |
| Noetherian form, 2587, 2595 | ℤ[x] (d=2); ℤ; fields | e=2 gives H₁ bijective from n≥4; e=1 from n≥3 | Correct; matches Check |
| Semilocal form, 2579, 2587 | 𝔽₂×𝔽₂ | R/Jac semisimple; §4.2 gives stable range 1, so s=0 and e=1 | Correct |
| Theorem 4.8 with P=Q=∅ | Kal80 p.287 | t=0, `G_n^∅∅=GL_n(R)` square of size n; gives onto at ≥2m+e−1, bijective at ≥2m+e | Locator correct |
| Uniform N₀, 2597 | q=2 over ℤ (d=1), 𝔽₂ (d=0), A¹_ℤ (d=2); V=∅ | N₀=5, 5, 6; bijectivity for j≤1 needs N≥3, 3, 4. V=∅: O(V)=0 and H₀ is the identity | Correct, not sharp |
| GS99 K₀ step, 2597 | Rank-r bundle on a hypercover | GS99 p.41: the classifying map lands in `ℤ×ℤ∞BGL_N` with N≥r, and maps to [E] | Correct |

**Adversarial table: the sampled sections and the headline, carried from r5.** These rows are carried verbatim from the r5 report, which carried them from r4 (78ba9e5), r3 (393a8f1) and r2 (98204e2) as tagged. They cover the seeded sections 1.4, 2.6, 3.9, 4.3, 4.6, 4.8, 4.11, 4.12, 5.3, 5.4, 6.7, 6.9, 6.11, 7.1 and 7.2, and the §1.6 headline. This diff changes none of their statements. Their line numbers are those of the round that computed them; locate rows by section number. r5's other carried rows, for §§1.1–7.7 and the r3/r4 supplier and representation rows, stand unchanged in the r5 report, because this diff touches none of their statements.

| Statement | Instances tried | Values computed on the two sides / negative control | Result; change |
| --- | --- | --- | --- |
| 1.4 Affine comparison | Spec ℤ and ℤ/2 | Tilde followed by sections gives ℤ/2; strict resolution has H⁰=ℤ/2 and H⁻¹=0 | r2 (98204e2): Retain |
| 1.4 Coherator versus identity | Quasicoherent tilde of A² | Unit/counit recover A², rank 2 on both sides; this tests only the supplied quasicoherent subcategory | r2 (98204e2): Retain |
| 1.6 Global strict headline | P¹ point; ℤ/n; empty scheme | [O(−1)→O] resolves the point; [ℤ→ⁿℤ] resolves ℤ/n; zero resolves empty scheme | r2 (98204e2): Retain Lean theorem |
| 1.6 Resolution-property necessity | Doubled affine plane | Naive bundle K₀=ℤ, perfect K₀=ℤ²; an origin class (0,1) cannot come from diagonal ℤ | r2 (98204e2): Retain hypothesis |
| 1.6 Derived isomorphism, not literal equality | E plus a contractible non-finite summand | H(E⊕Cone(id M))=H(E), but its terms need not be finite; Q(E⊕Cone(id M))≅Q(E) | r2 (98204e2): Retain conclusion |
| 2.6 Regular Cartan | k versus dual numbers | k: K₀→G₀ is 1↦1; dual numbers: 1↦2, not an isomorphism | r2 (98204e2): Retain regularity |
| 2.6 Compactness | D(k), k versus ⊕ℕk | Hom(k,⊕k)=⊕k; identity of ⊕ℕk has infinitely many coordinates and does not factor through a finite subsum | r2 (98204e2): Retain |
| 3.9 Quasi-isogeny sign | p and p⁻¹ on a Witt line | Degrees +1 and −1; composition has degree 0 | r2 (98204e2): Retain |
| 3.9 Identity quasi-isogeny | β=id on a rank-one object | Cone contributions 1−1=0; underlying rank is still 1 | r2 (98204e2): Retain degree is not rank |
| 3.9 Ramified coefficient | p=uπᵉ | degree(π)=1 and degree(p)=e; normalized p-degree cannot replace π-degree | r2 (98204e2): Retain |
| 4.3 Sheafification | Two-point discrete space, constant presheaf ℤ | Presheaf sections ℤ; sheaf sections ℤ²; map a↦(a,a) not onto | r2 (98204e2): Retain sheafification |
| 4.3 Hypercohomology not objectwise π₀ | Units on P¹ | H¹(P¹,Gₘ)=Pic(P¹)=ℤ, yielding a negative hypercohomotopy group for the associated degree-zero sheaf | r2 (98204e2): Retain |
| 4.3 Godement points | Spec field with identity stalk | Stalk and sections both k; augmentation followed by totalization is identity | r2 (98204e2): Retain |
| 4.6 Gersten kernel | DVR | Kernel(v:F×→ℤ)=O×; π maps to 1, so v is surjective | r2 (98204e2): Retain |
| 4.6 Bloch's formula | P¹ over k, codimension 1 | CH¹(P¹)=Pic(P¹)=ℤ; O(1) maps to degree 1 on both sides | r2 (98204e2): Retain |
| 4.6 Codimension-zero case | Integral field | CH⁰(Spec k)=ℤ=H⁰(K₀); no negative-codimension terms | r2 (98204e2): Retain |
| 4.8 Relative effacement | Λ a DVR, Λ[x]/(x−π) | Quotient is Λ and flat; Λ[x]/(π) is killed by π and not flat | r2 (98204e2): Retain relative-flat divisor condition |
| 4.8 Regular equation | t=0 versus x−π | Multiplication by 0 has full kernel; x−π has zero kernel | r2 (98204e2): Retain regularity hypothesis |
| 4.11 Witt finite stages | W₂(𝔽₂)→𝔽₂ | Units {1,3} both reduce to 1; automorphism lifting has nontrivial kernel {1,3} | r2 (98204e2): Retain groupoid/derived descent |
| 4.11 Zero-object lifting | Zero perfect complex | Deformations and automorphisms are zero/identity; its lift space is contractible | r2 (98204e2): Retain |
| 4.11 Uniform amplitude | Finite free module over ℤ₂ and all mod-2ⁿ reductions | Every stage has amplitude [0,0] and rank 1; limit has the same interval and rank | r2 (98204e2): Retain uniform-bound condition |
| 4.11 Supported degree | Cone(pᵐ) on a perfect residue point | Supported K₀ degree and p-adic determinant valuation both m | r2 (98204e2): Retain |
| 4.12 Square-to-Čech descent | Identity cover; disjoint two-point cover | Identity gives E; disjoint cover gives E×E, equal to value on two points for a sheaf | r2 (98204e2): Retain |
| 5.3 Rank-zero projective bundle | E=0 | P(E)=∅; K=0 and zero summands on the right | r2 (98204e2): Retain |
| 5.3 Rank-one convention | E=L | P(E)=X, O(1)=L, pushforward O(n)=Lⁿ | r2 (98204e2): Retain quotient convention |
| 5.3 Positive twist | E=L⊕O, rank 2 | π_*O(1)=L⊕O, not L∨⊕O | r2 (98204e2): Retain |
| 5.3 Negative twist/top cohomology | Rank-2 E | Rπ_*O(−1)=0; Rπ_*O(−2)=det(E)∨[−1] | r2 (98204e2): Retain determinant and shift |
| 5.3 Koszul relation | E=k², L=[O(−1)] on P¹ | 1−2L+L²=0, equivalently (1−L)²=0 | r2 (98204e2): Retain |
| 5.4 Relative regularity | O on P¹ over any affine base | H¹(O(−1))=0, evaluation surjective; no field-only hypothesis is used for this example | r2 (98204e2): Retain relative extension |
| 5.4 Quillen resolution | O(1) on P¹ | T₀ has rank 2, T₁ rank 1; Euler reconstruction 2−L=[O(1)] | r2 (98204e2): Retain |
| 5.4 Regularity negative control | O(−1) with an unjustified regular presentation | Naive zero-section data would give 0 although [O(−1)]=L≠0; required regularity fails | r2 (98204e2): Retain |
| 6.7 K-coherence comparison | Field point; P¹ | Point has cohomological dimension 0; P¹ has nonzero Pic=ℤ in sheaf cohomological degree 1, requiring dimension bound 1 | r2 (98204e2): Retain dimension control |
| 6.7 Pointed fringe | π₀ with a nontrivial π₁ stabilizer | Core of k has automorphism group k×; forgetting stabilizers changes a fibre from B(k×) to a point | r2 (98204e2): Retain pointed-set treatment |
| 6.9 Endpoint/Bockstein indexing | Two-cell Moore space S¹∪ₙe² | Coefficient K₂ has endpoints K₂/n and K₁[n]; shifting the Moore space would give a K₂[n] endpoint instead | r2 (98204e2): Retain degree-two construction |
| 6.9 Finite eigenvalue separation | ℓ=5, k=2, weights 0,1,2 | Eigenvalues 1,2,4; differences 1,2,3 are units mod 5 | r2 (98204e2): Retain |
| 6.9 Collision negative control | ℓ=3, k=2, weights 0,1,2 | Eigenvalues 1,2,1; first/last difference 0 | r2 (98204e2): Retain strict prime/weight-width bound |
| 6.9 Generalized versus honest eigenspace | T=[[2,1],[0,2]] | (T−2)≠0 but (T−2)²=0; a length-two extension need not be scalar 2 | r2 (98204e2): Retain integral endpoint/splitting inputs |
| 6.9 Coefficient product supplier | Hℤ/2; S/p² at odd p | Hℤ/2 has π₀=𝔽₂ and higher π=0; q=2,n=1 satisfies 2≥2 | r2 (98204e2): Repaired supplier contract |
| 6.9 Even-prime E₁ bound | S/8 | q=3,n=1 gives 2q=6=3(n+1); S/2 gives 2<6 | r2 (98204e2): Retain corrected supplier range |
| 6.11 Gysin Adams factor | Trivial conormal rank c | θᵏ(Oᶜ)=kᶜ; ψᵏi_*x=i_*(kᶜψᵏx) | r2 (98204e2): Retain conormal correction |
| 6.11 Coniveau weight | Codimension p point, weight i−p | Extra kᵖ times k^(i−p) equals kⁱ | r2 (98204e2): Retain shifted residue weight |
| 6.11 Low-degree Serre-error claim | Rational coefficients | Finite-torsion error category becomes 0; claimed decompositions become genuine rational direct sums | r2 (98204e2): Retain modulo-error formulation integrally |
| 7.1 γ versus support filtration | h=1−[O(−1)] on P¹ | h∈F¹, h²=0; rank(h)=0, determinant(h)=O(1) | r2 (98204e2): Retain |
| 7.1 Rank-zero ideal | Field | K₀(k)=ℤ with rank=id; F¹=0, hence all higher filtration groups 0 | r2 (98204e2): Retain |
| 7.2 Leading Chern sign | Codimension c=1,2,3 | Coefficient (−1)^(c−1)(c−1)! is +1,−1,+2 | r2 (98204e2): Retain |
| 7.2 Point on P² | [O_P] | ch₂ is +[P], but c₂ is −[P]; conflating Chern class with character reverses the sign | r2 (98204e2): Retain |
| 7.2 Geometric character | O(n) on P¹ | ch=1+nH because H²=0 | r2 (98204e2): Retain |
| 6.9 A¹ representability | Spec k and A¹_k, degree zero | Both represented groups are K₀=ℤ; pullback sends 1 to 1 | r2 (98204e2): Retain regular scope |
| 6.9 Uniqueness cannot be tested only on points | ψ² versus identity on P¹ | Both fix rank; with L=1−h, ψ²(L)=1−2h while id(L)=1−h and h≠0 | r2 (98204e2): Retain natural operation on all smooth test schemes |
| 6.9 Trivial coefficient modulus | n=1 | Cofibre of identity on the sphere is 0; spectral coefficients and Moore mapping groups are both 0 | r2 (98204e2): Retain separate boundary case |

## Not verifiable

- None in the changed passages. Kal80 is listed in the worker's scratch request as an unreadable image-only scan. I read it legally from the GDZ copy recorded in sources.toml by rendering the pages; every changed Kal80 locator is verified above. The request stays as the worker filed it.
- Lean coverage of the new directed-union target, and of §6.7 generally, is README-only. The headline file states only §1.6. This is by design, since the target is a ring- and group-level input, not a headline.

## Source issues

- none
