## H01 (CBirkbeck) — applied

TauCetiRoadmap/EllipticKTheory/README.md:362, :675, :688 and :819 change the point-sheaf formulas from all closed points to codimension-one closed points; :676, :690 and :821 add the complementary `Spec F` calculations `[O_x]=1`, rank one and `[O_x]²=1`, retaining rank–determinant classification in dimension at most one. The codimension-one resolution gives determinant `O(x)` with positive sign, consistently with KTheoryLowDegrees §§12.2–12.3 and Weibel II.8.2.1, p. 146 (weibel line 8124 and line 8143); the other point-sheaf occurrences in §§2.2–2.7 and 3.3 already concern dimension-one curves.

## H02 (CBirkbeck) — applied

TauCetiRoadmap/EllipticKTheory/README.md:2208 replaces the one-vertex/one-loop calculation with the defined incidence graph: vertices `c,s`, two parallel branch edges, boundary columns `(-1,1)`, and kernel `ℚ·(e₁−e₂)`. Line 2212 uses the branch exchange to send that generator to its negative, giving nonsplit invariant dimension zero; split Frobenius fixes it, giving dimension one, and the type IV check still gives `3−4+1=0`.

## H03 (CBirkbeck) — answered

AlgebraicKTheory is an existing transitive prerequisite: SchemeKTheoryOperations' “Low-degree supplier comparisons” imports A2/A4 (TauCetiRoadmap/SchemeKTheoryOperations/README.md:64 and :68), and KTheoryLowDegrees §13.2 imports A5 (TauCetiRoadmap/KTheoryLowDegrees/README.md:1212); the open-roadmap inventory identifies its author as kim-em and head as `e5df75b`. The worker should add AlgebraicKTheory before these consumers in the transitive prerequisite inventory and replace the no-other-author claim with “The transitive prerequisites include AlgebraicKTheory by kim-em”; PR text is outside this job's permitted edits and was not changed.

---

Build command: `lake build TauCetiRoadmap.EllipticKTheory.Suggested`.
Build outcome: exit 0; `Build completed successfully (9059 jobs).` Seven expected warnings identify the seven admitted headline theorems.

Final gate outcome: exit 0.

```text
gate EllipticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency-direction output (exit 0):

```text
depcheck: 55 roadmaps, 630 edges, 0 problem(s)
```

No UPWARD or CYCLE line was emitted. The initial gate failed only because the repaired README was uncommitted (`dirty=1`); the final gate above ran after commit `538b4f8d`, `EllipticKTheory: review repairs (codimension-one point classes and nodal incidence checks)`. Only TauCetiRoadmap/EllipticKTheory/README.md changed; the worktree is clean and nothing was pushed.

**Elaborated signatures.** Every one of the 15 explicit declarations in TauCetiRoadmap/EllipticKTheory/Suggested.lean was checked with `#check @name` in a single scratch module, which elaborated and printed all 15 types without errors. Comparing those types with the README found no dropped hypotheses: the finite-field cardinality theorem retains ellipticity and `1 ≤ i`; the three model theorems retain number-field, finite-S, ellipticity and marked-minimality hypotheses; reciprocity retains the function-field and degree-one hypotheses; Bloch correction retains the positive annihilator, exact subgroup enumeration, support, divisor and residue hypotheses. No Lean declaration or signature changed: the repaired K₀ formulas remain README targets because scheme K-theory carriers are absent at the pins, and the graph computations remain README Checks.

**Ownership and citation checks.** Main was checked at `a8132fb`; the citation resolver found no unresolved cross-roadmap citations or roadmap Lean names against main and the indexed open heads. The affected supplier contracts were read directly: KTheoryLowDegrees at `d7c04da`, SchemeKTheoryOperations at `88dbd5a`, and AlgebraicKTheory at `e5df75b`; rank–determinant classification and point-divisor classes remain owned by KTheoryLowDegrees §§12.2–12.4. StableReduction Layer 1 supplies normalized components, nodes and branches, while NeronModelsAndSemistableAbelianVarieties §4.2 explicitly distinguishes equal boundary columns for parallel edges and §5.3b supplies the elliptic-fibre configurations; §6.10 here uses that geometry for its existing fibre G₁ theorem and adds no generic graph construction.

