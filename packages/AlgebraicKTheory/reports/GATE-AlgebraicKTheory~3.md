# GATE-AlgebraicKTheory~3: answers to the review of `8881692`

One review (rwst, 2026-10-29). Points are numbered in the order the review makes them. N1 makes two points (the cycle and the duplicate theorem), so it is H01–H02. The status notes on R01, R02 and R04–R08 ask for nothing in these files and are folded into H11 with the follow-ups. Line numbers refer to the repaired README at commit `1247930`.

## H01 (rwst) — applied
The OperatorKTheory cycle is broken in the direction the review proposes: A8 no longer consumes OperatorKTheory, and the ownership paragraph (README :17) now says OperatorKTheory is a consumer that owns every C*-algebra comparison. The three C* clauses were deleted from A8: the K2 unitary identification and the K1 category/K₀ identification (old :133), and the K3 hypotheses sentence (old :135). A8 keeps the stable component group K₁ᵗᵒᵖ(A)=colim GLₙ(A)/GLₙ(A)₀, the surjection K₁ᵃˡᵍ→K₁ᵗᵒᵖ with its kernel, and the exponential-lifting and small-ball statements on BanachAlgebras A2 (README :134–136).

Evidence for the cycle: OperatorKTheory README at `d1b2465` :221 ("Consume AlgebraicKTheory A1–A2 and A8") and :328 ("compare ∂₁ with AlgebraicKTheory A6/A8"), and :232 already compares A8's construction with K2's unitary model. A8 previously consumed K1–K3. The same pattern in A7 was also repaired: "OperatorKTheory/TopologicalKTheory supply the topological boundary/Bott comparison" (old :127) → "the reduced class is read in TopologicalKTheory T4's `K(S²)≅ℤ[β]/(β²)`" (README :128; TopologicalKTheory on main, T4 item 7). A grep of README and Lean files now finds OperatorKTheory only in the ownership sentence at :17.

## H02 (rwst) — applied
The duplicate pullback comparison was deleted from A8 (old :135: "For a pullback square of unital C*-algebras … with the convention δ=[M(u)]−[Dⁿ]"). README :17 assigns it to OperatorKTheory K3, which states it at `d1b2465` :328–332 with the same `[(XeX⁻¹,e)]−[(e,e)]` lift and `[M(u)]−[Dⁿ]` normalisation. A8 now ends with "No six-term cyclic sequence or Bott continuation is asserted for arbitrary rings from A6" (:136).

## H03 (rwst) — applied
"in the sense of StableHomotopyKTheory §3.29" was deleted from A5 (README :96), which already spells out the three conditions (surjective, central kernel, exactly one lift over E∞ to every central extension). The §3.29 supplier sentence at :19 is now "StableHomotopyKTheory consumes A0–A1 and compares its generic universal-central-extension predicate with A5's Steinberg statement; A5 states the three defining conditions directly and uses nothing from that roadmap". Evidence that StableHomotopyKTheory is the consumer: its README at `1475fb2` :56–58 ("From AlgebraicKTheory"), :1600, :1616 and :1649 consume A0–A1, and :1310 records the comparison with A5.

## H04 (rwst) — answered
After H01 and H03, HilbertModules is the only supplier that is not on main. A7 consumes its H2 (finite Parseval frames ⇔ finitely generated projective; README :225–235 at `c3a41ca`) and H5 (compact-X section modules; :418–422), and HilbertModules does not cite AlgebraicKTheory. Every other supplier is on main (TopologicalKTheory, BanachAlgebras, DifferentialGeometry, CharacteristicClasses) or a pinned library. The block the review asks for, `#889 → #861 → this pull request (#1142)`, agrees with the board merge order (VonNeumannAlgebras line 178, HilbertModules line 206, AlgebraicKTheory line 276). The pull-request text is outside this job's edit scope, so the worker has to add the block and the approval has to wait for #861.

## H05 (rwst) — applied
README :25: "build the ring isomorphism Mₙ(R)ᵐᵒᵖ≅Mₙ(Rᵐᵒᵖ) … (Mathlib's `Matrix.transposeRingEquiv` needs commutative entries). The targets kept here are that isomorphism, …" → "use the inverse of Mathlib's `RingEquiv.mopMatrix` (`Mathlib.Data.Matrix.Basic`, for any `[Mul α] [AddCommMonoid α]`) … which needs no commutativity. The targets kept here are the corner-module convention …". At the pin `f6090c7`, `Mathlib/Data/Matrix/Basic.lean`:654 defines `mopMatrix : Matrix m m αᵐᵒᵖ ≃+* (Matrix m m α)ᵐᵒᵖ`, `M ↦ op (Mᵀ.map unop)`, and its inverse is `M ↦ M.unop.transpose.map op`.

