# Review of SchemeKTheoryOperations (pull request #1229 at 07d5e4d)

**Verdict:** accepted

🤖 Independent AI incremental review of the 2 lines changed since 78121a2. `accepted` means this roadmap folder is ready for a human's final approval; the AI never approves or merges. The one r6 finding is repaired, the repair introduces no new problem, no finding remains from any earlier round, and the gate passes.

## Previous findings

- R01 — repaired: README:2588 now reads "In degree 1 the surjective half still holds … In degree 3 it fails as well: `H₃(S₃;ℤ)=ℤ/6`, while `H₃` of each cyclic subgroup has order at most 3, so a generator … comes from no member." The added transfer sentence is correct (values below).

## Verified sound

**Scope and diff.** The diff since 78121a2 changes one line of TauCetiRoadmap/SchemeKTheoryOperations/README.md (2588, the third Check of the directed-union target at 2580): the last sentence of the directedness Check is replaced by three sentences. Nothing else in the folder changed; `git diff 78121a2..HEAD -- Suggested.lean` is empty, and `git diff --stat origin/main...HEAD` outside the folder is empty. No line numbers shift (one line replaces one line), so every citation of §6.7 by line in r6 still points where it did.

**The changed Check, recomputed.** H₁ is written additively; the family is the cyclic subgroups `{1}`, `⟨(12)⟩`, `⟨(13)⟩`, `⟨(23)⟩`, `A₃` of `S₃`.

- Degree 1: `H₁(⟨(12)⟩;ℤ)=ℤ/2→H₁(S₃;ℤ)=ℤ/2` sends the generator to the class of (12), whose sign is −1, so the map is onto. The sentence "in degree 1 the surjective half still holds" is correct.
- Degree 3, the group: the Sylow 2-subgroup `C₂` is abelian and self-normalising, so the 2-primary part of `H₃(S₃;ℤ)` is `H₃(C₂;ℤ)=ℤ/2`; the 3-primary part is the `C₂`-invariants of `H₃(A₃;ℤ)=ℤ/3`, on which inversion acts by `(−1)²=1`, so it is ℤ/3. Hence `H₃(S₃;ℤ)=ℤ/6`, as written.
- Degree 3, the members: `H₃(C₂;ℤ)=ℤ/2`, `H₃(C₃;ℤ)=ℤ/3`, `H₃(1;ℤ)=0`, of orders 2, 3, 1. "Order at most 3" is correct, and no image contains an element of order 6, so neither generator 1 nor 5 of ℤ/6 comes from a member. The surjective half fails in degree 3, as the Check now says.
- The transfer sentence: corestriction after restriction is multiplication by the index on `H₃(S₃;ℤ)`. For `⟨(12)⟩` the index 3 is invertible on the 2-part, so the image of `H₃(⟨(12)⟩)` contains the order-2 subgroup, and has order at most 2, so equals it. For `A₃` the index 2 is invertible on the 3-part, so the image is the order-3 subgroup. The subgroups of orders 2 and 3 generate ℤ/6. All three claims hold.
- The Check still discriminates: it refutes the statement of 2580 with "directed" dropped, in both halves, and it does not contradict the target, since the family is not directed (`⟨(12)⟩` and `A₃` lie in no common cyclic subgroup).

**Gate and Lean.**

- My gate rerun at this head prints `gate SchemeKTheoryOperations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate.md at this head also shows build=0.
- The dependency check prints `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line for this roadmap.
- `lake env lean` on Suggested.lean reports only `declaration uses sorry` at 57:8.
- A scratch `#check @name` file importing the module elaborates the three declarations. Their types equal signatures.md and r6: `exists_strictlyPerfect` keeps `CompactSpace`, `QuasiSeparatedSpace`, `HasDerivedCategory`, the finite-type quasicoherent-quotient hypothesis and `IsPerfectComplex X E`. No binder is lost; nothing changed.
- A second scratch file importing `TauCeti.RepresentationTheory.Homological.GroupHomology.DirectedUnion` elaborates `groupHomology.exists_map_subtype_eq` and `TauCeti.groupHomology.exists_chainsMap_subtype_f_eq_of_directed`, the two Tau Ceti names of the *Needs:* line at 2582, with hypotheses `[Nonempty ι]`, `Directed (· ≤ ·) S` and `⨆ i, S i = ⊤`, and `groupHomology.chainsMap_f_map_mono` and `groupHomology.map` from Mathlib. The pins are those of lake-manifest.json (Mathlib 1b1ccf4, Tau Ceti 2fd255d).