Object searches covered main and the open-roadmap index, the board packages, all 53 named sibling roadmap folders (106 README/Lean files), and the pinned Mathlib/Tau Ceti sources. The sibling search found no competing owner for these repaired formulas or the fibre G₁ theorem; unrelated perverse skyscraper statements do not concern coherent point classes in K₀. No construction, dependency edge, declaration name or ownership was added or moved. The pins agree with the content manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Mathlib/Algebra/TrivSqZeroExt/Basic.lean:408 defines multiplication by `(rs,rM+sL)`, and :424 states its second-coordinate formula; it contains no scheme rank–determinant comparison. The generic skyscraper sheaves in Mathlib/Topology/Sheaves/Skyscraper.lean:60 likewise do not supply that coherent K-theory comparison.

**Source scope.** The repair uses Weibel's legal cached text at weibel line 8124 and line 8143 and the existing supplier statements, together with the explicit linear algebra below. Weibel's proposition itself assumes dimension one and separatedness; the retained nonseparated generality is supplied by KTheoryLowDegrees §§12.1–12.2, and its dimension-zero specialization is the field calculation, also singled out in that supplier's §12.3. Young's Theorem 3.3, p. 41 remains cited by its settled waived locator; its text was not independently certified. No new source, manifest entry or missing-reference request was needed.

**Adversarial mathematics record.** The table records the repaired statements and their surrounding identities and conventions, followed by all 15 explicit Lean declarations; each row gives concrete values rather than treating elaboration as a proof. In the K₀ rows `(r,d)` denotes rank and determinant degree on the projective line; a trivial Picard class over a field is written `O`. The graph matrices have vertices as rows and branch edges as columns, with boundary target minus source and coefficients ℚ, even in residue characteristic two.

