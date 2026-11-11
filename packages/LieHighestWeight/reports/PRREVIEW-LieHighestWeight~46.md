# Review of LieHighestWeight (pull request #1220 at 2fce9d3)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

This is a full review: the folder changed by 158 lines since `cf5c2bd`. Previous findings R01–R05 are repaired. R06 (family index) and R07 (generated summary block) are not, and are written again below as R06 and R07. There are six new findings: one P2 and five P3. All come from reading the pinned libraries by object. Layer 7's route to Serre's theorem re-plans results the pin already proves on the presented algebra. The pin also supplies concrete split algebras and exceptional Serre representations that Layer 8 does not use. One Lean headline is a 27-line composite of pinned declarations. Lean names that main still cites are dropped without a mapping. One manifest record does not match the cited edition.

`README.md` and `Suggested.lean` below are the folder's files. Library paths starting `TauCeti/` or `Mathlib/` are read at the pins of this head's manifest (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`). "Main" is the roadmap repository's main branch (`5fc1aa8`).

## R01 (P2) — §7.1 re-plans the pinned steps of Serre's theorem on the presented algebra

**Location:** `README.md:1736–1739`, "mixed brackets reduce to the positive part, Cartan part or negative part, and the Serre relations make every simple-root sl₂ action locally finite. Rank-one strings preserve weight multiplicity under simple reflections". The target "root-graded straightening/spanning theorem" is at `:1724–1727`, and the *Needs:* line at `:1745–1747`.

**Claim:** These are route steps of `serreLift_injective_of_base` that remain to be built. The *Needs:* line lists no pinned input for them.

**Witness:** Every one of these is proved at the pin for `Matrix.ToLieAlgebra K CM` over any characteristic-zero field, all in namespace `TauCeti`, files under `TauCeti/Algebra/Lie/Presentation/Serre/`:

- triangular decomposition, `Triangular.lean:374`;
- weights restricted to 0 and ± column sums, `Triangular.lean:383`;
- zero weight space equal to span H, `Triangular.lean:393`;
- local nilpotence, `Integrable.lean:200` and `:204`;
- weight-space decomposition, `Integrable.lean:217`;
- bracket words spanning weight spaces, `Word.lean:232`;
- simple-root lines, `Word.lean:243`;
- vanishing multiples, `Word.lean:253`;
- simple reflections as automorphisms, `Reflection.lean:258`.

The README cites none of them.

**Repair:**

1. Add these ten declarations to "From Tau Ceti", with their characteristic-zero field hypothesis.
2. In §7.1, replace the sentences quoted above by their consumption.
3. State the remaining target as follows. Every nonzero weight of the presented algebra is carried by the pinned simple-reflection automorphisms to a positive multiple of a simple root (height reduction). So its weights are exactly the roots, each with a line. The algebra therefore has dimension rank + number of roots, and the pinned surjection `TauCeti.serreLift_surjective` is injective.
4. Name the ten declarations in the *Needs:* line.

Checked on A₂: `Word.lean:243` gives the lines at α₁ and α₂. The word `[e₁,[e₁,e₂]]` vanishes by `ad(e₁)^(1−(−1))`. That leaves dimension 2 + 6 = 8.

## R02 (P3) — The E-series dimension headlines are routed through models that the pinned split algebras make unnecessary

**Location:** `README.md:2227–2230`, "Build each, prove its dimension and Killing-simplicity of the stated type, and identify it with the split `LieAlgebra.e₆`, `e₇`, `e₈ K` via Layer 7. … Their algebra-dimension headlines are `finrank_e6_e7` and `finrank_e8`". Also `README.md:288–290`, "establishes none of their structural theorems (… concrete models, representations); those are built here".

**Claim:** `finrank_e8` and `finrank_e6_e7` follow the Vinberg and Tits model constructions (Layer 8 *Needs:*, `:2268`).

**Witness:** `TauCeti.DynkinType.lieAlgebra` is a concrete split algebra over ℚ for every valid type (`TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/LieAlgebra/Basic.lean`). Over it the pin also has:

- `Killing.lean:58` and `:75`: nondegenerate Killing form over ℚ and after base change;
- `Chevalley.lean:45`: a triangularizable Cartan;
- `SerrePresentation.lean:126` and `:152`: a surjection from the Serre algebra;
- `NumberOfRoots.lean:59–61`: root counts 72, 126, 240.

**Repair:**

1. Add these declarations to "From Tau Ceti", together with Mathlib's `LieAlgebra.Basis.equivOfReindex` (`Mathlib/Algebra/Lie/Basis/Prod.lean:307`): simple algebras with Lie bases of matching Cartan matrices are isomorphic over any characteristic-zero field.
2. Route the two dimension headlines as follows. Apply `serreLift_injective_of_base` to `t.lieAlgebra` for t = E₆, E₇, E₈ over ℚ, read off dimension rank + roots, extend scalars to K, and reindex `CartanMatrix.Eₙ`.
3. Keep the Vinberg and Tits identifications as separate targets.
4. Rewrite `:288–290` to name the pinned models.

Checked: 6+72 = 78, 7+126 = 133 and 8+240 = 248, the values `finrank_e6_e7` and `finrank_e8` state.

## R03 (P3) — The 27- and 26-dimensional Serre representations and the sl₂ diagonal Cartan are pinned but not consumed

**Location:**

- `README.md:2206–2207`: "`E₆` (dimension `78`, with its `27`-dimensional representation `J`)".
- `README.md:1884–1886`: "the trace-zero module is irreducible, hence its fundamental 26-dimensional representation".
- `README.md:2746–2749`: "construct slTwoDiagonalCartan, with generator h=E₀₀−E₁₁, its Cartan instance, root decomposition".

**Claim:** These representations and this Cartan are to be built here. Only the E₇ representation is cited (`:2219–2226`).

**Witness:**

- `TauCeti.E6Minuscule.serreRepresentation` (`TauCeti/Algebra/Lie/E6/Minuscule/Basic.lean:207`): a 27-dimensional representation of the E₆ Serre algebra.
- `TauCeti.F4ShortRoot.serreRepresentation` (`TauCeti/Algebra/Lie/F4/ShortRoot/Basic.lean:351`) and `serreRepresentationBaseChange` (`F4/ShortRoot/Represented/Serre.lean:100`): a 26-dimensional representation of the F₄ Serre algebra and its base change.
- `TauCeti.specialLinearDiagonalCartan` with its Cartan instance when 2 ≠ 0 (`TauCeti/Algebra/Lie/SpecialLinear/Diagonal.lean:228`, `:312`).

**Repair:**

1. Add the E₆ and F₄ representations and the diagonal Cartan to "From Tau Ceti".
2. In the F₄ and E₆ bullets, state each representation comparison as intertwining the model's generator action with the native 27- or 26-dimensional representation, exactly as the E₇ bullet does with `TauCeti.E7Minuscule`.
3. In the sl₂ worked example, consume `TauCeti.specialLinearDiagonalCartan 1 K` instead of constructing slTwoDiagonalCartan.

## R04 (P3) — `exists_polynomialSymmetric` is a composite of pinned declarations

**Location:**

- `Suggested.lean:70–79`.
- `README.md:769–771`: "Construct its monomial basis and a linear equivalence to the existing `Sym[ℂ]^d (Fin 2 → ℂ)` that sends `e_i^d` to the pure symmetric tensor".
- `README.md:764–765`: "The monomial normalization is stated by `exists_polynomialSymmetric`".

**Claim:** This is a headline of Layer 0, and the dictionary and its monomial basis are to be constructed here.

**Witness:** A 27-line proof of the exact Lean statement compiles on a scratch copy (exit 0, no `sorry`). It uses:

- `TauCeti.SymmetricPower.equivHomogeneous` and `equivHomogeneous_tprod` (`TauCeti/LinearAlgebra/SymmetricPower/Algebra.lean:230`, `:254`);
- `TauCeti.SymmetricAlgebra.map_homogeneousSubmodule_equivMvPolynomial` (`TauCeti/LinearAlgebra/SymmetricAlgebra/BasisComparison.lean:73`);
- Mathlib's `SymmetricAlgebra.equivMvPolynomial_ι_apply`.

The monomial basis is `Module.Basis.symmetricAlgebraHomogeneous` (`BasisComparison.lean:171`).

**Repair:**

1. Delete `exists_polynomialSymmetric` from `Suggested.lean`, together with "the normalized polynomial/symmetric-power comparison" in its docstring (line 25).
2. Add the four declarations to "From Tau Ceti".
3. In §0.1 item 1, state the dictionary as their composite and drop "Construct its monomial basis and a linear equivalence".
4. Rewrite `:764–765` without the deleted name.
5. Keep the three Checks, and keep naturality and the tensor comparison as targets.

## R05 (P3) — Lean names that main still cites are dropped without a mapping

**Location:** `README.md:61–74`. The former-numbering table and the paragraph after it map layers only.

**Claim:** Existing citations of this roadmap can follow the table.

**Witness:**

- Main's `TauCetiRoadmap/CharacteristicClasses/README.md:1359–1367` consumes five names from "LieHighestWeight L7": `lieInvariantSymmetricAlgebra`, `lieChevalleyRestrictionIso_coe`, `lieChevalleyRestrictionIso_mem_homogeneous_iff`, `killingSymmetricEquiv_cartan_restriction` and `killingSymmetricEquiv_lie`.
- Main's `TauCetiRoadmap/RepresentationTheory/AdoIwasawa/Suggested.lean:112–113` names three: `LieHighestWeight.ι_injective`, `.pbwBasis` and `.module_finite_of_central_monic_relations`.

None of the eight is declared at this head.

**Repair:** After the table, add a sentence or two-column table headed by "former Lean statement of this roadmap". Write the former names in plain text, not backticks. Map them to:

- `TauCeti.SymmetricAlgebra.lieInvariants`;
- `LieSubalgebra.coe_lieChevalleyRestrictionIso_apply`;
- `LieSubalgebra.lieChevalleyRestrictionIso_mem_homogeneousSubmodule_iff`;
- `TauCeti.map_dualMap_killingSymmetricEquiv`;
- `TauCeti.killingSymmetricEquiv_lieModuleDerivation`;
- `TauCeti.UniversalEnvelopingAlgebra.ι_injective`;
- `Module.Basis.pbwBasis`;
- `TauCeti.UniversalEnvelopingAlgebra.moduleFinite_of_isIntegral_of_span_eq_top` with `Subalgebra.centralSubalgebraAlgebra`.

All exist at the pin.

## R06 (P3) — The family index contradicts this README on PBW ownership and on the direction of supply with LieGroups

Re-raised: R06

**Location:**

- `TauCetiRoadmap/RepresentationTheory/README.md:82–84`: "The highest-weight roadmap owns the concrete PBW project; Ado–Iwasawa consumes its injectivity, ordered-monomial, filtration, domain, and Noetherian consequences".
- `:90–91`: "the smooth-group ↔ Lie-algebra correspondence that the highest-weight and compact-group roadmaps presuppose".

**Claim:** Ado–Iwasawa gets PBW from this roadmap, and this roadmap presupposes LieGroups.

**Witness:** `README.md:71–72` says Ado–Iwasawa consumes native PBW and central finiteness directly. `README.md:115–118` says LieGroups Layer 7 consumes §7.1, so the compact applications follow LieGroups.

This is carried from the previous review. A not-actionable reason fails: the brief names this index as the pull request's own, and the pull request already edits its lines 36–39.

**Repair:**

1. Replace `:82–84` by "Both roadmaps consume Tau Ceti's PBW basis, filtration, domain, Noetherian and central-finiteness theorems."
2. Replace "that the highest-weight and compact-group roadmaps presuppose" by "that the compact-group roadmap presupposes; the highest-weight roadmap supplies the split Serre presentation to it".

## R07 (P3) — Two sentences of the generated summary still describe content the head does not have

**Location:** Pull-request description, block `roadmap-summary`:

- "while the type-A tensor decomposition weakens the highest-weight gap bound from strict to weak inequality";
- "general-linear comparisons and applications to compact group centers as targets".

**Claim:** These describe the head.

**Witness:** The README has no type-A stable tensor decomposition. `README.md:110–122` says the compact-group applications, including the centre `P∨/Y`, "are not targets of this roadmap". This is carried from the previous review; the block is unchanged.

**Repair:** Regenerate the `roadmap-summary` block from this head.

## R08 (P3) — The Etingof page numbers are of an edition the manifest does not record

**Location:** `README.md:2848–2854`: "These page numbers are the printed pages of the [MIT course notes]". The manifest key `EtingofLieGroupsLieAlgebras` in `packages/LieHighestWeight/sources.toml` records arXiv:2201.09397v5.

**Claim:** The cited pages can be checked against the recorded text.

**Witness:** In the recorded arXiv v5 text the pages differ from the README's:

| Statement | arXiv v5 page | README (OCW) page |
| --- | --- | --- |
| Theorem 11.18 | 65 (EtingofLieGroupsLieAlgebras line 2597) | 68 |
| Theorem 24.2 | 122 (line 4818) | 130 |
| Proposition 32.14 | 165 (line 6708) | 176 |

The README's pages are those of the MIT OCW notes it links, where printed page = PDF page − 1.

**Repair:** Record the OCW notes under the same key. Give their url and a `version_note`: "MIT 18.755 Spring 2024 notes; printed pages; arXiv v5 pages differ". Alternatively, change the README's pages to arXiv v5.

## Previous findings

- **R01** (Layer 8 planned pinned results): repaired. `:535–551` consumes the six `Octonion/Simple.lean` declarations and the imaginary module. `:563–576` consumes dimension 52 and the trace-zero module, and `:577–581` the 248 count. The G₂ bullet (`:1858–1862`), the F₄ bullet (`:1881–1886`) and the worked examples (`:2767–2783`) cite the pins.
- **R02** (central-monic adapter): repaired. The theorem and both docstring sentences are gone. §3.1 (`:916–932`) cites the pinned declarations and keeps the subalgebra form as a remark. `:71–74` and `:2820–2821` are updated.
- **R03** (self-duality): repaired at `:1154–1155`.
- **R04** (LR locator): repaired at `:2376–2379` and in References (`:2871–2874`). Stembridge2002LR line 109 is the second Corollary on p. 3, and the specialization at empty inner shape (lines 121–122) is the product rule.
- **R05** (three stale statements): repaired at `:153–156`, `:210–211` and `:1748–1749`. `LieModule.instIsTriangularizableOfIsAlgClosed` exists at `Mathlib/Algebra/Lie/Weights/Basic.lean:754`.
- **R06** (family index): not repaired. Written again as R06, extended to lines 90–91.
- **R07** (summary block): not repaired. Written again as R07.

## Verified sound

**Gate, build, direction of supply.** The worker's gate passes with every counter 0. My rerun differs only in `outside-folder=1` for the family index, which is this pull request's own. The diff against main outside the folder and the family index is empty. `lake env lean Suggested.lean` exits 0 with fourteen `sorry` warnings and nothing else. Dependency check:

```text
depcheck: 235 roadmaps, 2135 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. LieGroups, ReductiveGroups and TangentialBordism appear only as consumers or as owners of what this roadmap leaves out.

**Lean form.** One `import Mathlib` plus 16 `TauCeti.*` modules, all existing at the pin. There is no `set_option` and no sorry'd data. `productEnveloping` has a real body. The 15 elaborated signatures were compared with their README statements and all agree. The two "dropped binder" leads are false: `[IsTriangularizable K H L]` appears in both elaborated types as an instance argument. The `and` entry in the signature list comes from docstring text.

**Padding probe.** On a scratch copy, `first | rfl | simp | infer_instance | decide` closes 0 of 14 theorems. R04 came from a longer probe.

**Headlines.** The 14 stated theorems are the README's headlines. The four "not statable" claims hold at the pin:

- the pinned Albert carrier is split;
- `E8/Vinberg.lean` has only a dimension count;
- there is no zero-fibre bracket;
- there is no category-O carrier.

No statable headline is absent. One gap is declared on this roadmap by AutomorphicFormsOnReductiveGroups (`gap:reductive-enveloping-centers`), and §9.2 states what it asks.

**Adversarial table.**

| Statement | Instance | Values | Result |
| --- | --- | --- | --- |
| `exists_polynomialSymmetric` | d=0, i=0; d=2, i=1; map `2·e` | empty `tprod` ↦ 1 = X₀⁰X₁⁰; `e₁⊗e₀` ↦ X₀X₁; `2·e` sends xy to twice the tensor | holds (and provable from pins, R04) |
| §0.1 operators | `e_i=x^(d−i)y^i` | `E e_i=i e_(i−1)`, `F e_i=(d−i)e_(i+1)`, `[E,F]=x∂_x−y∂_y` gives `d−2i` | holds; same as Etingof §11.4 (`e=x∂_y`) |
| §0.1 `‖v_r‖²` | (m,n,r)=(3,2,2), (3,3,2) | sums 1+2/3+1/3=2 and 1/3+4/9+1/3=10/9; closed forms 48/24=2 and 240/216=10/9 | agree |
| §0.1 item 5 | n≥2 | Gram 1, 1/(2n), 2/(n(n−1)); cross products 2+2(n−2)−2(n−1), 2−4+2, 1−(n−2)/n−2/n | all 0 |
| §0.1 spanning | m≤n | Σ_(r=0)^m (m+n+1−2r)=(m+1)(n+1) | holds |
| `exists_reesZeroFiberBracket` | `[x,y]=y`; abelian; lift `a+ħj(z)` | `t²ι(y)=ħj(y)` ⇒ {x,y}=y; c=0 since ħ is regular; extra `ħ²j([z,y])` ↦ 0 | holds; B=0 excluded off abelian |
| §3.1 derivative identity | `[x,y]=y` at ξ=(2,3) | {x,y}: 3=3; {x²,y}=2xy: 12=ξ([4x,y])=12 | holds |
| §3.2 product formula | `XY−YX=ħY` | `X^bY^c=Y^c(X+cħ)^b`; a=0,b=1,c=1,d=0 gives `yx+ħy` | holds |
| §3.2 `B_sym` | p=x, q=y; general | y − y/2 = y/2; `B_ord−½y(p_xq_y+p_yq_x)=½y(p_xq_y−p_yq_x)` | equals ½{p,q}; matches Gutt slide 14, `x∗y=xy+(ν/2)[x,y]` |
| `exists_pbwSymmetrization` | L=0; sl₂ | e(1)=1 (one permutation of Fin 0); e(h²+4ef)=h²+2(ef+fe)=h²+2h+4fe=Ω | holds; Ω central |
| `invariantForm_isSymm_iff_tits_sign` | sl₂ V(1), V(2); sl₃ adjoint; C₂ standard and adjoint; L=0 | exponents 1, 2, 4, 3 (Σ coroots 3e₁+e₂ at e₁), 6, 0 | skew, sym, sym, skew (sp₄), sym; on K a skew form is 0 | holds |
| §5.1 opposition | A₂; D₄; D₅ | swaps ω₁, ω₂; w₀=−Id with diagram group S₃; swaps the half-spin nodes | as stated |
| §6.1 inversion | sl₂, M=V(2)⊕V(0)² | orbit coefficients 1, 3; subtract `ch V(2)=m₂+m₀` | multiplicities 1, 2 |
| §6.2 fixed-point sum | GL₂, λ=(1,0), (2,3) | −4+9=5=t₁+t₂; δ−ρ=(½,½) W-fixed | holds |
| §6.2 Fourier sign | A₁, n=1 | χ₁ gives 1, 1; monomial z gives 1, 0 | sign fixed |
| §7.1 translation | A₁, ρ(h)=1 | `τ_(−ρ)(h²+2h)=h²−1`; τ_ρ gives h²+4h+3 | sign fixed |
| §7.1 separation | A₁ 0 and −2; A₁×A₁ (2,0),(0,2) | same χ but −2 not dominant; equal Casimir, factor Casimirs differ | dominance needed; one Casimir fails |
| `serreLift_injective_of_base` | sl₂; sl₂×sl₂; L=0 | 3=3; 6=6 with `[e₁,e₂]=ad(e₁)^(1−0)e₂=0`; 0×0 matrix gives 0 | holds without simplicity |
| Serre algebra via pinned steps (R01) | A₂ | lines at α₁, α₂ (`Word.lean:243`); `[e₁,[e₁,e₂]]=0`; dimension 2+6=8 | as R01 states |
| `octonionSerreLift_injective` | G₂ | 2+12=14; pinned surjection (`Octonion/Serre.lean:397`) and finrank 14 (`Derivation.lean:958`) | injective iff Serre algebra has dimension 14 |
| `nonempty_derivationAlbert_equiv_f4` | F₄ | 4+48=52; pinned `Finrank.lean:384` | consistent |
| `finrank_e8`, `finrank_e6_e7` | root counts | 8+240=248, 6+72=78, 7+126=133 (`NumberOfRoots.lean:59–61`) | agree |
| `exists_complexified_divisionOctonion_equiv` | dimensions; isotropy | 8=2+3+3; N(1⊗1+i⊗u)=1+i²=0 | complexification is split |
| `compact_g2_derivation_divisionOctonion` | split vs division | split coroot κ(h,h)>0; division κ(D,D)=−‖ad D‖² | definite only on the division carrier |
| Layer 8 octonion checks | ℓ=(0,1) | ℓi=(0,−i), (ℓi)ℓ=(i,0); (ij)ℓ=(0,k), i(jℓ)=(0,−k); Moufang both sides k | hold |
| Layer 8 Jordan and determinant | A=E₀₀, B=E₀₁+E₁₀; diag(1,2,3); (3,1,1), x₁=1 | `[L_A,L_B]A=B/4−B/2=−B/4`; (216−252+72)/6=6, spur 11; det 3−1=2 | hold |
| LR headline | n=2, λ=μ=(1); n=1; n=0 | counts at ν=(2), (1,1): 1, 1, and 4=3+1; (1,1) excluded by `hnu`; empty tableau 1=1 | holds; `LRTableau inner outer μ` order checked |
| `exists_productCenterEquiv` | Z=S=0; Z=K, S=sl₂ | K≃K⊗K; K[t]⊗K[C] | holds |
| §9 gl₂ Casimir, staircase | μ=(3/2,1/2); ν−ε_t | 15/4−1/4=7/2; C(ν−ε_t)−C(ν)=−3N+4t+3, so differences 4(t−s) | holds |
| §9.3 trace splitting | gl₂ over 𝔽₂ | tr(I)=0 | splitting fails, as stated |
| Closed-alcove uniqueness | A₁ | orbit of 2/3 is ±2/3+2k, meeting [0,1] once; x↦1−x moves 2/3 to 1/3; stabilizer of 0 has order 2 | true for W_aff, false for W_ext; conclusion is f x = x |
| `Ω ⋊ Γ_root ≃ Aut` | A₁, A_r, D₄, E₆ | C₂; dihedral of order 2(r+1); S₄; S₃ | agree with Garnier Table 1 and Corollary 2.2.7 |

**Library declarations opened at the pin (about 75).** These include all those named in R01–R05 and:

- Tau Ceti: `Octonion/Simple.lean:94, 175, 335, 343, 515, 537`; `AlbertAlgebra/Derivation/Basic.lean:180, 201, 218, 229`; `E8/Vinberg.lean:79`; `PBW/Finite.lean:138, 180`; `Subalgebra/Center.lean:115, 137`; `HighestWeight/Dual.lean:142`; `Presentation/Serre/Killing.lean:196, 216`; `Presentation/Serre.lean:507, 601`; `SimplyConnectedRootDatum/LieAlgebra/Killing.lean:58, 75`; `LittlewoodRichardson/Basic.lean:71`; `Schur/LittlewoodRichardson.lean:313`; `Weyl/DominantIntegral.lean:251`; `RootSystem/Positive.lean:483`; `CentralCharacter/Isomorphism.lean:159`; `Killing/CartanRestriction.lean:203, 247`; `HighestWeight/ChevalleyRestriction.lean:151, 163, 177`; `CayleyDickson/Quaternion.lean:315, 321`.
- Mathlib: `Algebra/Lie/Basis/Base.lean:211, 259`; `RootSystem/GeckConstruction/Basis.lean:51, 125`; `Algebra/Algebra/Subalgebra/Centralizer.lean:170`.

None of the following is stated at the pin, so the corresponding headlines are not duplicates:

- injectivity or finiteness of a Serre algebra (the Geck file says so explicitly);
- the gl_n tensor multiplicity;
- closed-alcove uniqueness;
- derivations of `DivisionOctonionReal`;
- a zero-fibre bracket.

**Sources: the seeded sample (12 subsections).**

- Etingof, *Lie Groups and Lie Algebras*, MIT OCW notes, printed = PDF − 1:
  - §11.4 p. 65, Theorem 11.16 p. 66, Theorem 11.18 p. 68;
  - Corollary 18.8 p. 99;
  - §24.1 p. 129 (algebraically closed), §24.2, Theorem 24.2 and Lemma 24.3 p. 130, with the reduction to irreducible systems on the proof's first line;
  - Proposition 26.3 p. 139, Theorem 26.4 p. 140;
  - Proposition 30.4 p. 159 with (3)⇒(2) as described; Corollaries 30.5 and 30.7 p. 160;
  - Example 32.13 and Proposition 32.14 pp. 176–177, stated for simple g.
- Etingof, *Representations of Lie Groups*, printed = PDF:
  - Theorem 10.1 p. 51; Remark 10.2 and Example 10.3 p. 52;
  - Theorem 13.5 p. 69 with the 1/n! symmetrization in its proof;
  - Theorem 14.1 pp. 70–71 with (iv) and (v) as cited;
  - §17.2 p. 81, with `2ρ∨=Σ c_i h_i`.
- Garnier (printed p. 5 spans PDF pp. 5–9):
  - §1.3 p. 4; Theorems 1.3.2 and 1.3.5 p. 5;
  - §2.2 p. 7, Proposition-Definition 2.2.1 p. 8;
  - Corollary 2.2.7 p. 10;
  - Proposition 2.3.1 p. 16.
- Gutt, slide 14 (GuttDeformationQuantization line 922).
- Stembridge, line 109.

Every sampled locator supports its statement. Where the README extends a source (a split field, semisimple instead of simple, the edition question of R08), it says so.

**Cross-roadmap citations resolved (14).**

- On main: ReflectionInvariantTheory §2 (line 19); CharacteristicClasses C5 (line 1344); LieGroupoidsPoisson G4.6A/B (lines 18, 71, 78); TensorProductCombinatorics §§1.5, 1.6, 2.6 (lines 599, 694, 1191); PseudodifferentialOperators §3.1 (line 715, periodic Fourier expansions); GroebnerGeometry G4 (line 252); RootSystems Layers 1–6; ClassicalGroups Layers 2–4; SchurWeyl Layer 7; SpinRepresentations Layer 9; LieGroups Layers 4, 6 and 7.
- At its open head: TangentialBordism §§9.1–9.2 (lines 2701, 2752), named as an owner only.

**Overlaps and ownership.** #1797 conflicts in both files, and the generated merge-order block puts it first, so that raises no finding. The overlaps tool reports no dropped ids. Its blind spot for Lean names is R05. The closest open roadmaps were read:

- ClassicalGroups #1192 hands the gl_n Lie comparison to Layer 9, which consumes it from the pin.
- SpinRepresentations #1207 consumes Layer 7, and its anchor resolves.
- ExceptionalThetaCorrespondencesForG2 #1736 consumes only pinned octonion facts.
- CompactGroupsPartII #1047 owns compact Frobenius–Schur forms, which this README excludes.
- AutomorphicFormsOnReductiveGroups #1037 declares the §9.2 gap.

No second owner was found for any headline object.

## Not verifiable

- `HumphreysIntroLieAlgebras`, `BourbakiLie78`, `GoodmanWallachSymmetry`: settled as uncertified, not read.
- Dixmier §1.6 (`README.md:2471`): no legal text on this worker.
- Baez, Schafer, Garibaldi, Landsberg–Manivel and De Concini–Procesi–Vergne locators: outside the seeded sample, not re-read.

## Source issues

- **Misprint** in EtingofRepresentationsLieGroups at Theorem 10.1(ii), p. 51: the source says the restriction map is a graded algebra "isomorpohism"; it should be "isomorphism"; affects nothing.
