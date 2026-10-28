# Review of LefschetzPencilsAndVanishingCycles (pull request #873 at 8f3e9b1)

**Verdict:** needs changes

## R01 (P2) — Exact support needs nonzero coefficients

Location: `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:2060`: “`R^nΦΛ` is supported exactly on `E`”. The coefficient convention at line 96 allows torsion rings killed by an invertible integer; it does not exclude the zero ring.

Claim: every smoothing of an ordinary quadratic point has nonzero middle vanishing stalk with these coefficients.

Witness: for `xy=π`, take `Λ=ℤ/1`. Then `E={node}`, but `RΦ(0)=0` and its support is empty. A module free of rank one over the zero ring is still zero.

Repair: state support contained in `E` for all allowed coefficients, and equality when `Λ≠0`. Keep the general coefficient convention. Add the zero-ring negative control. On this example the repaired containment is `∅⊆{node}`; for `Λ=ℤ/3` in residue characteristic two the node stalk is `ℤ/3(−1)` and equality holds.

## R02 (P2) — Remove the second branch-purity target

Location: `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:1272`: “Deduce `VanishingCycles.purityOfBranchLocus` from PurityOfBranchLocus §2.1”. The following pointwise theorem and global corollary reproduce the supplier's statements.

Claim: branch purity is a theorem to build again under a new name here.

Witness: `TauCetiRoadmap/PurityOfBranchLocus/README.md:319` and `:357`, on main, already own the pointwise criterion and the finite dominant generically étale global corollary, including the positive-dimension/separability qualifications.

Repair: delete this theorem target and its new declaration name; keep the existing supplier contract at lines 187–193 and cite those supplier sections directly in the tame-restriction target at line 1322. Retain the genuinely new residue construction. The finite étale example still follows from the supplier, while `𝔽_p(t)⊂𝔽_p(t)[u]/(uᵖ−t)` still fails generic étaleness: `Ω=L·du≠0`. No local wrapper theorem is needed to obtain either conclusion.

## R03 (P2) — Do not restrict constructibility to excellent traits

Location: `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:602` and `:610`: “an excellent henselian trait”; “recalled with exactly these hypotheses”.

Claim: excellence is part of the cited nearby-cycle constructibility theorem and of its proof requirements.

Witness: Illusie2006 lines 17–20 specify a henselian trait; lines 54–57 add finite type and assert constructibility and dominant trait change, without excellence. Illusie2021 lines 884–886 likewise state the finite-type constructibility result.

Repair: state the constructibility and dominant trait-change theorem over a henselian trait, retain the coefficient and boundedness conditions, and remove the claimed excellence requirement from this proof route and the scope paragraph. Do not remove excellence from separate alteration/purity targets which need it. Carry this generality into the uses of 0.7, including the scheme terms in 6.5. The identity family with constant `Λ` has `RΨΛ=Λ`, `RΦΛ=0` over every henselian trait; the corrected statement includes it without imposing an unrelated property of the base. This is a restriction of the general library's scope, not a counterexample to the restricted theorem.

## R04 (P2) — The dependency gate remains red; its reported edge appears spurious

Location: `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:208`, `:3089`, `:3254`; the gate reports an upward dependency on OrthogonalSpinGroups.

Witness: the required dependency run reports `UPWARD: LefschetzPencilsAndVanishingCycles (#58) -> OrthogonalSpinGroups (#287) at README lines [208, 3089, 3254]`. However, `TauCetiRoadmap/OrthogonalSpinGroups/README.md:651` on main already supplies the closedness/topology consumed here.

The review brief allows suppliers already on main regardless of the position of a revision in the merge order. Thus this output is evidence of a failing gate, but not evidence that this mathematical dependency is forbidden. The reported “cycle through LefschetzPencilsAndVanishingCycles” results from trying to move this roadmap past that already merged supplier.

Repair: have the worker reconcile the gate's supplier classification with the existing main roadmap, then rerun the gate. Preserve the citation to main; do not move or duplicate the orthogonal-group theory. Checking main resolves the concrete mathematical edge, but no passing gate has been produced here. This finding records the required gate failure; it does not ask the author to repair a nonexistent mathematical cycle.

## R05 (P3) — Remove names for undeclared interfaces and Checks

Location: `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:367` and `:391`, for example `VanishingCycles.OrientedFibreTopos` and `VanishingCycles.equivSheavesOnTrait_constant`.

Claim: the layer APIs and Checks advertise Lean declaration names. The “Names” convention at lines 123–126 explicitly treats them as intended future interfaces.

Witness: `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/Suggested.lean` declares one predicate and five theorems, none of these topos or Check identifiers. The same mismatch recurs throughout the layers.

Repair: express those API bullets and Checks in prose. Retain backticked own declaration names only for the six actual declarations; supplied library names remain citations. For the witness, say that the constant sheaf corresponds to `(Λ,Λ,id)`, with no proposed Lean name. Do not fill the Lean file with API declarations or Check theorems. This preserves the computed triple and removes the unsupported declaration claim.

## R06 (P3) — Give adic realization a third discriminating Check

Location: `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:646` and `:659`. The construction of integral/rational nearby complexes has only two Checks, and the second states equivariance rather than a computed distinguishing example.

Witness: the block at lines 659–662 contains exactly two bullets: the node stalk and the equivariant rational triangle.

Repair: retain the node calculation and add explicit smooth and torsion controls. For a smooth constant family, positive vanishing cohomology is zero. For the constant compatible integral torsion object `ℤ/ℓ`, derived reduction modulo `ℓ` has `H⁰=ℤ/ℓ` and `H⁻¹=ℤ/ℓ`, whereas underived reduction has only `H⁰`; rationalization is zero. These values distinguish derived realization from the ordinary-limit/underived-tensor shortcut.

## R07 (P3) — Mark the layers in the Lean acceptance test

Location: `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/Suggested.lean:41` through `:147`.

Claim: the file states targets from Layers 1, 2 and 5 but has no layer section comments.

Witness: the theorem declarations at lines 51, 83, 94, 108 and 129 cross those three layers without the required `/-! ## Layer k: ... -/` markers.

Repair: insert the three layer comments in README order before the first declaration of each layer. This changes no signature or proof obligation; the original six elaborated signatures remain the acceptance criterion.

## Verified sound

The review covered the complete 4,468-line README and the 149-line Lean file at the requested head. There was no previous review to reconcile. The diff outside `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles` is empty, and the checkout remained unchanged. No computational algorithm, copied source passage, sorry-valued data definition, `set_option`, or weakened geometric stand-in was found. This is a repairable review, not rejection of the roadmap's scope.

The worker's gate passed its text scanners and targeted build; only `depcheck=1` failed. Independently, `lake env lean` on the original file exited successfully with exactly five `sorry` warnings. The imported Tau Ceti object was present. A scratch copy with `#check @name` for all six declarations also elaborated: the henselian/DVR, coefficient-prime, roots-of-unity, continuity, nilpotence, finite-projective, local-rank, form, compactness/closedness and generation hypotheses were retained. No binder correction was needed. The scratch one-tactic probe tried `rfl`, `simp`, and `infer_instance` against each of the five admitted theorems; none closed. Object searches and inspection of the relevant pinned results found no single imported theorem giving one of these five headlines. No Lean padding finding is made.

The required dependency output was:

```text
not movable: LefschetzPencilsAndVanishingCycles consumes OrthogonalSpinGroups (#287) and is consumed by K2SymbolsBrauerPartII (#99), which comes first: moving LefschetzPencilsAndVanishingCycles after OrthogonalSpinGroups would put a supplier after a consumer, a cycle through LefschetzPencilsAndVanishingCycles
UPWARD: LefschetzPencilsAndVanishingCycles (#58) -> OrthogonalSpinGroups (#287) at README lines [208, 3089, 3254]
depcheck: 156 roadmaps, 1082 edges, 1 problem(s)
```