**Suppliers, citations, ownership, overlaps.** The changed line cites no source, no roadmap and no library name, so no citation changes. The citations tool lists no cross-roadmap citation that resolves nowhere; its six Lean-name leads lie in untouched text that r2–r6 passed (`exists_strictlyPerfect` is declared in Suggested.lean; the other five are README-only names of targets, as before). The overlaps tool lists no open pull request changing this roadmap, no dropped id and no id only an open revision defines. The changed Check introduces no object another roadmap could own.

**Headlines and padding.** Suggested.lean is unchanged since r4, so the headline list, the not-statable docstring and the r4 one-tactic padding probe stand.

**Seeded sample.** None of the 15 seeded subsections (1.1, 1.6, 1.7, 2.3, 2.5, 2.7, 4.1, 4.10, 5.2, 5.4, 5.5, 5.6, 6.6, 6.9, 7.3) contains a changed passage; the change is in §6.7. Their rows are carried below from r5, which carried them from r2. The README flags no locator as unverified.

**Adversarial table: the changed statement.** Fresh computations at this head.

| Statement | Instances tried | Values computed on the two sides / negative control | Result; change |
| --- | --- | --- | --- |
| Directedness control, degree 1, Check 2588 | S₃, cyclic subgroups | H₁(A₃)=ℤ/3→H₁(S₃)=ℤ/2 is 0 and A₃ lies in no larger member (injective half fails); sign(12)=−1, so H₁(⟨(12)⟩)=ℤ/2→ℤ/2 is onto (surjective half holds) | Correct |
| Directedness control, degree 3, Check 2588 | S₃, cyclic subgroups | H₃(S₃)=ℤ/6 (2-part H₃(C₂)=ℤ/2; 3-part H₃(C₃)^{inv}=ℤ/3 since inversion acts by (−1)²); member images: orders 2 (each ⟨(ij)⟩), 3 (A₃), 1 ({1}); union {0,2,3,4} misses 1 and 5 | Surjective half fails; r6 R01 repaired |
| Transfer sentence, Check 2588 | ⟨(12)⟩ (index 3), A₃ (index 2) | cor∘res = ×3 on ℤ/6 is iso on the 2-part, so im H₃(⟨(12)⟩) = order-2 subgroup; cor∘res = ×2 iso on the 3-part, so im H₃(A₃) = order-3 subgroup; ⟨2⟩+⟨3⟩=ℤ/6 | Correct |
| Check versus target 2580 | Same family | ⟨(12)⟩ and A₃ have no common cyclic upper bound: family not directed, so the target makes no claim about it | Consistent |

**Adversarial table: §6.7 statements unchanged by this diff, carried from r6.** Carried verbatim from packages/SchemeKTheoryOperations/reports/PRREVIEW-SchemeKTheoryOperations~6.md (r6, at 78121a2); line numbers are unchanged.