| Statement | Instances tried | Computed values on the two sides or competing models | Result | Change |
| --- | --- | --- | --- | --- |
| Supplier rank–determinant classification, dimension zero | Spec 𝔽₂ and Spec ℚ | Pic=0; K₀=ℤ; rank–det sends 0,1,2 to (0,O),(1,O),(2,O) | Classification survives dimension zero | Retain dimension ≤1 |
| Supplier inverse `(n,L)↦(n−1)[O]+[L]` | Field, n=−1,0,1,2 | −2+1=−1; −1+1=0; 0+1=1; 1+1=2 | Negative and zero ranks agree | None |
| Codimension-one point resolution | Rational x on ℙ¹ | [O]−[O(−x)]=(1,0)−(1,−1)=(0,1) | Rank 0 and positive determinant degree 1 | Qualify supplier and §2.1 |
| Point-divisor formula at a nonrational point | x=V(t²+1) on ℙ¹ over ℚ | [O]−[O(−2)]=(1,0)−(1,−2)=(0,2) | Residue degree two retained | None |
| Complementary codimension-zero point | Unique x of Spec F | O_x=F=O_X; rank F=1; determinant is O_X | Old rank-zero formula gives 0 instead of 1 | Add field Checks |
| Effective Cartier requirement | Identity closed immersion Spec F→Spec F | Its ideal is 0; multiplication by its defining zero element is 0:F→F, with kernel F≠0 | Point exact sequence cannot be used here | Explicit exclusion by codimension |
| General square-zero product | Rank–degree pairs (2,3),(4,5) | Product (8,22), since 2·5+4·3=22 | Cross exponents agree with native product | None |
| Unit formula | (1,0) and (2,3) | (1,0)(2,3)=(2,3)=(2,3)(1,0) | Unit preserved in both orders | None |
| Product of a point class with itself | Rational x on ℙ¹ | (0,1)²=(0,0); derived self-tensor has equal Tor₀ and Tor₁ contributions 1−1=0 | Coincident points allowed | Qualify §2.6 and include x=y |
| Product of different point classes | Degrees 1 and 2 on ℙ¹ | (0,1)(0,2)=(0,0) | Same rule for nonrational points | Qualify §2.6 |
| Field point square | Unique x of Spec 𝔽₂ and Spec ℚ | [O_x]²=1·1=1; square-zero alternative gives 0 | Field case separates formulas | Add §2.6 Check |
| Line-bundle reduced square | L=O(3), O(−1), O on ℙ¹ | ([L]−1)=(0,3),(0,−1),(0,0); every square (0,0) | Rank-zero ideal, not all point sheaves, squares to zero | None |
| Determinant inverse | O(3),O(−3) | (1,3)(1,−3)=(1,0); determinants tensor to O | Negative exponents give correct inverse | None |
| Pullback naturality at a closed point | i:Spec F→ℙ¹, class [O_x] | i*([O]−[O(−x)])=1−1=0; derived fibre Euler value 1−1=0 | Naive ordinary tensor value 1 would be wrong | None |
| Connectedness and nonemptiness | Spec F⊔Spec F; empty scheme | Component ranks (1,0) are not one scalar rank; K₀(empty)=0, whereas ℤ⊕Pic(empty)=ℤ | Existing hypotheses exclude both failures | None |
| Regularity boundary | F[ε]/ε² versus F | Cartan sends a free rank-one module to length 2 in the first case, length 1 in the second | Nonreduced control is outside regular scope | None |
| Remaining point transfers in §3.3 | Rational and quadratic points on ℙ¹ | Transfer coordinates (0,1) and (0,2); generic rank 0 in each case | Existing dimension-one curve convention suffices | None |
| Incidence-graph vertices and edges | Geometric irreducible nodal I₁ | Components=1, singular points=1, branches=2, hence V=2,E=2 | Distinguishes defined carrier from V=1,E=1 | Replace loop description |
| Incidence boundary sign | Both edges c→s | Each column is (−1,1); ∂e₁=∂e₂=s−c≠0 | Incidence rank is 1, not 0 | Replace zero-boundary claim |
| First homology of I₁ | Vectors e₁−e₂ and e₁+e₂ | B(1,−1)=(0,0); B(1,1)=(−2,2)≠0; kernel dimension 2−1=1 | Difference, not sum, generates | State actual generator |
| Split Frobenius | Identity branch permutation | F(1,−1)=(1,−1); fixed subspace dimension 1 | Rational fibre rank one | State generator action |
| Nonsplit Frobenius | Branch transposition | F(1,−1)=(−1,1)=−(1,−1); fixed scalar a satisfies 2a=0, hence a=0 over ℚ | Rational fibre rank zero | State actual edge permutation |
| Residue characteristic versus coefficients | Nonsplit node over characteristic 2, rational graph chains | Still (1,−1)↦(−1,1) over ℚ; fixed dimension 0, while mod-2 chains would give 1 | No unintended exclusion of p=2 | None |
| Type IV consistency | Three components meeting at one singular point | V=4,E=3, boundary rank 3, kernel 0; pairwise triangle has kernel dimension 1 | Existing negative control still discriminates | None |
| Type II consistency | One component, one cusp, one branch | V=2,E=1, boundary rank 1, kernel 0 | Additive rank zero | None |
| Good-fibre consistency | Smooth geometric fibre; good fibre over 𝔽₃ | V=1,E=0,H₁=0; K₁ order (3−1)²=4, rational dimension 0 | Graph and finite K₁ agree | None |
| Edge subdivision consistency | Subdivide one of the two I₁ edges | V=3,E=3, incidence rank 2, kernel dimension 1 | Retained cycle rank under subdivision | None |
| Comparison with collapsed loop | Contract one I₁ edge | Original boundary rank 1 with V=2,E=2; collapsed boundary rank 0 with V=1,E=1; both H₁ dimensions 1 | Equal homology does not identify graphs | Use original graph throughout Check |
| `EllipticScheme.geometricallyIntegral` | Cusp y²=x³ over 𝔽₂,𝔽₃ and extensions | Coordinate domain k[t²,t³] has dimension 1; both partials vanish at (0,0), but no zero divisors appear under field extension | Smoothness unnecessary for headline | None |
| `twistedFrobeniusKernel` | Zero; P=(0,0) on y²=x³−x over 𝔽₃ at i=1 | Zero annihilator m=1; P annihilator 2 with gcd(2,3)=1; 3P=P | Defining conditions include both | None |
| Twisted-kernel negative control | P=(0,1) on y²+xy=x³+1 over 𝔽₂ at i=0 | 2P=0 and P≠0, πP=P, but no odd m kills P | Prime-to-characteristic condition excludes wrong model | None |
| Twisted-kernel closure | Annihilator orders 2 and 3 at p=5 | Product 6 kills P+Q; gcd(6,5)=1; same order kills −P | Native subgroup proof agrees with definition | None |
| `card_twistedFrobeniusKernel` | y²=x³−x over 𝔽₃ and 𝔽₅, i=1 | Counts 4 and 8 give a=0 and −2; order polynomials 1+27=28 and 1+10+125=136 | Trace sign and exponents agree | None |
| Cardinality endpoint | Ordinary y²+xy=x³+1 over 𝔽₂ at i=0 | #E(𝔽₂)=4; prime-to-2 fixed subgroup has order 1; untwisted polynomial gives 4 | i≥1 cannot be dropped | None |
| Characteristic-two ellipticity | y²=x³−x over 𝔽₂ | Discriminant 64=0; rational point count 3 | This equation cannot instantiate elliptic cardinality theorem | None |
| Frobenius/twist convention | y²+x y=x³+1 over 𝔽₂, nonzero rational 2-torsion | πP=P but 2πP=0≠P at i=1 | Twisted equation differs from untwisted one | None |
| `RegularProperModel` | Field base O=F, identity marking; twisted absolute marking over ℚ(s) | Generic triangle id≫toField=toField; twist s↦s+1 induces different map on s | Over-F marking fixes intended carrier | None |
| Regular total space versus singular fibre | 37a1 at (5,18) over 37 | F=y²+y−x³+x=222=6·37, not divisible by 37²; fibre derivatives vanish mod37 | Regular model can have nodal fibre | None |
| `RegularProperModel.genericFibreInclusion` | O=F, identity marking | Inverse marking followed by pullback projection is id_C | Source and direction agree | None |
| `RegularProperModel.Hom` | Identity versus elliptic involution on 37a1 | Generic (0,0) maps to (0,0) versus (0,−1) | Fixed marking admits identity and rejects involution | None |
| `RegularProperModel.IsMinimal` | Smooth proper model and its point blow-up | Blow-down has one exceptional fibre ℙ¹, hence is not an isomorphism; blow-up fails outgoing minimality | Minimality has correct direction | None |
| `exists_minimalRegularProperModel` | 37a1, F=ℚ, S={37} | Discriminant 37 becomes a unit; smooth proper model has generic fibre E and no exceptional (−1)-component | Existence includes finite nonempty S | None |
| `locallyMinimal_terminal` | Same minimal M; X=M and X=Bl_x M | Unique marked maps id and blow-down b; b contracts ℙ¹ to x | Arrows go X→M | None |
| `minimal_unique` | Two copies of same marked minimal M | Unique marked isomorphism id; involution changes (0,0) to (0,−1) | Isomorphism uniqueness includes marking | None |
| S-integer convention | F=ℚ, S=∅,{2},{2,3} | Rings ℤ,ℤ[1/2],ℤ[1/6]; 1/2 absent from first, present in latter two | Inclusion direction fixed | None |
| Universe convention | Field and model in Type u | Total scheme in Scheme.{u}; elaborated model carrier in Type (u+1) | Section universes retained | None |
| `tameValue` | Uniformiser t, unit 2, over ℚ | ∂{2,t}=2, ∂{t,2}=1/2; for t,t the value is −1 | Left-linear/inverse-K-book sign fixed | None |
| Tame-value residue well-definedness | f=tᵃu,g=tᵇv, (a,b)=(2,−3) | Order of quotient is ab−ba=−6−(−6)=0 | ResidueUnit receives a unit | None |
| `SymbolCandidate` | Singleton (t,1−t); empty candidate | Formal coefficient at pair 1 versus 0, although both Milnor classes vanish | Formal carrier is not the quotient K₂ | None |
| `SymbolCandidate.tame` | [(2,t)]−[(3,t)]; zero candidate | Product 2·3⁻¹=2/3; empty product 1 | Integer coefficients and neutral value agree | None |
| `tame_last_point` | Steinberg {t,1−t} on ℙ¹, last point ∞ | Tame values at 0,1,∞ all 1; degree-one norm sends 1 to 1 | Last rational value recovered | None |
| Last-point degree hypothesis | {x−1,−1} on y²=x³+1 over ℚ | At x=1, residue extension ℚ(√2) has degree 2; value −1, norm (−1)²=1; infinity value (−1)²=1 | Norm one does not imply value one | None |
| `blochCorrection` | y²=x³−x over ℚ, T={O,(0,0)}, C=2, f=x,g=2,f_P=x,c_P=1/4 | At P: raw squared residue 1/16, correction 16, product 1; at O: 16·1/16=1; elsewhere 1 | Actual elliptic functions verify sign and factor | None |
| Bloch correction, trivial group | T={O}, S=∅, C=1, constant f,g | All orders 0; every tame value 1; correction sum empty | Degenerate subgroup included | None |