The six end results named in the Summary are Picard–Lefschetz (2.8), existence of pencils (3.4), Kazhdan–Margulis (5.8), perversity (6.2), the weight spectral sequence (7a.8), and local/global invariant cycles (7b.5/7b.11). The other deep results include arithmetic/geometric local monodromy, absolute purity, abelian-category monodromy filtrations, the even Clifford centre, conjugacy/generation/irreducibility, the orthogonal alternative and finite ADE case, the Frobenius polynomial theorem, duality and semistable monodromy. The five statable headlines are present. The module docstring identifies the missing geometric carriers for the other headlines, and explains the missing twisted/graded/admissible-filtration interfaces. The finite-projective, arbitrary-base Clifford statement extends the pinned characteristic-not-two field theorem; the abelian-category filtration extends the supplier's finite-dimensional linear algebra. Neither is merely the existing theorem renamed.

The following table records finite adversarial calculations, not proofs of the general theorems. A pass means no change is proposed on the displayed instances: they agree with the claim and its hypotheses; source certification is recorded separately. Zero objects, rank zero/one, dimensions zero/one/two, characteristic two, ramification, inseparability, nonreduced bases, empty indexing, opposite signs, and actual versus graded inertia are included where they affect the object. Here `J₂(e₁)=e₀`, `J₃(e₂)=e₁`, `J₃(e₁)=e₀`; unspecified vector-space coefficients are rational. `Λ` in positive-rank stalk calculations is nonzero with invertible torsion order.