| Statement | Instances tried | Values computed on the two sides / negative control | Result; change |
| --- | --- | --- | --- |
| Directed union, injective half, 2580, Check 2586 | `GL(ℤ)=⋃GL_n(ℤ)`, m=1, A=ℤ | `E₁₂(1)` mod 2 fixes (1,0) and swaps (0,1),(1,1): sign −1, so `[E₁₂(1)]≠0` in `(ℤ/2)²`. det=1, so it is 0 in `K₁(ℤ)`. In GL₃, `E₁₃(1)E₃₂(1)E₁₃(−1)E₃₂(−1)=E₁₂(1)` (computed) | r6: Correct; j=3 serves |
| Directed union, colimit value, 2580 | m=1, `GL_n(ℤ)` for n=1,2,3,… | ℤ/2 → (ℤ/2)² → ℤ/2 → ℤ/2 → …; colimit ℤ/2 = `K₁(ℤ)` = `H₁(GL(ℤ))` | r6: Correct |
| Directed chain, Check 2587 | ℚ=⋃(1/n!)ℤ | Stage map is ×(n+1) on ℤ; colim H₁=ℚ=H₁(ℚ); colim H₂=0=Λ²ℚ | r6: Correct |
| Torsion union, 2580 | ℚ/ℤ=⋃(1/n!)ℤ/ℤ, A=ℤ | colim H₁=colim ℤ/n!=ℚ/ℤ=H₁; colim H₂=0=Λ²(ℚ/ℤ) | r6: Correct |
| Twisted coefficients, m=0, 2580 | G=ℚ, A=ℤ[ℚ] regular | `H₀(G_i,A)=ℤ[ℚ/G_i]`; colimit `ℤ[ℚ/⋃G_i]=ℤ=H₀(ℚ,ℤ[ℚ])` | r6: Correct with nontrivial A |
| Nonempty family, 2580 | G=1, empty index set | No member: colimit 0 ≠ H₀(1,k)=k. "G is the union" forces a member, as Tau Ceti's `[Nonempty ι]` does | r6: Correct |
| `GL(R)` comparison via directed union, 2590 | ℤ, m=1 (s=1, e=1) | n=2: (ℤ/2)²→ℤ/2 onto, kernel `⟨[E₁₂(1)]⟩`; n≥3: det iso ℤ/2→ℤ/2; colimit `K₁(ℤ)` | r6: Bijective from n=3; Kal80 p.287 uses the same colimit |
| Route sketch with c, 2590 | ℤ[x]: n=5, t=0, s=2; 𝔽₂: n=2, t=0, s=0 | ℤ[x]: c=1 while d=2. Length ≤c+ε+1=2 means k≤1=c+ε (Kal80 3.4). 𝔽₂: c=0; GL₂(𝔽₂) is transitive on the 3 nonzero vectors | r6: Correct |
| One-step stability, 2590 | 𝔽₂, m=1 (s=0, e=1) | n=1: 0→ℤ/2 not onto. n=2: ℤ/2→0 onto, not injective. n=3: 0→0 | r5→r6: Bounds 2 and 3 attained |
| Theorem 4.8 with P=Q=∅ | Kal80 p.287 | t=0, `G_n^∅∅=GL_n(R)` square of size n; onto at ≥2m+e−1, bijective at ≥2m+e | r6: Locator correct (page rendered) |
| Not-statable list, Suggested.lean:23–25 | Pins | CH_k at TauCeti/AlgebraicGeometry/Chow/Basic.lean; no Chern class of a vector bundle in Mathlib or Tau Ceti | r6: Accurate |
| Module row, README:55 | `#check` at the pins | Both names elaborate with `Directed`, `⨆ i, S i = ⊤`, `[Nonempty ι]`; class- and chain-level surjectivity | r6: Matches the row; re-elaborated this round |

The remaining r6 rows for §6.7 (hyperhomology, frame acyclicity, stable-range convention, m=0 and zero ring, Noetherian and semilocal forms, uniform N₀, GS99 K₀ step) stand unchanged in the r6 report; this diff touches none of their statements.

**Adversarial table: the seeded sections and the headline, carried from r5.** Carried verbatim from packages/SchemeKTheoryOperations/reports/PRREVIEW-SchemeKTheoryOperations~5.md (r5, at 6732a6a), which carried them from r2 (98204e2). This diff changes none of their statements; locate rows by section number.