## H06 (rwst) — applied
README :98, last sentence: "The comparison of these degree-0, 1 and 2 groups with the ordinary ring K-spectrum belongs to GeometryOfNumbersAndQuadraticArithmetic §6.1.7 and §6.10, …" → "The comparison of this Steinberg K₂ with π₂ of the ordinary ring K-spectrum belongs to GeometryOfNumbersAndQuadraticArithmetic §6.1.7 and §6.10, and the comparisons in degrees 0 and 1 to GeneralAlgebraicKTheory §3.14 (see the ownership paragraph)". This was checked at the heads: GeometryOfNumbersAndQuadraticArithmetic `cb1195a` :2240 (π₂ with A5's Steinberg kernel) and :3147 (§6.10 retains π₂); GeneralAlgebraicKTheory `f16a788` :658–664 (§3.14, `ringKGroup.zeroEquiv`, `ringKGroup.oneEquiv`).

## H07 (rwst) — applied
README :31: "the native sphere tangent-space adapter is supplied by [DifferentialGeometry Layers0/11]" → "no tangent-bundle adapter is needed, because DifferentialGeometry 11.1 (`exists_eq_zero_of_inner_eq_zero`) is stated for exactly such fields", and "contradicting DifferentialGeometry11's hairy ball theorem" → "contradicting DifferentialGeometry 11.1, the hairy ball theorem `exists_eq_zero_of_inner_eq_zero`". On main, DifferentialGeometry `Suggested.lean`:3096 takes continuous `w : sphere → E` with `⟪w x, x⟫ = 0` and `Even n`, `finrank E = n+1`, which is P's description at n=2. The C7 adapter TSⁿ≅x^⊥ (CharacteristicClasses README :1557–1561, under C7) is now cited at the one place that uses it, the Chern-number comparison at :39.

## H08 (rwst) — applied differently
Both Rieffel attributions were replaced by locators in a text that could be read: :35 "Rieffel's p87 tangent-section example" → "the real tangent-section example above", with :31 now citing Weibel, The K-book, Chapter I, Example 1.2.2; and :43 "from Rieffel's C*-algebra notes p7" → the Möbius bundle as the nontrivial real line bundle on the circle, every complex bundle on the circle being trivial (Weibel, Chapter I, (4.9.1)). The References entry (:140) now links Weibel's author page and gives both locators. Adding Rieffel entries was not possible: "p87" and "notes p7" identify no work. The only candidate found (student notes of Rieffel's Berkeley Math 208, Spring 2013, on the note-taker's university page) returns HTTP 404, so its contents could not be checked. The examples are fully specified in the README with their own proofs, so no unreadable text is needed.

Evidence: `Weibel-KBook` Chapter I file, lines 100–110 (Example 1.2.2, the same module over the polynomial coordinate ring of S², non-free by the hairy ball theorem) and lines 1476–1479 ((4.9.1), p. 32).

## H09 (rwst) — applied
A3 (README :82) now constructs δ and proves exactness at K₀(T) and K₀(C) for summand-dense T ("For T full and summand-dense construct the boundary …" → "For summand-dense T construct the boundary …"). Exactness at K₁ᴮ(D) is kept for full summand-dense T, proved by a new equality criterion: for full T, two triples have the same class iff they become isomorphic after adding identity triples. :19 was updated to match: GeneralAlgebraicKTheory §4.16's boundary is A3's, and its §4.17 extends A3's exactness at K₁ᴮ(D) beyond full functors.

Why fullness is not needed for δ: the composition relation gives (P,σβσ⁻¹,P)=(P,σ⁻¹,P)+(P,β,P)+(P,σ,P)=(P,β,P), and two complements are compared on T(P⊕P′)≅X⊕Y⊕X⊕Y′ by the swap of the two X's. This agrees with Weibel, who states (2.10.2) for cofinal T (`Weibel-KBook` Chapter II lines 627–635; Ex. 2.17 lines 775–781 are "when T is cofinal"). The new Check at :80 is the negative control: for ℤ→ℚ, which is summand-dense but not full, (ℤ²,diag(2,1/2),ℤ²)=0 in K₀(T), yet it is not stably isomorphic to an identity triple.

## H10 (rwst) — answered
The pull-request body is outside this job's edit scope; the worker has to replace it. At `1247930` the accurate facts are:
- A4 owns covering dimension (:17, :89–91).
- A3 owns K₀(T) and K₁ᴮ's boundary (:19, :73, :82).
- A8 consumes no OperatorKTheory and A5 no StableHomotopyKTheory.
- Suggested.lean was edited (one docstring bullet in this round).
- `Suggested.lean`, `MobiusSectionTargets.lean` and `SphereComplexificationTargets.lean` hold 10, 3 and 2 `sorry`s respectively.
- The two section-example Lean files are linked from README :39 and :49.

## H11 (rwst) — answered
The follow-ups are edits to #903, #866, #1212 and #851, and the status notes on R01 and R02 need nothing here.

After this round, #866 has to take over three comparisons:
- **K2:** already done at `d1b2465` :232.
- **K3:** the pullback comparison is already at :328.
- **K1:** the identification of its finite projective category and projection K₀ with A0's Proj(A) and K₀(A) is still missing; its K1 at :118–124 builds its own category.

With H09, #1212 §4.16's summand-dense boundary is now literally A3's, so §4.16 can consume it instead of extending it.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| :25 `RingEquiv.mopMatrix.symm`, op(g)↦gᵀ with entries in Rᵐᵒᵖ | R=ℍ, n=2, g=E₁₂(i), h=E₂₁(j); wrong model g↦g entrywise | op(g)op(h)=op(hg)=op(E₂₂(ji))=op(E₂₂(−k)) ↦ E₂₂(op(−k)); gᵀ·hᵀ=E₂₁(op i)E₁₂(op j)=E₂₂(op(ji))=E₂₂(op(−k)). Untransposed: E₁₂(op i)E₂₁(op j)=E₁₁(op(−k))≠E₂₂(op(−k)) | transpose needed and multiplicative; untransposed model excluded | cite Mathlib, target deleted |
| :31 P=pR³ not free via DG 11.1 | x∈S², n=2 (Even); S¹ (n=1) control | tr p(x)=3−1=2, so rank 2; on S¹, v(x)=(−x₁,x₀) has ⟨x,v⟩=0 and is nowhere zero, so `Even n` is needed | holds at n=2, fails at n=1 as the hypothesis predicts | locator only |
| :82 δ for summand-dense T, independence of complement | conjugation σ∈Aut T(P); two complements Y,Y′ | (P,σ⁻¹,P)+(P,β,P)+(P,σ,P)=(P,σβσ⁻¹,P) and (P,σ⁻¹,P)+(P,σ,P)=(P,id,P)=0; swap of X-copies conjugates α⊕1⊕1⊕1 to 1⊕1⊕α⊕1 | no fullness used | δ generalized |
| :82 exactness at K₀(T), K₀(C) for summand-dense T | T=id; D=0; ℤ→𝔽₅; ℤ→ℚ; C=0→Proj(ℤ) (not summand-dense) | T=id: K₀(T)=0, sequence K₀(C)→^id K₀(C) exact. D=0: K₁ᴮ(0)=0, K₀(T)≅K₀(C) (pairs (P⊕S,Q⊕S) ↔ [P]−[Q]). ℤ→𝔽₅: K₀(T)=𝔽₅ˣ/{±1}=ℤ/2. ℤ→ℚ: kernel at K₀(T) = triples (ℤᵃ,α,ℤᵃ) = δ[ℚᵃ,α]. C=0: K₀(T)=0, and δ cannot even be formed for X=ℤ | exact in all summand-dense cases; non-summand-dense breaks at K₁ᴮ(D) (ker δ={±1}≠0=im) | hypotheses as stated |
| :82 equality criterion, T full | factor `[[0,α⁻¹],[α,0]]` with α=2 over ℚ; composition relation; ℤ→ℚ (not full) | [[1,½],[0,1]][[1,0],[−2,1]][[1,½],[0,1]]=[[0,½],[−2,0]], ×diag(−1,1)=[[0,½],[2,0]]. (βα⊕1)·[[0,α⁻¹],[α,0]]=[[0,β],[α,0]]=swap·(α⊕β). ℤ→ℚ: diag(2,½)⊕Iₘ has entry ½, so it is not in GLₘ₊₂(ℤ) | criterion holds with fullness, fails without | new target and negative Check (:80) |
| :82 exactness at K₁ᴮ(D), T full and summand-dense | T_I for ℤ→𝔽₅; T=id | δ[X,α]=0 ⇒ (P⊕S,β⊕1,P⊕S)≅(S′,id,S′) ⇒ β⊕1=T(g⁻¹f). ℤ→𝔽₅: ker δ = image of {±1}; 2∉{±1}, so [(ℤ,2,ℤ)]≠0 | consistent with the Check at :79 | kept for full T |
| :80 Check ℤ→ℚ | — | direct sum (ℤ,2,ℤ)+(ℤ,½,ℤ)=(ℤ²,diag(2,½),ℤ²); composition (ℤ,½·2,ℤ)=(ℤ,1,ℤ)=0 | true | added |
| :96 A5 universal central extension (citation removed) | R=0 | GL∞(0)=E∞(0)=1, xᵢⱼ(0)=1 so St=1, K₂(0)=0; the trivial extension of the trivial group is universal | three conditions hold | citation deleted |
| :134 K₁ᵗᵒᵖ(A)=colim GLₙ(A)/GLₙ(A)₀ and the surjection | A=ℂ; A=C(S¹,ℂ); A=0 | ℂ: GLₙ(ℂ) connected, K₁ᵗᵒᵖ=0, kernel = ℂˣ = K₁ᵃˡᵍ. C(S¹): K₁ᵗᵒᵖ=ℤ by winding of det, z↦1, surjective. 0: both groups 0. eᵢⱼ(ta) joins 1 to eᵢⱼ(a), so E∞⊆GL∞₀ and kernel = GL∞₀/E∞ | true; normality of GLₙ(A)₀ (identity component of a topological group) | C* clauses deleted |
| :128 A7 sphere class in TopologicalKTheory T4 | degree-one clutching z | class [L]−1=β in K(S²)≅ℤ[β]/(β²) (T4 item 7, main) | consistent | supplier changed |
| :19 / :98 ownership sentences | heads `f16a788`, `cb1195a`, `1475fb2`, `d1b2465` | §3.14 at :658–664; §6.1.7 at :2240; §3.29 :1310; K2 :232, K3 :328 | resolve | rewritten |

## Ownership, suppliers and direction

- **No notion moved down.** A5 needs no universal-central-extension predicate as a carrier: it proves the three conditions at the Steinberg instance, so nothing from StableHomotopyKTheory is restated as a target.
- **The C* comparisons moved up to the consumer.** They went from A8 to OperatorKTheory, which already states two of the three (H11).
- **Ownership against open pull requests** was checked with the roadmaps index (431 open PRs) for the objects touched: the relative triple group and its boundary (GeneralAlgebraicKTheory §§4.15–4.17), the universal central extension (StableHomotopyKTheory §3.29), the C* comparisons (OperatorKTheory K1–K3) and the stable component group (OperatorKTheory K2 :210–232, which consumes A8 for Banach algebras).
- **No `Suggested.lean` name** collides with a declaration of a readable roadmap: the resolver lists no unresolved names, and no declaration was added.
- **Depcheck** after the edits:

```
depcheck: 200 roadmaps, 1308 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

- **`roadmaps resolve`** on the README: no cross-roadmap citation or Lean name found nowhere.

## Lean signatures

The only Lean change is the A8 bullet of the module docstring of `Suggested.lean` (lines 29–31), which now matches the README's A8. `Suggested.lean` has no section `variable`s (only `universe u v`), and every binder of its 15 declarations (5 definitions and abbreviations, 10 theorems) is in the declaration's own signature. A separate `#check @name` scratch elaboration was not run: the brief allows only the `lake build` of this module as a Lean command, and the pre-supplied signature file was unavailable. The build elaborates all 15 declarations unchanged.

## Sources

- **Fetched as author pages** from Weibel's Rutgers K-book page:
  - Weibel, *The K-book*, Chapter II (`Weibel-KBook`: Def. 2.10 and (2.10.2) at lines 613–635, Ex. 2.17 at lines 775–781).
  - Weibel, *The K-book*, Chapter I (Example 1.2.2 at lines 100–110, (4.9.1) at lines 1476–1479). The fetch was keyed `Weibel-KBook-I`; it is the same work and should be recorded under the existing key `Weibel-KBook`.
- **Not readable:** student notes of Rieffel's Math 208 (HTTP 404). The citation was removed rather than requested, so `needs-references.toml` is empty and was deleted.
- **No `sources.toml` written:** the roadmap folder has none, and this job may edit only README.md and Suggested.lean.
- **No suspicious instructions** were found in the review text.

## Build and gate

`lake build TauCetiRoadmap.AlgebraicKTheory.Suggested`: `Build completed successfully (8999 jobs).` The 10 warnings are all `declaration uses 'sorry'` (lines 53, 72, 84, 95, 116, 129, 141, 148, 163, 171).

Gate at `1247930` (after commit):

```
gate AlgebraicKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Commit: `1247930 AlgebraicKTheory: review repairs (break OperatorKTheory/StableHomotopy cycles, mopMatrix, summand-dense boundary, locators)`, not pushed.