| Statement | Instances and computed values on both sides | Result / change |
|---|---|---|
| Trait convention; arithmetic headline | A field has maximal ideal `0` and fails the pinned DVR condition `maximalIdeal≠0`; a DVR has nonzero maximal ideal. The zero representation has `(ρ−1)=0`. | Pass. |
| Frobenius and Tate convention | `N=[[0,1],[0,0]]`, `F=diag(1,3)`: `NF=[[0,3],[0,0]]=3FN`, whereas `FN` has upper-right entry `1`. On `(1)` geometric Frobenius is `1/3`, on `(−1)` it is `3`. | Pass. |
| Picard–Lefschetz convention | For `n=0,1,2,3`, the coefficient signs are `−1,−1,+1,+1`; self-pairings are `2,0,−2,0`. In even degrees the image of `δ` is `δ−2δ=−δ`. | Pass. |
| Filtration convention | `J₂`: graded dimensions at `−1,0,1` are `1,0,1`; `J₃`: at `−2,−1,0,1,2` they are `1,0,1,0,1`. | Pass. |
| Perversity convention | On the identity trait, constant `Λ[1]` restricts to `Λ[1]` generically; applying the total-space `RΨ[−1]` gives `Λ` on the closed point. | Pass. |
| Pencil convention | For a conic pencil of points, `dim X=1`, `n=0`, centre empty, and the generic fibre has two points. | Pass. |
| 0.1 tame-character comparison | If `σ(π^(1/m))=ζπ^(1/m)`, both characters give `ζ`; inverse convention gives `ζ⁻¹` (different for `m=3`). Ramification index `2` gives `2t_new`; wild inertia gives `0`. | Pass. |
| 0.2 gluing triples | Constant sheaf gives `(Λ,Λ,id)`; `j_*` of a nontrivial quadratic rational line gives `(0,ℚ_ℓ,0)`; empty `Y` has one sheaf object up to unique isomorphism. A proposed map `1↦1` from a trivial line fails `1=−1`. | Pass. |
| 0.2 geometric restriction | The quadratic generic line has underlying dimension `1` but invariant dimension `0`; exact restriction preserves the former. | Pass. |
| 0.2 oriented product | For `X=S`, the constant specialization is `id:Λ→Λ` and its cone is `0`; a ramified generic line still has nearby dimension `1`. | Pass. |
| 0.3 underived nearby functors | A constant triple maps to generic `Λ`; a sheaf supported only on the closed point maps to generic `0`; a ramified generic line remains a line. | Pass. |
| 0.4 cone and variation | Identity specialization has cone `0`, so both composites are `0=T−1`; for a two-point swap, `can(a,b)=a−b` and `Var(t)=(−t,t)`, giving `(b−a,a−b)=(T−1)(a,b)`. | Pass. |
| 0.4 covariance/cocycle | In the previous example `T²=1`; `Var(T²)=0=Var(T)+T Var(T)`. For tame parameters, `t(στ)=t(σ)+t(τ)`. | Pass. |
| 0.5 derived nearby/vanishing stalks | Smooth constant family: `(RΨ,RΦ)=(Λ,0)`; node: nearby ranks `(1,1)` in degrees `0,1`, vanishing ranks `(0,1)`; double point in relative dimension zero: ranks `2` and `1`. | Pass. |
| 0.6 functoriality | Identity base change gives identity maps; a disjoint union of two proper points has `H⁰=Λ²` before and after pushforward/nearby comparison. A smooth pullback preserves node stalk ranks. | Pass. |
| 0.7 constructibility | Smooth family has one constant nearby stratum and zero vanishing complex; node adds one rank-one skyscraper in degree one. Source's trait condition is henselian, versus henselian plus excellent in the target. | R03. |
| 0.7 coefficient/trait change | `ℤ/ℓ⊗ᴸ_ℤℤ/ℓ` has `H⁰=H⁻¹=ℤ/ℓ`; underived tensor has only `H⁰`. For index `e=2`, old tame parameter becomes `2t_new`; `e=1` gives identity. | Pass. |
| 0.8 realization | Node systems realize to `ℤ_ℓ(−1)` and then `ℚ_ℓ(−1)` in degree one; smooth vanishing systems realize to zero. Torsion `ℤ/ℓ` rationalizes to zero. | Correct examples; add discriminating Checks, R06. |
| 0.8a Betti comparison | Complex node `xy=t`: Milnor fibre has `H⁰=Λ`, `H¹=Λ`; algebraic nearby stalk has the same ranks, with `H¹` carrying `(−1)`. A positive loop sends a chosen root to `exp(2πi/m)` times it. | Pass. |
| 0.10 pointwise purity | Regular curve/closed point: supported cohomology is `Λ(−1)` in degree `2`; identity codimension-zero immersion gives `Λ` in degree `0`. | Pass. |
| 0.10 log actions/quotients | Trivial action on a smooth pair gives the same quotient and characteristic monoid `ℕ`; swapping two branches acts on `ℕ²` by swapping coordinates. | Pass. |
| 0.10 Galois semistable alteration | Already semistable `xy=π`: identity alteration has degree `1`, trivial group, and reduced crossing fibre. Empty bad locus stays empty. | Pass. |
| 0.10 equivariant log resolution | Regular SNC chart with trivial stabilizers has no singularity to resolve; identity map has degree `1`. A tame root chart of order `m` has inertia order `m`, versus order `p` in the excluded wild chart. | Pass. |
| 0.10 regular log blow-up | Regular cone with primitive basis requires no subdivision; the identity subdivision leaves `ℕ²` unchanged. In a singular two-dimensional cone, a nonbasis pair has lattice determinant greater than `1`. | Pass. |
| 0.10 log-smooth purity | Smooth relative dimension one has `f^!Λ=Λ(1)[2]`; the identity has `f^!Λ=Λ`. | Pass. |
| 0.10 prime-to-ℓ descent | Pullback followed by trace on a finite étale cover of degree `d` is `d·id`; for `d=2,ℓ=3` this is invertible, for `d=ℓ` mod `ℓ` it is `0`. | Pass. |
| 0.10 absolute purity | A regular divisor has class in degree `2` with twist `1`; codimension two gives degree `4`, twist `2`; codimension zero gives identity. | Pass. |
| 1.1 arithmetic monodromy | Trivial and unramified representations have `ρ(I)=1`; finite quadratic inertia is trivial on an open index-two subgroup. Over an algebraically closed residue field the roots extension has degree `1`, so the crucial infinite-extension hypothesis fails. | Pass. |
| 1.1 smooth-stage trait descent | Identity stage has fibre dimension unchanged and no extension of coefficients; smooth constant cohomology has inertia matrix `1`. | Pass. |
| 1.1 geometric local monodromy | Smooth constant family has `T=1`; nodal elliptic degeneration has `T=1+J₂`, `(T−1)²=0`, and `T−1≠0`. | Pass. |
| 1.2 twisted logarithm | `T=1+J₂`: `log T=J₂`, `exp J₂=1+J₂`; scaling tame generator by `2` scales the coordinate operator inversely. `NF=3FN` as above. | Pass. |
| 1.3 filtration definition and headline | `N=0`: `M_(c−1)=0`, `M_c=X`. For `J₂`, `N(M₁)=ℚe₀=M₋₁` and `M₁∩N⁻¹(0)=ℚe₀=M₀`. For `J₃`, `N²:gr₂→gr₋₂` is the identity in string bases. | Pass. |
| 1.3 scalar/conjugacy API | On `ℤ/4`, `N=2` has `M₋₁=M₀={0,2}`; multiplying by `2` gives zero and `M₋₁=0,M₀=ℤ/4`. Multiplication by the unit `3` leaves `N=2`. | Pass. |
| 1.4 strictness | `J₂`, index `−1`: `N M₁=ℚe₀=im N∩M₋₁`. Inclusion of a trivial line into `ker J₂` gives source step `0`, but image intersect target step `ℚe₀`. | Pass. |
| 1.4 primitive decomposition | `J₃` has `dim P₋₂=1`, other primitive dimensions `0`; its reconstructed grades each have dimension `1` at `−2,0,2`. Zero operator has only `P₀=X`. | Pass. |
| 1.4 sl₂ action | `J₂`: `[X,Y]=diag(−1,1)=H`; for `J₃`, raising coefficients are `0,2,2`. For `N=0`, all three operators are zero and the nonzero-H condition in `IsSl2Triple` fails. | Pass. |
| 1.4 tensor/dual rules | `J₂⊗1+1⊗J₂` has ranks `2,1,0` for powers `1,2,3` in characteristic zero: blocks `3+1`. In characteristic two its square is zero. Dual `−J₂ᵗ` has grades `−1,1`. | Pass. |
| 1.5 relative filtration | Weights `0,1` on a two-block would force `N M₁=0`, but actual image is `ℚe₀`; weights `0,2` give `M₀=M₁=ℚe₀`, `M₂=V`, and `NM₂=M₀`. | Pass. |
| 1.6 maximal unipotence | A nontrivial quadratic inertia line has eigenvalue `−1`, hence unipotent part `0`; `1+J₂` has unipotent part all of `V`. The trivial representation also gives all of `V`. | Pass. |
| 1.7 can/var normalization | For `J₂`, `exp(N)−1=N`, so the logarithmic correction has constant term `1`; for `J₃`, correction is `1+N/2` and product with `N` is `N+N²/2`. | Pass. |
| 1.8 branch purity | Inseparable field extension has no codimension-one points but `Ω=L·du≠0`; a finite étale map has `Ω=0`. | Supplier already owns these conclusions; R02. |
| 1.8 tame restrictions | Coordinate crossing has tame ℓ-quotient `ℤ_ℓ²`; constant sheaf has residues `(0,0)`. Two commuting unipotent factors give `[N₁,N₂]=0`; a wild p-root cover has degree `p`, excluded by tameness. | Pass. |
| 1.9 filtered-derived carrier | A two-term filtered object with one nonzero grade has successive cone zero except at that grade; forgetting the filtration loses the two different step positions. | Pass. |
| 1.9 two-component nearby complex | At the crossing: `gr₁=Λ_C(−1)[−1]`, `gr₀=Λ_D1⊕Λ_D2`, `gr₋₁=Λ_C[−1]`; `N:gr₁→gr₋₁(−1)` is `1`. Off the crossing the outer grades are `0`. | Pass. |
| 1.10 admissible filtrations/semisimple trace | `N=J₂`, `F=diag(1,3)`: invariant trace is `1`; semisimple trace is `1+3=4`. A ramified quadratic line has semisimple trace `0`; an unramified line with eigenvalue `a` has trace `a`. | Pass. |
| 2.1 ordinary forms | Over `𝔽₂`, `Q=xy` has polar matrix `[[0,1],[1,0]]`, determinant `1`; `Q=x²+y²` has zero polar matrix and a nonzero quadratic radical. Rank-one `Q=x²` has polar kernel rank `1`, quadratic radical `0`. | Pass. |
| 2.1 normal forms | Hyperbolic rank `2m` uses exactly `m` pairs; rank `2m+1` uses `m` pairs plus one square. For ranks `1,2,3` these are `z²`, `xy`, `xy+z²`. | Pass. |
| 2.2 Clifford headline | `Q=xy` over `𝔽₂`: even algebra/centre is `𝔽₂[t]/(t²−t)≅𝔽₂×𝔽₂`, rank `2`, derivative `−1=1`; it is Azumaya of degree `1` over its centre. | Pass. |
| 2.2 degeneracies/base change | Rank zero has even centre `R`, rank `1`, and fails positive rank. Over `ℤ`, `x²+y²` has polar matrix `2I`, not surjective. For hyperbolic `Q` over `k[ε]/ε²`, centre is `R×R`, still étale over `R` although `R` is nonreduced. | Pass. |
| 2.3 smooth quadric definition | Dimension `0` split quadric is two points; dimension `1` is a conic with geometric model `ℙ¹`; dimension `2` split quadric is `ℙ¹×ℙ¹`. | Pass. |
| 2.3 quadric cohomology | Betti ranks in even degrees are `(2)` for dimension `0`, `(1,1)` for dimension `1`, `(1,2,1)` for dimension `2`; odd ranks vanish. On the surface, `(a+b)²=2ab`. | Pass. |
| 2.3 affine quadric | `𝔾_m` has ordinary ranks `H⁰=H¹=1`, compact ranks `H¹_c=H²_c=1`; a smooth affine dimension-zero quadric has ordinary and compact rank `2`. | Pass. |
| 2.4 quadratic point definition | Node `xy=0` has degree-two tangent form `xy`; cusp `y²−x³` has quadratic term `y²` with nonzero radical in the tangent plane. | Pass. |
| 2.4 Tjurina module | `xy`: quotient by equation/partials is `k`, length `1`; `x²` in characteristic two gives `k[x]/x²`, length `2`. | Pass. |
| 2.4 henselian implicit theorem | Linear equation `y−a=0` has derivative `1` and unique solution `a`; `y²` in characteristic two has derivative `0` and no inverse-Jacobian argument. | Pass. |
| 2.4 henselian normal form | A node's quadratic equation is already `xy`; a term of total order at least `3` contributes zero to its two-jet. A linear term contributes nonzero one-jet and cannot be ignored. | Pass. |
| 2.4 versal deformation | Node smoothing `xy=b` has one Tjurina parameter; setting `b=0` restores the node. The characteristic-two double point has Tjurina length `2`, not `1`. | Pass. |
| 2.4 family equation | For `xy=π`, partial equations `x=y=0` force `π=0`; generic singular locus is empty. For `xy=0` the singular section persists generically. | Pass. |
| 2.4 non-smooth-locus corollary | In the node model the non-smooth locus has one closed point; after inverting `π` it is empty. | Pass. |
| 2.5 homotopy invariance | Constant `Λ` on `𝔸¹` has `H⁰=Λ`, higher ordinary cohomology `0`, the same as its vertex. | Pass. |
| 2.5 cone proposition | Two affine lines meeting at a vertex have constant ordinary cohomology `Λ` in degree zero; the disconnected punctured cone has two connected components. | Pass. |
| 2.5 Gysin sequence | Punctured affine line has `H¹=Λ(−1)`; the boundary to supported degree `2` at zero is an isomorphism of rank-one modules. | Pass. |
| 2.5 anticommutative boundary | In a two-direction complex the two orders of boundary are `ab` and `−ab`; their sum is `0`. With branch basis coefficient `1`, they give `1` and `−1`. | Pass. |
| 2.6 standard degeneration definition | `xy−π`: leading polar determinant `−1`, infinity two points; `x²−π`, `p≠2`: infinity empty, generic points two. In characteristic two `x²+y²−π` has polar rank `0`, so is excluded. | Pass. |
| 2.6 nearby-cycle computation | Node: nearby ordinary degrees `0,1`, compact degrees `1,2`, each rank `1`; double point: `Λ²/diag Λ≅Λ`; persistent cone: `RΦ=0`. | Pass. |
| 2.6 coefficient-compatible variation | On `ℤ/4`, `2·0=2·2=0`; on `ℤ₂`, multiplication by `2` is injective. Nodal coefficient `−1` reduces to `1 mod 2`, `3 mod 4`; ramification index `2` gives `0 mod 2`, `2 mod 4`. | Pass. |
| 2.6 even variation | With `ε=−1`, integer `(ε−1)/2=−1`; with `ε=1`, it is `0`. Reduction modulo two gives `1` and `0`, even though the two signs themselves coincide there. | Pass. |
| 2.6 odd variation | For `xy=π`, forget-supports middle map is `0` but variation coefficient is `−1`; base change `π=s²` gives coefficient `−2`. | Pass. |
| 2.6 geometric orientation | Modulo `15`, square roots of one are `{1,4,11,14}`; `4²·2=2 mod 15` although `4≠±1`. Modulo `60`, `19²=1` and `19 mod 15=4`. | Pass. |
| 2.7 concentration/support | Node with `Λ=0`: actual support `∅`, claimed support `{node}`. With `Λ=ℤ/3` in residue characteristic two, stalk is `ℤ/3(−1)` and support is `{node}`. | R01. |
| 2.7 even local theorem | `x²=π`, `p≠2`: swap sends `(1,−1)` to its negative and its norm is `2`. For `v(b)=2`, the quadratic character is `1`; for `v(b)=1` it is nontrivial. | Pass. |
| 2.7 characteristic two | `x²+πx+π=0` has generic derivative `π≠0`, special fibre `x²=0`, and a separable quadratic generic extension. The purely inseparable `x²=π` has derivative `0` and fails generic smoothness. | Pass. |
| 2.7 odd Picard–Lefschetz | For `n=1`, `δ²=0`, `T=1−N_δ`, `N_δ²=0`; for `n=3` coefficient is `+1`. On the node, local normalized variation sends the dual branch generator to `−δ`. | Pass. |
| 2.8 specialization sequence | Double point: `0→Λ→Λ²→Λ→0` has diagonal injection and difference quotient. A separating nodal degeneration has a local vanishing line but zero global vanishing class. | Pass. |
| 2.8 proper Picard–Lefschetz | Dimension zero reflection is the swap matrix; dimension one has `(T−1)²=0`. On degrees other than the middle, the displayed operator is identity. | Pass. |
| 2.8 direct images | Nonzero nodal δ gives middle stalk invariants `ker N`, dimension `1` in the two-block; when δ=0, the correction moves to degree `n+1`. | Pass. |
| 2.8 complex signs | Positive loop in a nodal curve gives `x↦x−(x,δ)δ`; in dimension two `δ²=−2` and `x↦x+(x,δ)δ` sends δ to `−δ`. | Pass. |
| 3.1 pencil definition | Conic axis off the conic has empty base locus, two-point general fibre and ordinary double critical fibres; an axis on the conic fails transversality. | Pass. |
| 3.2 dual variety | Plane conic in odd characteristic has dual conic; in characteristic two reduced dual is a line and Gauss degree is inseparable `2`; `X=P` has empty dual. | Pass. |
| 3.3 incidence blow-up | Empty centre gives `X̃=X`; blowing up a point of a surface introduces `ℙ¹` with self-intersection `−1`. | Pass. |
| 3.4 good axes | Degree-two line embedding is a conic: discriminant is binary quadratic and gives two critical parameters in characteristic not two. In degree two, the mixed coefficient is shared by two tangent-direction jet conditions. | Pass. |
| 3.4 Veronese/existence headline | `N=1,r=2`: target dimension `binom(3,1)−1=2`, map `[s:t]↦[s²:st:t²]`, hyperplane pullback binary degree `2`. For `r=0` the map is constant and is excluded. | Pass. |
| 3.5 low-dimensional/char-two comparison | A line pencil on a line has singleton fibres and zero critical set; conic axis meets the curve in zero points; characteristic-two dual has Gauss degree `2`. | Pass. |
| 3.5 finite-field descent | `ℙ¹_𝔽₂` minus its three rational points is nonempty but has `0` rational points and has points over `𝔽₄`. Eigenvalue `α=3` becomes `9` under degree-two extension. | Pass. |
| 3.6 arithmetic global monodromy | Artin–Schreier `y²−y=1/t` in characteristic two has inertia/global image `C₂`; the prime-to-two quotient would give `1`. Constant systems have image `1` at every finite level and at the limit. | Pass. |
| 4.1 pencil direct images | Conic pencil: `R⁰` has generic rank `2`, critical stalk rank `1`, and local swap invariants rank `1`; `n=0` is within the tame branch if `p≠2`. | Pass. |
| 4.2 vanishing subspace | Conic: transported span is `ℚ(1,−1)`; smooth degree-one pencil has span `0`; relabelling three sheets transports one difference to the other two. | Pass. |
| 4.3 fixed space | Dot product, `δ=(1,−1),c=−1`: operator swaps coordinates, fixed space `ℚ(1,1)=δ⊥`. Empty family/δ=0 gives `V=0⊥`. With `c=0,δ≠0`, fixed space is `V`, not `δ⊥`. | Pass. |
| 4.4 quotient/form | In symplectic `ℚ⁴`, `E=span(e₀,e₁,e₂)` has radical `ℚe₂`, quotient dimension `2`, determinant `1`. `E=span(e₀,e₂)` gives quotient dimension `0`. | Pass. |
| 4.4 trace preservation | Conic fibre: trace `(a,b)↦a+b`; swapping gives the same sum. Cup-trace pairing is `x₁y₁+x₂y₂`, unchanged by swap. | Pass. |
| 4.5 blow-up/Gysin formulas | Blow up `ℙ²` at one base point of a line pencil: fibre class `H−E`, with `H²=1,E²=−1,H·E=0`; restriction after fibre Gysin gives `(H−E)²=0`. A plus exceptional sign would give restriction `2`. | Pass. |
| 4.5 hypersurface application | Smooth cubic surface has ranks `(1,0,7,0,1)`; projective-space agreement is only outside middle degree. Smooth conic has ranks `(1,0,1)`. | Pass. |
| 5.1 Bertini monodromy | Conic complement has image `C₂`; a transverse punctured line maps `ℤ̂→C₂` surjectively. On a tangent line the double-cover equation becomes a square and the restricted image is trivial. Constant sheaf gives images `1=1`. | Pass. |
| 5.1 Frattini step | For `H=ℤ_ℓ`, `H₂=ℓℤ_ℓ`; a closed subgroup surjecting mod ℓ contains a unit and has closure `ℤ_ℓ`. `ℓℤ_ℓ` has residual image `0`, so fails the test. | Pass. |
| 5.2 conjugacy | For the two conic critical points, transported vanishing lines are both `ℚ(1,−1)` with generators differing by `±1`. If one transported cycle is zero, its entire orbit is `{0}`. | Pass. |
| 5.3 all-characteristic normal generation | In `S₃`, one inertia subgroup `⟨(12)⟩` has order `2`, normal closure order `6`; its conjugates generate `S₃`. For `C₂`, normal closure of the generator is `C₂`. | Pass. |
| 5.3 tame chosen generators | Conic punctured line: two boundary loops map to the same swap, with product `1`; image order `2`. For no boundary, `π₁(ℙ¹)=1`. | Pass. |
| 5.4 absolute irreducibility | Conic quotient is one-dimensional nonzero; every subspace is `0` or all. Zero quotient is handled separately. In a symplectic plane a single transvection fixes a line, so fails irreducibility. | Pass. |
| 5.5 middle reduction | For `n=1,m=0`, the corrected skyscraper twist `(m−n)=−1` has geometric Frobenius eigenvalue `q`; the opposite twist gives `q⁻¹`. For `q=3`, values are `3` versus `1/3`. | Pass. |
| 5.6 symplectic Lie algebra | On a plane, the two rank-one nilpotents and their bracket span dimension `3=dim sp₂`; one nilpotent alone spans dimension `1` and fixes a line. | Pass. |
| 5.7 compact subgroups | `ℤ_ℓ⊂ℚ_ℓ` has Lie dimension `1=1` and is open; `{0}` has dimension `0` and is discrete. `ℚ_ℓ⊂E` for `[E:ℚ_ℓ]=2` has rational Lie dimension `1`, not an E-line. | Pass. |
| 5.8 Kazhdan–Margulis headline | `SL₂(ℤ_ℓ)` is generated topologically by upper/lower integral unipotents, has Lie dimension `3=dim sp₂`, and is open; its two invariant-line candidates are distinct, leaving no common line. Dimension zero gives `Sp(0)={1}`, open. | Pass. |
| 5.9 wild characteristic-two branch | Three-sheet S₃ permutation representation has one chosen inertia fixed plane `x₁=x₂`; conjugating yields `x₁=x₃`, with common fixed line the diagonal. | Pass. |
| 5.9 generic wild irreducibility | On the trace-zero quotient of that permutation representation, dimension `2`, the standard S₃ representation is absolutely irreducible in characteristic-zero coefficients. A single transposition still fixes a line. | Pass. |
| 5.10 orthogonal headline | Rank-one norm-two root gives reflection `−1`, group `{±1}` of order `2`; rank zero with empty roots gives group `{1}`. Both satisfy the finite alternative. | Pass. |
| 5.10 finite ADE/trace | Norm-two roots with inner product `b=0,1,2` in dimension two give product traces `−2,−1,2`, respectively; `dim−4+b²` gives the same values, while printed `dim−2+b²` gives `0,1,4`. A₂ has Weyl group order `6`. | Pass. |
| 5.11 gcd lemma | A constant one-dimensional summand with eigenvalue `a` contributes `1−a^rT` on every degree-r fibre. On the vanishing A₁ line, coset eigenvalues `{b,−b}` have empty intersection in characteristic zero. | Pass. |
| 5.11 coset lemma | For `Sp₂`, matrices `1` and `−1` have disjoint spectra `{1}` and `{−1}`. An odd orthogonal determinant component alone can have a forced eigenvalue; the full orthogonal coset contains both components. | Pass. |
| 5.11 Frobenius polynomial headline | Smooth conic `X` with n=0: ambient polynomial `1−T`; smooth two-point fibres can have ` (1−T)²` or `1−T²`, whose common normalized factor is `1−T`. Zero vanishing space contributes polynomial `1`. | Pass. |
| 6.1 duality | On a geometric point, dual of the constant rational line is the same line, and nearby identity preserves it. For a smooth curve, dual constant object is `Λ(1)[2]`. | Pass. |
| 6.2 trait perversity definition | Constant `Λ[1]` on a smooth trait is perverse; `j^*Λ[1][−1]=Λ` and `i^*Λ[1]=Λ[1]` meet the glued bounds. | Pass. |
| 6.2 t-exact nearby cycles | Constant generic line on identity trait gives nearby `Λ` perverse on a point. For total-space `Λ[1]`, `RΨ[−1]=Λ`; omitting the shift gives `Λ[1]`, not degree-zero perverse. | Pass. |
| 6.2 vanishing-cycle exactness | For the smooth constant trait, `RΦ=0`; for closed skyscraper `i_*Λ`, generic part is `0` and `RΦ(i_*Λ)=Λ[1]`, so `RΦ[−1]=Λ`. | Pass. |
| 6.3 intermediate extension | Identity open immersion has `j_!*P=P`; constant smooth-family line extends to the same line, with no new closed-point subobject/quotient. | Pass. |
| 6.5 filtered-colimit criterion | On a point, colimit of `Λ^a` in degree zero is an infinite direct sum with `H⁰=Λ^(ℕ)`, other H=0; bound zero survives, finite constructibility does not. `Λ[a]` has cohomology at `−a`, no uniform lower bound. | Pass. |
| 6.5 tower/boundary theorem | Constant boundary system `(ℤ/ℓ,id)` has colimit `ℤ/ℓ`; zero transition maps give colimit `0`. On exterior degree j>0 in a ramified ℓ-tower, transition scalar `ℓ^j=0 mod ℓ`. | Pass. |
| 6.6 isolated singularities | Smooth relative curve has vanishing cohomology `0`; a node has one rank-one group in degree `1`. Shift by relative dimension moves that group to perverse degree zero. | Pass. |
| 7a.1 graph differential | Edge `0→1`: `d=[1,−1]`, supplier boundary transpose `[-1,1]=−d`; loop gives `d=0`; two parallel edges give identical rows and cokernel rank `1`. | Pass. |
| 7a.1 normalization resolution | Node stalk sequence `0→Λ→Λ²→Λ→0` has diagonal kernel/difference quotient; smooth stalk quotient is `0`; loop still has two branches. | Pass. |
| 7a.2 node nearby theorem | One branch: ranks `(1,0)`; two branches: `(1,1)` in degrees `0,1`. Inertia is `1` on both cohomology sheaves, though derived/global N can be nonzero. | Pass. |
| 7a.2 residue sign | Thickness one gives local coefficient `−1`; thickness two gives `−2`, still nonzero over `ℚ₂`. Reversing both dual branch bases leaves the same linear map. | Pass. |
| 7a.2 specialization sequence | One-loop rational fibre: dimensions `H¹(Y)=1`, `H¹(generic)=2`, edge term `1`, component boundary `0`. One bridge has boundary column `(1,−1)`, kernel `0`. | Pass. |
| 7a.2 component/graph cohomology | Rational nodal cubic: graph H¹ rank `1`, normalization H¹ `0`, H² rank `1`; two rational components with a bridge: H¹ `0`, H² rank `2`. | Pass. |
| 7a.3 graph factorization | Two parallel edges, cycle `(1,−1)`, thicknesses one: negative norm `−1−1=−2`; single edge thickness three has norm `−3`; off-diagonal edge pairings `0`. | Pass. |
| 7a.3 invariant cycles | Rational cycle: `rank N=1`, `dim ker N=1=dim H¹(Y)`; tree: `N=0`. Two-component H² specialization is `(a,b)↦a+b`, onto but not injective. | Pass. |
| 7a.3 monodromy filtration | Rational loop: grade ranks `(1,0,1)` at `0,1,2`; smooth genus g: `(0,2g,0)`; genus-one normalization with one loop: `(1,2,1)`. | Pass. |
| 7a.4 Jacobian comparison | Split multiplicative genus one: toric Tate line `ℚ_ℓ(1)`, graph quotient `ℚ_ℓ`, abelian part `0`. Smooth genus g: torus rank `0`, abelian Tate rank `2g`. | Pass. |
| 7a.4 pairing comparison | Two-edge cycle has `u₋=[−2]`, supplier `u₊=[2]`; both integral cokernels are `ℤ/2`. | Pass. |
| 7a.5 choices/base change | Reversing an edge changes its cycle coordinate sign twice in the pairing, leaving `n_e a_e b_e`; index e base change scales thickness and N by e. A length-two subdivision gives sum `1+1=2`. | Pass. |
| 7a.6 nodal examples | Tree b₁ `0`; one loop b₁ `1`; I₂ graph has two vertices/two edges, b₁ `1`, negative graph pairing `−2`. | Pass. |
| 7a.7 semistable stalks | a=1,2,3 branches give exterior-algebra ranks `(1)`, `(1,1)`, `(1,2,1)`; for a=3, degree three is `0`. | Pass. |
| 7a.7 graded complex | Two components give outer grades `Λ_C(−1)[−1]`, `Λ_C[−1]` and central sum of two component sheaves; smooth one-component model has only central grade. | Pass. |
| 7a.8 spectral-sequence headline | Smooth model: only column p=0. Curve: terms at `(−1,2),(0,1),(1,0)` are node `H⁰(−1)`, component H¹, node H⁰. For d=1, columns are `−1,0,1`, and page 4 is certainly stable. | Pass. |
| 7a.8 nonproper abutment | `𝔸¹_S` minus special origin: special fibre `𝔾_m` has nearby H¹ `ℚ_ℓ(−1)`; generic fibre `𝔸¹` has H¹ `0`. | Pass. |
| 7a.8 differential | For three components, alternating coboundary of `(a₀,a₁,a₂)` gives pair differences; next boundary is `(a₁−a₂)−(a₀−a₂)+(a₀−a₁)=0`. Smooth model has d₁=0. | Pass. |
| 7a.9 spectral N | I₂ curve outer-grade matrix is `[−2]`; smooth model has N=0. Curve potential d₂ targets outside the nonzero node rows, hence zero. | Pass. |
| 7b.1 invariant corestriction | For `T(a,b)=(a+b,b)`, invariants are `{(a,0)}`; inclusion of that line is onto invariants, zero map is not, identity of ℚ² does not corestrict. | Pass. |
| 7b.2 Wang sequence | With N=0 on a line, continuous tame H⁰ and H¹ each have rank `1` (H¹ twisted −1); with J₂, kernel and cokernel each have rank `1`. | Pass. |
| 7b.3 arithmetic local spreading | Constant system gives inertia image `1` before/after specialization; finite quadratic inertia image is `C₂` before/after preserving the finite cover. An equation-only identification could retain ranks but lose this group. | Pass. |
| 7b.3 smooth-family spreading | Product of a smooth proper curve with the trait spreads as the product; all fibre dimensions remain `1` and inertia is trivial. | Pass. |
| 7b.4 localization–Wang cross | Identity smooth proper family has N=0 and specialization identity; curve support duality uses total dimension two, so complementary index is `3−i` and twist `−2`. | Pass. |
| 7b.5 spectral separation | `M=k²,F=diag(1,3)`, B=first coordinate, C=second: spectra `{1}` and `{3}`; kernel of M→C maps isomorphically to B. With `L=0,M=B=C=k,F=1`, spectra intersect and image is `0≠k`. | Pass. |
| 7b.5 local invariant headline | Nodal rational loop: specialization maps rank-one H¹ onto rank-one `ker N`; smooth family: specialization identity. | Pass. |
| 7b.6 Betti cross | Disk identity: nearby H⁰ `ℚ`, monodromy `1`, specialization `id`; punctured-disk cohomology has H⁰=H¹=ℚ. | Pass. |
| 7b.6 Hodge-conditional invariant cycles | Smooth product has zero obstruction; nodal elliptic degeneration has invariant dimension `1` and special H¹ dimension `1`. Distinct stipulated weight ranges have intersection `∅`. | Pass. |
| 7b.7 incidence construction | Conic incidence over dual plane has point-fibre hyperplanes `ℙ¹`; line restriction gives finite degree-two fibres on the smooth pencil. Empty base locus contributes no axis term. | Pass. |
| 7b.7 generic restriction | Constant sheaf on smooth surface has dual `Λ(2)[4]`; restricting to a smooth curve and applying `(−1)[−2]` gives `Λ(1)[2]`, its actual dual. | Pass. |
| 7b.7 geometric-generic arithmetic model | Generic inclusion of k₀ into its algebraic closure has kernel `0`; a parameter map killing a nonzero parameter has nonzero kernel and fails the geometric-generic condition. | Pass. |
| 7b.7 trait arithmetic model | Constant product over a finite-type field model realizes the original product; shifting by `[1](1)` changes stipulated weight w to `w−1`, using `w+1−2`. | Pass. |
| 7b.7 models along pencils | Incidence smooth-relative-dimension shift and line codimension shift cancel on the total pencil; on a hyperplane surface→curve the net dual shift is still `(−1)[−2]`. | Pass. |
| 7b.8 complex invariant theorem | Zero complex gives `0→0`; smooth constant family gives identity; nodal example gives image `ker N` of dimension `1`. | Pass. |
| 7b.9 affine vanishing | On `ℙ¹`, n=0, constant K: `DK[−2]=Λ(1)` has support dimension `1`; affine complement `𝔸¹` has compact H⁰=H¹=0. | Pass. |
| 7b.9 weak Lefschetz | Conic with n=0: restriction `Λ→Λ²` is diagonal and injective; for i<0 both sides vanish. Bound `n−1−j` would demand `1≤−1` at j=0 and exclude this instance. | Pass. |
| 7b.10 general-line comparison | Conic image `C₂` agrees on the general line; constant system images are both `1`; tangent-line image becomes `1`, so generality cannot be dropped. | Pass. |
| 7b.10 relative complex | Identity restriction has fibre `0`; map `Λ→Λ²` diagonal has relative H¹ equal to cokernel, rank `1`; using cone without [−1] puts it in the wrong degree. | Pass. |
| 7b.10 transported local maps | S₃ three-sheet case: global relative space `Λ³/diag Λ` has dimension `2`; one local target has dimension `1`, killing class `(1,1,0)`. All three pair differences have common kernel diag Λ. | Pass. |
| 7b.10 obstruction detection | In the same example the product of all local tests is injective on the 2-dimensional quotient, while one test is not. A conic diagonal class gives all local obstructions `0`. | Pass. |
| 7b.10 ambient/pencil images | Smooth conic fibre: both images are diag Λ in Λ²; critical double fibre: both are Λ; K=0: both are 0. | Pass. |
| 7b.11 global invariant headline | On the conic, `1↦(1,1)` identifies ambient Λ with swap-invariant diagonal; on K=0 the map is `0≅0`. Constant K on smooth dimension n+1 gives dual bound `dim Supp=n+1` at degree 0. | Pass. |