| Statement | Instances tried | Values computed on the two sides / negative control | Result; change |
| --- | --- | --- | --- |
| 1.1 Strict perfectness | O(1) on P¹; skyscraper at 0 on A¹ | O(1): bounded and locally rank 1, hence true; skyscraper: local ranks 0 and 1, hence false | r2 (98204e2): Retain |
| 1.1 Local versus global summand | O(1) on P¹ | Hom(O(1),Oʳ)=0, although its local free rank is 1 | r2 (98204e2): Retain |
| 1.1 Zero and empty scheme | Zero complex; Spec(0) | Each term is zero; bounds [0,0] work; both predicates true | r2 (98204e2): Retain |
| 1.1 Term bounds versus acyclicity | O in all degrees ≤0; its identity cone | First has infinitely many nonzero Hⁱ; cone has Hⁱ=0 but infinitely many nonzero terms; strict predicate false for both | r2 (98204e2): Retain |
| 1.1 Cone and shift signs | k→0; k→k identity | Cone(k→0) has Euler −1; identity cone has 1−1=0 | r2 (98204e2): Retain |
| 1.1 Local lifting bound | P=N=k[0], M=0, a=1 | Claimed H-conditions hold, but id(k)≠0 cannot lift; P⁰≠0 violates the required lower term bound | r2 (98204e2): Retain negative control |
| 1.1 Surjective lifting | k²→k, first projection | Vector 1 lifts to (1,0); composite is 1 | r2 (98204e2): Retain |
| 1.1 Nullhomotopy | N=Cone(id Q), M=0 | Identity contraction gives every map P→N the zero homotopy class | r2 (98204e2): Retain |
| 1.6 Global strict headline | P¹ point; ℤ/n; empty scheme | [O(−1)→O] resolves the point; [ℤ→ⁿℤ] resolves ℤ/n; zero resolves empty scheme | r2 (98204e2): Retain Lean theorem |
| 1.6 Resolution-property necessity | Doubled affine plane | Naive bundle K₀=ℤ, perfect K₀=ℤ²; an origin class (0,1) cannot come from diagonal ℤ | r2 (98204e2): Retain hypothesis |
| 1.6 Derived isomorphism, not literal equality | E plus a contractible non-finite summand | H(E⊕Cone(id M))=H(E), but its terms need not be finite; Q(E⊕Cone(id M))≅Q(E) | r2 (98204e2): Retain conclusion |
| 1.7 Core truncation | Amplitude [0,0], k=𝔽₃ | Map(k,k) is discrete with 3 points; core has π₁=k×=C₂, so 1-truncated, not 0-truncated | r2 (98204e2): Retain +1 |
| 1.7 Enhanced versus triangulated gluing | Identity cover of Spec k | Descent object is k, endomorphism space has π₀=k and automorphisms k× on either side | r2 (98204e2): Retain enhanced carrier |
| 2.3 Proper transfer | P¹→Spec k, O(−1), O(−2), O(n) | Euler 0,−1,n+1, respectively | r2 (98204e2): Retain |
| 2.3 Finite locally free transfer | ℤ→ℤ[i] | Pushforward rank 2; transfer of a pulled-back rank r bundle is 2r | r2 (98204e2): Retain |
| 2.3 Proper alone not K-perfect | Spec k→Spec(k[ε]/ε²) | Pushforward k has infinitely many nonzero Tor groups, despite properness | r2 (98204e2): Retain perfectness condition |
| 2.3 Flat proper needs finite presentation | R=∏ℕk, I=⊕ℕk, Spec(R/I)→Spec R | All R-modules are flat; I is not finitely generated, so R/I is not finitely presented/perfect | r2 (98204e2): Retain |
| 2.3 Perfect is not coherent over arbitrary base | A=k⊕V, V²=0, V infinite-dimensional; differential e∈V\{0} | [A→ᵉA] is strict, but kernel=V is not finitely generated | r2 (98204e2): Retain separate K/G scopes |
| 2.5 Affine Cartan comparison | Finite projective A²; ℤ/n | Projective class 2[A] on both sides; Euler of ℤ/n=[ℤ]−[ℤ]=0 | r2 (98204e2): Retain supplied-map comparison |
| 2.7 Continuity | A=colim k[t₁,…,tₙ], matrix using t₁,t₂ | Matrix and its finite relations descend to stage 2; no bound is asserted for arbitrary infinite matrices | r2 (98204e2): Retain finite-presentation data |
| 2.7 Negative G vanishing | Noetherian dual numbers | G₋₁=0 by coherent dévissage; singularity does not force negative G | r2 (98204e2): Retain distinction from K |
| 4.1 Mayer–Vietoris and nonconnectivity | Nodal union with two components meeting twice | Rank-difference map ℤ²→ℤ² has diagonal image and cokernel ℤ in negative degree; truncating it would erase the obstruction | r2 (98204e2): Retain nonconnective grading |
| 4.1 Reduced presheaf condition | Constant Hℤ, including empty open | Value on ∅ is Hℤ with π₀=ℤ rather than 0; reducedness fails | r2 (98204e2): Retain hypothesis |
| 4.1 Brown–Gersten point case | One-point space | Sections and stalk both have πₙ=πₙ(E); if all stalk groups vanish, sections have 0 groups | r2 (98204e2): Retain |
| 4.10 Valuation lifting | D(t)→A¹ and valuation centered at 0 | t is nonunit at the center; there is no lift into D(t), so not a v-cover | r2 (98204e2): Retain |
| 4.10 Empty covers | ∅→Spec k; identity of ∅ | First fails lifting of Spec k; second has no valuation obstruction and both categories are zero | r2 (98204e2): Retain |
| 4.10 Derived Čech chart restriction | Invert a negative-degree generator with π₀-image 0 | The localized derived algebra can retain the inverted generator; base change through π₀ forces 0 invertible and gives zero | r2 (98204e2): Retain restricted chart theorem |
| 4.10 Amplitude detection | k and k[1] on a perfect point | Residue amplitudes [0,0] and [−1,−1]; the latter is excluded from the former stratum | r2 (98204e2): Retain |
| 4.10 h-to-v passage | Fixed [a,b], then all perfect objects | Core truncation bound b−a+1 is finite; no single bound works for complexes of arbitrarily large amplitude width | r2 (98204e2): Retain stratum-first passage |
| 5.2 Regular K homotopy | k→k[t] | K₀ is ℤ→ℤ, 1↦1; K₁ is k×→k× | r2 (98204e2): Retain regularity |
| 5.2 Laurent factor | k[t,t⁻¹] | K₁=k×⊕ℤ; t has coordinates (1,1), a constant a has (a,0) | r2 (98204e2): Retain |
| 5.4 Relative regularity | O on P¹ over any affine base | H¹(O(−1))=0, evaluation surjective; no field-only hypothesis is used for this example | r2 (98204e2): Retain relative extension |
| 5.4 Quillen resolution | O(1) on P¹ | T₀ has rank 2, T₁ rank 1; Euler reconstruction 2−L=[O(1)] | r2 (98204e2): Retain |
| 5.4 Regularity negative control | O(−1) with an unjustified regular presentation | Naive zero-section data would give 0 although [O(−1)]=L≠0; required regularity fails | r2 (98204e2): Retain |
| 5.5 Projective bundle basis | O(m) on P¹ | Coordinates (m+1,−m); rank (m+1)−m=1, Euler m+1 | r2 (98204e2): Retain |
| 5.5 Independence in rank 2 | 1 and L on P¹ | Rank/Euler columns (1,1),(1,0) have determinant −1 | r2 (98204e2): Retain |
| 5.6 Bass boundary | k[t,t⁻¹] | ∂[t]=1, ∂[a]=0 for a∈k× | r2 (98204e2): Retain |
| 5.6 Nil terms | A=k[ε]/ε² | 1+εt is nonzero NK₁ class; evaluation 0 gives 1, evaluation 1 gives 1+ε | r2 (98204e2): Retain evaluation-at-zero convention |
| 5.6 Iterated Laurent signs | Symbols [t][u] and [u][t] | Iterated oriented residues are +1 and −1 | r2 (98204e2): Retain grading signs |
| 6.6 Splitting principle | Rank 2 E with formal roots L₁,L₂ | λ_t(E)=(1+L₁t)(1+L₂t); determinant L₁L₂; no ordering enters the symmetric coefficients | r2 (98204e2): Retain |
| 6.6 Higher filtration bound | Regular d-dimensional X, degree m | Bound F_γ^(m+d+1)=0 is distinct from individual γ^j=0; at m=d=0 only rank remains and F¹=0 | r2 (98204e2): Retain full-filtration theorem |
| 6.9 Endpoint/Bockstein indexing | Two-cell Moore space S¹∪ₙe² | Coefficient K₂ has endpoints K₂/n and K₁[n]; shifting the Moore space would give a K₂[n] endpoint instead | r2 (98204e2): Retain degree-two construction |
| 6.9 Finite eigenvalue separation | ℓ=5, k=2, weights 0,1,2 | Eigenvalues 1,2,4; differences 1,2,3 are units mod 5 | r2 (98204e2): Retain |
| 6.9 Collision negative control | ℓ=3, k=2, weights 0,1,2 | Eigenvalues 1,2,1; first/last difference 0 | r2 (98204e2): Retain strict prime/weight-width bound |
| 6.9 Generalized versus honest eigenspace | T=[[2,1],[0,2]] | (T−2)≠0 but (T−2)²=0; a length-two extension need not be scalar 2 | r2 (98204e2): Retain integral endpoint/splitting inputs |
| 6.9 Coefficient product supplier | Hℤ/2; S/p² at odd p | Hℤ/2 has π₀=𝔽₂ and higher π=0; q=2,n=1 satisfies 2≥2 | r2 (98204e2): Repaired supplier contract |
| 6.9 Even-prime E₁ bound | S/8 | q=3,n=1 gives 2q=6=3(n+1); S/2 gives 2<6 | r2 (98204e2): Retain corrected supplier range |
| 6.9 A¹ representability | Spec k and A¹_k, degree zero | Both represented groups are K₀=ℤ; pullback sends 1 to 1 | r2 (98204e2): Retain regular scope |
| 6.9 Uniqueness cannot be tested only on points | ψ² versus identity on P¹ | Both fix rank; with L=1−h, ψ²(L)=1−2h while id(L)=1−h and h≠0 | r2 (98204e2): Retain natural operation on all smooth test schemes |
| 6.9 Trivial coefficient modulus | n=1 | Cofibre of identity on the sphere is 0; spectral coefficients and Moore mapping groups are both 0 | r2 (98204e2): Retain separate boundary case |
| 7.3 γ-valued character | h=1−L on P², L=O(−1) | ch(h)=1−exp(−H)=H−H²/2; positive H²/2 would be wrong | r2 (98204e2): Retain |
| 7.3 Newton normalization | Line root a, degrees 1,2 | Components a and a²/2; denominator 2 is invertible over ℚ, not automatically over ℤ | r2 (98204e2): Retain rational coefficients |
| 7.3 Associated-graded isomorphism | P¹ | K₀⊗ℚ=ℚ·1⊕ℚ·h maps to ℚ·1⊕ℚ·H by 1↦1,h↦H | r2 (98204e2): Retain |

r5's other carried rows, for the remaining sections of §§1.1–7.7 and the r3/r4 supplier and representation rows, stand unchanged in the r5 report, because this diff touches none of their statements.

**Remarks (no change requested).** None new. The r6 remark on the 108-character docstring line in Suggested.lean stands and needs no change.

## Not verifiable

- None in the changed passage: it cites no source. Kal80 is listed in the worker's scratch request as an unreadable image-only scan; no Kal80 locator changed in this diff, and r6 verified the changed ones of its round by rendering the GDZ pages. The request stays as the worker filed it.
- Lean coverage of §6.7, including the directed-union target and this Check, is README-only by design; the headline file states only §1.6.

## Source issues

- none