There are 159 adversarial rows above. They include every sampled target, the headline signatures, the separate theorem/construction blocks, and each finding's mathematical target. No universal theorem is certified merely because these instances pass.

The seeded source audit assessed all 15 targets. No additional locator explicitly marked “unverified” was found in the README. All source retrieval used the sources service; the final visual retry of an already retrieved Numdam article failed and supplies no extra evidence. The following are the text locations actually used; partial verification is deliberate.

| Sample | Source text and outcome |
|---|---|
| 0.1 | Stacks line 15756, tag 0BU8, gives the normalized finite-level character, conjugation and tower powers. ECF F.3a and the pinned Kummer character supply the stated local-field comparison. Tag verified; Stacks has no stable printed page. |
| 0.2 | Illusie1994 lines 1264–1286, pp.44–45, verifies the equivariant nearby category; Illusie2006 lines 91–145, pp.3–4, verifies the oriented product, points and universal-map direction. SGA7II XIII 1.2.2(b), 1.2.4 and their pp.9–10 were unavailable: the complete gluing theorem's original locator is not certified. |
| 0.7 | Illusie2006 lines 17–57, pp.1–2, and Illusie2021 lines 884–886, pp.103–104, verify constructibility/trait change and expose R03. Illusie1994 lines 1274–1277 confirm preservation of the bounded constructible finite-Tor domain. Original XIII 2.1.7.5/2.1.13 pages and coefficient-exchange proof were unavailable. |
| 1.3 | WeilII lines 1129–1189, pp.165–166, and 1287–1310, pp.169–170: existence/uniqueness in an abelian category, strictness, lower primitive convention, strings and scalar independence agree. |
| 1.9 | Illusie2021 lines 896–957, pp.104–105, especially (6.1)–(6.4): semistability, the two-component grades, twists and identity graded N agree. Illusie1994Errata lines 11–12 confirms the two corrections invoked by the README. |
| 1.10 | HainesNgo lines 440–499, arXiv §3.1, Lemma 8 and Corollary 9, pp.12–13: admissibility, refinement invariance and triangle additivity agree. The published extraction has broken glyphs, so the cited published pp.126–127 were not independently certified. The general linear-algebra restatement also requires its explicit quasi-unipotence assumption. |
| 2.6 | SGA7II XV 2.2.1–2.2.7, pp.17–23: original text unavailable. The node, double point, persistent cone, integral-cancellation and composite-modulus calculations are recorded above, but do not certify the locator or every assertion attributed to it. |
| 4.3 | WeilI lines 654–657, Proposition 5.3, p.290, proves the geometric fixed-space statement using the local formula. The README's arbitrary-family linear-algebra formulation is checked separately against the native transvection and orthogonal definitions. |
| 4.5 | WeilI lines 784–798, Remark 5.12, p.294, supports the hypersurface application in its odd-dimensional setting; the broader outside-middle claim follows by the explicitly supplied weak Lefschetz/duality route. Original SGA7II XVIII §§2–4/5.1, local pp.5–27/book pp.259–281, unavailable. Exceptional signs were independently tested above. |
| 5.1 | WeilI lines 670–684 and 715–726, pp.291–292, gives the Lefschetz/Bertini/conjugacy route and its tame restriction. It does not by itself certify the entire general compact-image/Frattini proof. Original SGA7II XVIII 6.1.6.1 and Jouanolou 6.3 were unavailable. |
| 5.2 | WeilI lines 658–689 and 715–737, Theorem 5.4 and §5.8, pp.290–292: sign conjugacy and the restriction excluding the characteristic-two even case agree. The latter case is separately handled in 5.9 rather than smuggled into 5.2. |
| 5.3 | WeilII lines 3164–3174, 4.2.4–4.2.5, p.220, explicitly uses conjugates of inertia; Stacks line 1278 in the Fundamental Groups chapter, tag 0BQM, describes the unramified quotient; SGA1 lines 11447–11463, XIII Corollary 2.12, verifies chosen tame generators and their relation. SGA1 is the legal arXiv reedition; its pagination is not the original edition's. |
| 5.11 | WeilII lines 3568–3646, 4.5.1–4.5.4, pp.231–233: nonzero reciprocal roots, all finite-extension fibres, multiplicities, the no-common-eigenvalue coset step and ADE cases agree. The decomposition and characteristic-two generality are retained as explicit hypotheses. |
| 6.2 | Illusie1994 lines 1357–1413, Corollaries 4.5–4.6 and the definition, pp.47–49, verifies rational t-exactness and trait shift; BBD lines 8327–8351 and 8403–8434, 4.4.1–4.4.2, pp.114–115, verifies finite-coefficient right t-exactness; Illusie2021 lines 887–895 records both exactness results. The full finite-coefficient Gabber proof was not independently reconstructed from these excerpts. |
| 6.5 | CaraianiScholze lines 2611–2705, §4.6, Theorem 4.6.1 and Lemma 4.6.2, pp.60–63: the particular semiperversity application and vanishing of boundary transitions agree. This is an application, not the general coherent-topos colimit theorem. Original SGA4 VI §5/VII §5 remained unavailable. |

The pin audit inspected more than 50 declaration sites at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following native definitions were decisive:

| Pinned file and line | Declaration or constraint verified |
|---|---|
| `Mathlib/RingTheory/Henselian.lean:94`, `:108`; `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56` | Henselian predicates; DVR excludes fields. |
| `Mathlib/RingTheory/Valuation/RamificationGroup.lean:29`, `:49` | Inertia is the residue-action kernel inside the decomposition subgroup; the Lean theorem's two coercions are correct. |
| `Mathlib/RingTheory/MvPowerSeries/Order.lean:386`, `:414`, `:428` | Total order is extended-natural; zero series has order infinity. |
| `Mathlib/RingTheory/Smooth/StandardSmoothOfFree.lean:104` | Local standard-smooth conclusion requires finite presentation. |
| `Mathlib/LinearAlgebra/QuadraticForm/Radical.lean:115` | Quadratic nondegeneracy means quadratic radical zero and polar-kernel rank at most one. |
| `Mathlib/LinearAlgebra/CliffordAlgebra/Even.lean:53`; `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean:906` | Native even algebra and centre, whose underlying subring is `Subring.center`. |
| `Mathlib/LinearAlgebra/Transvection/Basic.lean:56`, `:138`, `:209` | Linear map `x↦x+f(x)v`; equivalence/fixed-space theorem require `f(v)=0`. |
| `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean:144`; `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:286` | Orthogonal uses `B(n,m)=0`; symmetry/alternation permits reversed arguments. Alternation is diagonal vanishing. |
| `Mathlib/Algebra/Lie/Sl2.lean:38`; `Mathlib/Algebra/Lie/SkewAdjoint.lean:60` | Nonzero H required for `IsSl2Triple`; native skew-adjoint Lie algebra exists. |
| `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:442`, `:556`; `Mathlib/RepresentationTheory/Invariants.lean:73` | Eigenvalues, maximal generalized eigenspaces, pointwise fixed-vector submodule. |
| `Mathlib/AlgebraicGeometry/Scheme.lean:40`; `Mathlib/AlgebraicGeometry/Properties.lean:239` | Scheme does not include separatedness or quasi-compactness; integral schemes are nonempty. |
| `Mathlib/Algebra/Homology/SpectralObject/SpectralSequence.lean:480`; `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:109` | Native spectral sequence with differential `(r,1−r)`; no nearby-cycle input is constructed by this API. |
| `TauCeti/AlgebraicGeometry/Fibers.lean:43`, `:55` | Generic fibre is arbitrary scalar extension; fraction-field semantics comes from the trait. |
| `TauCeti/LinearAlgebra/GeneralLinearGroup/Unipotent.lean:74` | Unipotence is nilpotence of the difference from identity. |
| `TauCeti/NumberTheory/LocalField/Tame/Character.lean:401`, `:406`, `:412` | Continuous character and positive Kummer ratio. |
| `TauCeti/LinearAlgebra/CliffordAlgebra/Even/Center.lean:321`, `:348` | Existing result needs a field, characteristic not two, and positive even nondegenerate dimension; does not supply general-base Azumaya result. |
| `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`; `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110`, `:131` | Mixed-Hodge carrier and separate strictness results; no Betti localization–Wang cross. |

Ownership was searched by object with `roadmaps grep/show`, at the pins, on main, in board packages and in supplied sibling heads. The six Lean names have no second declaration owner. The 25 supplier families were resolved to main or permitted new-roadmap copies; the 234 automatic unresolved-name leads were not treated as findings. Key locations are below (section ranges in the README were also compared with these owners).

| Supplier | Resolved file and sections |
|---|---|
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:798`: 0.8–0.9; 0.12–0.15; 0.21, 0.23–0.23a, 0.29; 1.1; cited Layer 2 site/support sections; 3.2, 3.4, 3.7; 4.19–4.20. |
| ModularCurves | `TauCetiRoadmap/ModularCurves/README.md:1165`, 4D, strict henselization/completion. |
| PurityOfBranchLocus | `TauCetiRoadmap/PurityOfBranchLocus/README.md:319`, 2.1–2.2; duplicated in R02. |
| AbhyankarLemma | `TauCetiRoadmap/AbhyankarLemma/README.md:333`, 3.3–3.4, regular-divisor inputs. |
| StableReduction | `TauCetiRoadmap/StableReduction/README.md:321`, Layers 1 and 4, graphs/nodes/blow-ups. |
| EllipticCurves | `TauCetiRoadmap/EllipticCurves/README.md:793`, Layer 4, multiplicative reduction. |
| LocalFieldsRamification | `TauCetiRoadmap/LocalFieldsRamification/README.md:1132`, Layer 4, inertia. |
| AdelicAlgebraicGroups | `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:4068`, 4.2, rational p-adic Lie/openness theory. |
| OrthogonalSpinGroups | `TauCetiRoadmap/OrthogonalSpinGroups/README.md:651`, Layers 0/2, main topology/closedness. R04. |
| Chebotarev | `TauCetiRoadmap/Chebotarev/README.md:370`, Layer 9. |
| RepresentationTheory | `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:264`; `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:319`; `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:321`: characters, sl₂, ADE. |
| Completed IntegralLattices | `Completed/IntegralLattices/README.md:162`, Layer 1; the active roadmap is not substituted for this explicitly cited owner. |
| Completed HodgeStructures | `Completed/HodgeStructures/README.md:326`, L2. |
| CrystallineCohomology | `TauCetiRoadmap/CrystallineCohomology/README.md:7524`, log-algebra.1–.4 and CR.5.1. Classical Abhyankar at :8105 explicitly owns the SNC Kummer tower/full tame group. |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429`, 0.1–0.4, enhanced categories and coherent operations. |
| EtaleCohomologyFoundations | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:776`, F.3a; F.0–F.8, 0.7–0.11, G.1–G.3, F.10.1–F.10.5 supply the named base-change, duality, trace and realization domains. |
| AlgebraicModuliForArithmeticGeometry | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:305`, 1.1, 1.3–1.4, Layer 6 and 7.6.1. |
| InverseGaloisAndArithmeticFundamentalGroups | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:464`, IG.0.T1–T4 and IG.1.2–1.3. |
| ArithmeticGaloisRepresentations | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1563`, 2.1a, 2.4, 2.6 and 5.13. Upper/lower primitive conventions agree via the opposite graded-power map. |
| DerivedModuleAlgebra | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1403`, 1.T.1. |
| ArithmeticGaloisDuality | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:595`, R02.1–R02.2. |
| NeronModelsAndSemistableAbelianVarieties | `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:1933`, 3.8–3.9 and 4.1–4.4. LPV explicitly transports the opposite incidence/pairing signs. |
| AbelianSchemesAndArithmeticModuli | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1764`, A4.1. |
| ComplexComparisonPartII | `TauCetiRoadmap/ComplexComparisonPartII/README.md:4250`, C−1.1, C1–C5, C6.0–C6.6; relative comparison is supplied, singular nearby comparison remains LPV's target. |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:849`, Stage 5 item 2 and Stage 6 item 4. |

The supplied open heads show distinct ownership: SelmerIwasawaCohomologyPartII at `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/README.md:169` imports LPV's nearby/weight sequence and declares an integral extension contract; ClassicalAdicEtaleCohomologyPartII at `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md:910` treats almost coherent p-primary equivariant nearby objects; CohomologyComparisonsPartII at `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:525` concerns the p-adic syntomic comparison. These do not replace the prime-to-residue-characteristic scheme construction here. Board packages for EtaleDualityAndPerverseSheavesPartII, PurityForFlatCohomology and DeligneWeightsAndPurityPartII import this roadmap's purity/monodromy outputs. `packages/LefschetzPencilsAndVanishingCyclesPartII/design/README.md:13` explicitly makes its marked same-field curve theorem independent of the parent's projective pencil theorem; its earlier position does not make a supply cycle. Unprovided open heads were not independently retrieved or audited.

## Not verifiable

- **SGA7II**: original XIII/XV/XVII/XVIII text and page locators, including the full sample 2.6, the blow-up maps in 4.5, Bertini in 5.1, and the README's asserted corrections to XII/XV. The service resolved DOI `10.1007/bfb0060505` only to a paywalled source; legal institutional/archive searches did not produce the original text. These are uncertified, not guessed. The arithmetic checks above do not certify the assertions about what the source prints.
- **SGA4**: original VI §5/VII §5 for the general colimit argument. DOI `10.1007/bfb0081551` was paywalled; the institutional Orgogozo reedition retrieval failed. CaraianiScholze verifies the cited application, not this general prerequisite.
- **Illusie2002**: Project Euclid DOI `10.2969/aspm/03610249` led to an anti-bot error page, despite a nominal successful fetch. Its author erratum was an image-only PDF and could not be read here. The odd Picard–Lefschetz correction/concentration claim is therefore not certified from that article.
- **HainesNgo published pagination**: the author PDF extraction was broken. The readable arXiv version has Lemma 8/Corollary 9 and the correct statements, but independently certifies pp.12–13 of that version only. **SGA1** was read in its legal arXiv reedition; original page equivalence was not established.
- **Jouanolou1983**, **SGA4half**, **SGA5**, **SGA7I**, **Illusie2003**, **Fujiwara2002**, **Vidal2004b**: the sources service did not obtain readable legal text from the bibliography citations. Fujiwara's Project Euclid landing page supplied no readable PDF; the attempted institutional SGA7I link returned 404; Vidal's publisher landing page was not an identified open copy. Their unverified locators remain listed in the scratch missing-reference record.
- **BLR**, **Huber1996**, **Schneider2011**: service results were paywalled/uncertified. No paywall was bypassed and no new copy was substituted. Other bibliography texts fetched successfully were not thereby certified in their entirety; this report certifies the passages identified above.

These access limits do not suspend the review. The findings, computed pass, pin audit and supplied-head ownership audit are complete as recorded. No manifest was edited and no material was posted to GitHub.

## Source issues

- **Misprint** in Illusie1994 at the upper row of the diagram, printed p.37: the source says the upper differential is T−1; it should be 1−T; affects the proof; corrected in print at Illusie1994Errata line 11.
- **Misprint** in Illusie1994 at (3.6.8), printed p.38: the source says L where the construction uses K; it should be K; affects the proof; corrected in print at Illusie1994Errata line 12.
- **Misprint** in WeilI at (7.1.5) and its subsequent Frobenius sentence, printed p.300: the source says the evaluation line has twist n−m; it should be m−n, consistent with the pairing and the stated numerical Frobenius eigenvalue; affects a stated result.
- **Error** in WeilII at the proof of Theorem 4.4.9, printed p.230: the source says the product of two norm-two reflections has trace dim(V)−2+(δ,δ′)²; it should be dim(V)−4+(δ,δ′)²; affects the proof.
