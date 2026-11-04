# Review of QuiverRepresentations (pull request #1526 at 248b7fa)
Folder: `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/`

**Verdict:** needs changes

🤖 Independent AI review. Six findings: two P2 and four P3. The gate passes at this head, every one of the fifteen Lean signatures elaborates and agrees with its README statement, no sorried theorem closes with one tactic, and the sampled source locators (ASS, BGP, Etingof v5) support the statements as written. The two blocking findings are duplications of theorems that Tau Ceti already has at the pin: the injective-envelope and minimal-injective-presentation material of §3.1, and the Euler-matrix and Euler–Ext identities of §§3.3 and 4.1. Everything else is a locator or contract note.

Here README and Lean mean the two files in the folder named above; Tau Ceti paths are relative to `TauCeti/` at the pinned revision `a91d3aa`, Mathlib paths to `Mathlib/` at `6b7abb3`.

## Previous findings, checked first

The previous review (of `9559621`) raised eighteen findings. All are repaired at this head.

| Previous | Passage at 248b7fa | Disposition |
|---|---|---|
| R01 Jacobson ideal | README:368–369 “Jᴺ ⊆ I ⊆ J², with J the arrow ideal”; Lean:69 `TauCeti.IsAdmissibleIdeal (RingHom.ker f)` | Repaired; dual-number Check at README:383 |
| R02 reflection finiteness | README:465–466 “For finite-dimensional M with no sink-simple summand”; the Lean theorem is gone and `TauCeti.dimVector_reflectRep` is cited | Repaired |
| R03 Coxeter survival | README:70–72 and 469–471, killed/survived dichotomy with the order fixed | Repaired |
| R04 Cartan matrices | README:67–68 and §3.3: `C` versus `B`, `E = C⁻¹`, `B = E + Eᵀ` | Repaired (but see R02 below: the identity is at the pin) |
| R05 generators | README:219–220 “all vertex idempotents together with all arrows” | Repaired |
| R06 minimal faithful projective | README:349–353, progenerator and `Endₐ(P)ᵐᵒᵖ`; §3.1 Check at 357 | Repaired |
| R07 height descent | README:511–516, BGP Lemma 2.3 termination; D₄ Check at 521 | Repaired |
| R08 imaginary roots | README:73–74 “The locus q = 0 is the isotropic locus” | Repaired |
| R09 covers and path basis | README:61–62 and 253 | Repaired |
| R10 fixed hyperplane | README:66–67 and Check at 480 | Repaired |
| R11 sorried data | gate `sorry-data=0`; the three `def`s have real bodies | Repaired |
| R12 replanned pinned objects | README:18–33 inventory; Lean states only new headlines | Repaired, with two residues (R01, R02 below) |
| R13 narrowed headlines | Lean:140–199 general finite-dimensional algebra AR theorems; uniqueness consumed from `exists_iso_τ₃_eq` | Repaired |
| R14 finiteness over the wrong ring | README:50–55 | Repaired |
| R15 loop classification | README:552–556, `k[X]/(fⁿ)` | Repaired |
| R16 one-lemma closures | all five deleted | Repaired |
| R17 locators | locators attached to every target; II.3.7 pp.64–65 | Repaired (page slips remain, R04 below) |
| R18 shape | house shape, Needs lines, three Checks per definition | Repaired |

## R01 (P2) — Injective envelopes and minimal injective presentations are already at the pin

**Location:** README:312–347, “Construct the injective envelope of every finite-dimensional left A-module M … Define a minimal injective presentation”; Lean:55–58 `exists_injectiveEnvelope`.

**Claim:** §3.1 builds finite-dimensional injective envelopes, their uniqueness, minimal injective presentations and their uniqueness, and the Lean file states the envelope existence as a headline.

**Witness:** `TauCeti.exists_isInjectiveEnvelope_of_finite`, `Algebra/Module/Injective/Envelope/FiniteDimensional.lean:67`: for `A` finite-dimensional over `k` and `M` finite over `A`, a finite-dimensional `Q` with `i : M →ₗ[A] Q` and `TauCeti.IsInjectiveEnvelope i`. `IsInjectiveEnvelope` (`Envelope/Basic.lean:101`) is injectivity, monicity and an essential range; `isInjectiveEnvelope_iff_forall_injective` (`:121`) is the forall-monic form the Lean headline uses; `IsInjectiveEnvelope.exists_linearEquiv` (`:172`) is uniqueness over `M`. `TauCeti.IsMinimalInjectiveCopresentation` (`Algebra/Module/Injective/Copresentation.lean:69`) is the minimal injective presentation of README:330–333 with `isInjectiveEnvelope_cokernelMap` (`:102`) and the commuting-square uniqueness of README:339. On the instances of the Checks: for `A = k` the pinned envelope of `k` is the identity, and for the dual numbers the pinned theorem returns an embedding of the simple into a two-dimensional injective, which is `1 ↦ ε` up to the uniqueness equivalence; the values agree with README:326–328.

**Repair:** Delete `exists_injectiveEnvelope` from `Suggested.lean`. In §3.1 replace the two constructions by their consumption: cite `TauCeti.exists_isInjectiveEnvelope_of_finite`, `TauCeti.IsInjectiveEnvelope.exists_linearEquiv` and `TauCeti.IsMinimalInjectiveCopresentation` in **From Tau Ceti**, keep the Checks as agreement checks against the pinned notions, and keep only what is new: the k-duality exchange of covers and envelopes (README:316, 322, 338) if no pinned statement supplies it (I found none under `Algebra/Module/Injective/`), stated as a target with ASS I.5.13 (p.31, `ass line 1755`) adapted to the standing algebraically closed field of that source (see R05).

## R02 (P2) — The Euler-matrix and Euler–Ext identities are already at the pin

**Location:** README:399–400 “prove E=C⁻¹ and that B=E+Eᵀ is the symmetric Tits Gram matrix”; README:437–439 “Prove `eulerForm_eq_hom_sub_ext` … (ASS III.3.13 …)”; Lean:97–105 `eulerForm_eq_hom_sub_ext`.

**Claim:** The identity `E(dM, dN) = dim Hom − dim Ext¹` for finite acyclic quivers, the inverse-Cartan identity and the polarization to the Tits form are targets of this roadmap.

**Witness:** `TauCeti.extEuler_eq_eulerForm_dimVector`, `RepresentationTheory/GrothendieckGroup/Quiver/ExtEuler.lean:128`: for a finite quiver with finite-dimensional path algebra and finitely generated modules `X, Y`, the Ext-Euler characteristic `Σ (−1)ⁿ dim Extⁿ(X, Y)` equals `eulerForm Q (dim X) (dim Y)`; admissibility of every such pair is `isEulerAdmissibleOn_isFG_pathAlgebra` (`:65`). `extEulerPairing_add_flip_eq_titsPolarForm` (`:140`) is `B = E + Eᵀ`. `TauCeti.extEulerMatrix_eq_inverseCartanMatrix_transpose` (`RepresentationTheory/GrothendieckGroup/ExtEulerMatrix.lean:194`) is `E = (C⁻¹)ᵀ` in the column convention, that is the README's row-convention `E = C⁻¹`, for projective covers of absolutely simple modules over a finite-dimensional algebra with finite projective resolutions; vertex simples over an unbound acyclic path algebra satisfy both hypotheses. On A₂ the pinned identity gives `χ(S₁, S₂) = 0 − 1 = −1 = E((1,0),(0,1))` and `χ(P₁, P₁) = 1 = q(1,1)`, the values of the Checks at README:450–452.

**Repair:** Cite the four declarations above in **From Tau Ceti**. In §3.3 replace “prove E=C⁻¹ and …” by the citation plus the one-line transpose adapter between the column convention of `TauCeti.cartanMatrix` and the row convention here. In §4.1 keep the two genuinely new headlines, `pathAlgebra_higher_ext_vanish` and `homDifferential_coker_equiv_ext`, and state the Hom-minus-Ext¹ form as their corollary together with the pinned `extEuler_eq_eulerForm_dimVector` (for pointwise finite-dimensional representations the module is finitely generated, by `module_finite_quiverRepEquivalenceFunctorObj_of_isFinDim`); delete `eulerForm_eq_hom_sub_ext` from `Suggested.lean`, or keep it only with a docstring that says it is that corollary and not an independent target. The §3.3 Needs line then no longer needs “Layer 4's Euler–Ext comparison”.

## R03 (P3) — Supplier contracts omit four pinned declarations the routes use

**Location:** README:111–191, **From Tau Ceti**; routes at README:349–353 (basic Morita), 604–608 (stable translate), 365–379 (presentation).

**Claim:** The contracts list every pinned declaration the Layer 3 and Layer 6 routes consume.

**Witness:** `IsIdempotentElem.cornerEquivalence` and `moritaEquivalenceCorner`, `RingTheory/Morita/Corner.lean:388` and `:440`, give `ModuleCat A ≌ ModuleCat eAe` for a full idempotent `e`, which is ASS I.6.3/I.6.10's route to `exists_basic_morita`. `TauCeti.stableTranspose` with its `IsEquivalence` instance, `Algebra/Module/AuslanderReiten/Equivalence.lean:48`, is the Auslander–Bridger duality between finitely presented stable left modules and the opposite of the right ones, so `exists_stable_translate_equivalence` reduces to composing with k-duality. `TauCeti.arTranslate`, `RepresentationTheory/Quiver/Representation/Translate.lean:85`, is an object-level translate of a quiver representation with `isZero_arTranslate_iff` (`:134`). `RepresentationTheory/Quiver/AdmissibleIdeal/Radical.lean` identifies the radical of a bound quiver algebra with the image of the arrow ideal and proves every bound quiver algebra basic, the half of §3.2 that goes from a presentation to the algebra.

**Repair:** Add the four to **From Tau Ceti** with what is assumed of each; say in §3.1 that the basic algebra is the corner at a full idempotent summing one cover per simple class (equivalently `Endₐ(P)ᵐᵒᵖ`), in §6.1 that the new content is the duality `D` on finite-dimensional modules and the identification of the composite with `D Tr`, and in Scope that `arTranslate` is the representation-level object whose module form §6.1 uses.

## R04 (P3) — Page numbers off by two to six pages in four ASS locators

**Location:** README:399–400 “ASS III.3.7–3.13, pp.90–94”; README:438 “ASS III.3.13, pp.93–94”; README:352 “I.6.3 and Corollary I.6.10, pp.35–38”; README:252 “III.1.6, pp.74–75; III.2.4 and III.2.6, pp.80–82”.

**Claim:** Those page ranges contain the cited results.

**Witness:** III.3.8 is on p.89 (`ass line 4848`), III.3.10 and III.3.12 on p.90 (`ass line 4891`, `4921`), III.3.13 on p.91 (`ass line 4958`, scan header `III.3. The dimension vector of a module 91`); pp.93–94 are the chapter's exercises. I.6.3 is on p.33 (`ass line 1893`), I.6.10 on p.37 (`ass line 2044`). III.1.6 is stated on p.72 (`ass line 3897`) with its proof ending on p.75; III.2.4 is on p.79 (`ass line 4322`), III.2.6 on p.81 (`ass line 4445`). The theorem numbers are all correct.

**Repair:** Write “III.3.8–3.13, pp.89–91”, “III.3.13, p.91”, “I.6.3, p.33, and I.6.10, p.37”, “III.1.6, pp.72–75; III.2.4, p.79, and III.2.6, p.81”.

## R05 (P3) — Arbitrary-field statements cite only a source whose standing field is algebraically closed

**Location:** README:76–77 “the general module-theoretic AR duality and existence statements are over arbitrary fields”; README:638–639; §§3.1, 6.2, 6.3 cite only ASS.

**Claim:** ASS supports injective envelopes, basic Morita reduction, AR duality and almost-split existence over an arbitrary field.

**Witness:** `ass line 359`: throughout the book `K` is an algebraically closed field; `ass line 302–304` repeats it for the whole text. IV.2.13 (`ass line 6331`) and IV.3.1 (`ass line 6441`) are stated under that convention. The statements are true over any field (they are theorems about Artin algebras), but the roadmap gives no source at that generality and the sentence at README:638–639 is the author's own argument.

**Repair:** Cite Auslander–Reiten–Smalø, *Representation Theory of Artin Algebras*, by locator as `uncertified` for IV.2.13-type duality (their Chapter IV) and V.1 existence, or another arbitrary-field source, at §§3.1, 6.2 and 6.3; or state in Conventions that the arbitrary-field form is proved here by the route named and that ASS is cited for the algebraically closed case only.

## R06 (P3) — The acyclicity hypothesis is not used by two Layer 4 headlines

**Location:** Lean:80–83 `pathAlgebra_higher_ext_vanish`, Lean:87–93 `homDifferential_coker_equiv_ext`, both with `(hQ : TauCeti.Quiver.IsAcyclic Q)`; README:426 “For finite acyclic Q”.

**Claim:** Vanishing of `Extⁿ` for `n ≥ 2` and the cokernel-to-`Ext¹` comparison need acyclicity.

**Witness:** The one-loop quiver is finite and not acyclic; its path algebra is `k[X]`, a principal ideal domain, so every submodule of a projective is projective and `Extⁿ(M, N) = 0` for all modules and `n ≥ 2`; the standard two-term resolution `⊕ₐ Pⱼ ⊗ Mᵢ → ⊕ᵢ Pᵢ ⊗ Mᵢ → M` exists for every finite quiver, which is also why the pinned `extEuler_vertexSimpleModule` (`Representation/Projective/Simple/ExtEuler.lean:116`) allows cycles. Acyclicity is what makes `kQ` finite-dimensional, which only `eulerForm_eq_hom_sub_ext` needs.

**Repair:** Drop `hQ` from the two theorems and write §4.1's resolution and comparison for finite quivers, keeping acyclicity (finite-dimensionality) only for the numerical identity; or keep the hypothesis and say in §4.1 that it is a scope choice, not a need.

## Verified sound

All 740 README lines and 201 Lean lines were read. The worker's gate at this head: every counter 0, `build=0`, `OK`. Independently: `lake env lean` on `Suggested.lean` exits 0 with twelve `declaration uses sorry` warnings and nothing else; the outside-folder diff (the prescribed command) is empty; the only files changed against main are the folder's README and `Suggested.lean`; the family index `TauCetiRoadmap/RepresentationTheory/README.md:61` is unchanged and still lists the roadmap. Git status clean; nothing in the pull request was changed.

### Signatures

A scratch copy with `#check @name` for all 15 declarations elaborated (exit 0). Each elaborated type was compared with its README statement: every binder the README states is carried explicitly in the signature (`FiniteDimensional k A`, `Module.Finite A _` on `M, N, P₀, P₁`, `IsAlgClosed k` on the presentation and mesh theorems, `IsFinDim` on both arguments of the Euler identity, `Nonempty Q` and weak connectedness on the root bridge). No section variable was silently lost: the three `def`s mention every variable their types need. The `Linear k (ModuleCat A)` instance behind `Module.Dual k (Ext M N 1)` resolves to `ModuleCat.linearOverField` and `Module k (Ext M N 1)` to `Ext.instModule`; `Linear k (FGModuleCat A)` resolves to `Linear.fullSubcategory`. `Abelian (FGModuleCat A)` is not inferred from `[FiniteDimensional k A]` (Mathlib asks `[IsNoetherianRing A]`, `Algebra/Category/FGModuleCat/Abelian.lean:28`), but every Layer 6 statement is a `Prop` built from `ShortComplex.ShortExact` (existence of homology data), `Projective`, `Injective` and `Indecomposable`, and in the full subcategory of finitely generated modules over a Noetherian ring kernels and cokernels exist and are the module-theoretic ones, so these predicates mean what the README says.

### Padding probes

Three scratch copies replaced every `sorry` by `simp`, `rfl` and `infer_instance` respectively: all 12 sorried theorems fail under each (unsolved goals, no progress, or “not a binary relation”). No sorried theorem restates a definition, mirrors a Check or computes a value. `exact` with one library lemma: `exists_injectiveEnvelope` is the pinned `exists_isInjectiveEnvelope_of_finite` up to categorical packaging (R01), not a one-tactic closure.

### Computed adversarial table

A₂ has vertices 1, 2 and arrow a : 1 → 2; left modules, later-factor-first multiplication; `E(d,e) = Σ dᵢeᵢ − Σ_{a:i→j} dᵢeⱼ`; `sᵢ(d) = d − B(eᵢ,d)eᵢ`. Values are over any field unless stated.

| Statement / target | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.1 later-factor-first product | A₂; chain 1→2→3→4; two isolated vertices | e₂a = a = ae₁, e₁a = ae₂ = a² = 0; (cb)a = c(ba); arrows alone generate dim 1 of 2 | Pass; agrees with `pathAlgebra` product and `adjoin_vertexIdempotents_union_arrows` | none |
| 0.1 path counts and dimensions | empty, A₁, A₂, loop | 0/0, 1/1, 3/3, ℵ₀ | Pass | none |
| 1.1 vertex projectives/injectives | A₂ | P₁=(1,1), P₂=(0,1), I₁=(1,0)=S₁, I₂=(1,1)=P₁; regular (1,2) | Pass; `indecProjRep` paths i→j, `indecInjRep` functions on paths j→i | none |
| 1.1 cover and dual basis | A₁; loop at 0; loop over 𝔽₂ | kernel 0; (X−1) proper and onto k; dual cardinality 2^ℵ₀ versus ℵ₀ | Pass; `isEssentialEpi_indecProjRepToSimpleRep` needs trivial closed paths at i | none |
| 1.1 finiteness convention | loop regular module; zero rep | finite over k[X] (1 generator), infinite over k; zero: both finite, d = 0 | Pass | none |
| 2.1 Krull–Schmidt | 0, k, k², k[ε]/(ε²) | summands 0,1,2,1; End of dual numbers has ε² = 0 | Pass; pinned finite-length theorems | none |
| 3.1 injective envelope | A=k: k→k, k→k²; dual numbers 1↦ε; M=0 | identity essential; complement meets k trivially; kε meets (ε) and A; 0→k not essential | Pass as mathematics; object exists at the pin | R01 |
| 3.1 minimal injective presentation | A=k; dual-number simple; M=0 | 0→k→k→0; 0→k→A→A with maps 1↦ε and ·ε, image = kernel = kε | Pass; `IsMinimalInjectiveCopresentation` at the pin | R01 |
| 3.1 basic Morita | A₂; M₂(k); k×k; zero ring | dim End(P₁)=1≠3; Endₐ(A)ᵐᵒᵖ≅A; reduces to k; empty family | Pass; corner equivalence at the pin | R03 |
| `exists_basic_morita` degenerate | A=0, A=k | B=0 (quotient 0 semisimple and reduced), B=k | Pass | none |
| 3.2 admissible presentation | dual numbers; A₂; k×k; zero ring | J=(X), I=(X²), N=2, Jac(k[X])=0; I=0=J²; two isolated vertices; empty quiver | Pass | none |
| 3.2 arrows = Ext¹ | A₂ | Ext¹(S₁,S₂): middle (k→k) nonsplit ⇒ dim 1 = arrows 1→2; Ext¹(S₂,S₁): subrep (k→0) forces arrow 0 ⇒ 0 = arrows 2→1 | Pass; left convention consistent with eⱼ(rad)eᵢ | none |
| 3.2 simple exhaustion | A=0 | no simple objects; clause vacuous; `∃!` forces pairwise non-isomorphic | Pass | none |
| 3.3 Cartan/Euler matrices | A₁; A₂; k×k; dual numbers | [1],[1],[2]; C=[[1,1],[0,1]], E=[[1,−1],[0,1]], CE=I, B=[[2,−1],[−1,2]]; I₂, I₂, 2I₂; C=[2] | Pass; general proof: E(dim Pⱼ, eᵢ)=δᵢⱼ gives CE=I | R02 (at the pin) |
| 4.1 Hom differential component | A₂, M=S₁, N=S₂ | HomVertex 0, HomArrow k, differential 0, cokernel k = Ext¹ | Pass; matches `homDifferential` body | none |
| 4.1 Euler–Hom–Ext | (S₁,S₂),(S₂,S₁),(P₁,P₁),(0,0); A₁ (m,n) | −1=0−1; 0=0−0; 1=1−0; 0; mn=mn−0 | Pass; pinned `extEuler_eq_eulerForm_dimVector` gives the same values | R02 |
| 4.1 higher Ext vanishing | A₂ S₁; dual-number simple; empty quiver; one loop | 0→P₂→P₁→S₁→0; Ext²(k,k)=k excluded by unbound hypothesis; zero ring; k[X] PID ⇒ Ext²=0 without acyclicity | Pass; hypothesis unused | R06 |
| 4.2 reflection at sink 2 of A₂ | S₁, P₁, S₂ | kernels k,0,0; (1,0)↦(1,1), (1,1)↦(1,0), S₂↦0; s₂(1,0)=(1,1), s₂(1,1)=(1,0), s₂(0,1)=(0,−1) | Pass | none |
| 4.2 finite versus infinite | k²→k; shift on k^(ℕ) | B(e₂,(2,1))=0 so (2,1) fixed and reflected (2,1); shift finranks (0,0)↦(0,1) | Pass with finiteness | none |
| 4.2 Coxeter | A₁ simple; A₂ order [2,1] | killed, s₁(1)=−1; S₁↦(k←k)↦S₂, s₁s₂(1,0)=(0,1) | Pass | none |
| 4.2 isotropic locus | Kronecker 2 and 3 arrows at (1,1); 0 | q=0, q=−1 (rep (1,0,0) has End=k), q(0)=0 not a root | Pass | none |
| 5.1 D₄ descent | centre sink, (1;1,1,1) | B(e_c,d)=2−3=−1 ⇒ (2;1,1,1); q: 4−3=1 and 7−6=1; height 4→5 | Pass; BGP Lemma 2.3 route | none |
| 5.1 counts | Aₙ n=0,1,2; D₄ | 0,1,3; 3+8+1=12, each with q=1 | Pass | none |
| 5.2 root pairing | A₁; A₂; Kronecker; (1,−1) | roots ±1, Cartan [2]; six roots, B=[[2,−1],[−1,2]] = polar form = pairing; q(1,1)=0 fails PosDef; q(1,−1)=3 | Pass; `b.cartanMatrix i j = pairingIn ℤ i j` symmetric here | none |
| 5.2 reduced/irreducible | c·d root with d root | q(cd)=c² ⇒ c=±1; loops and double arrows excluded by PosDef (q(eᵢ)=1−loops, q(eᵢ+eⱼ)=2−nᵢⱼ) | Pass | none |
| 5.2 loop examples | ℝ[X]/(X²+1); k[X]/(Xⁿ) n=0,1,2; Kronecker (n,n+1) | simple of dim 2; 0 not indecomposable; q(n,n+1)=1; |ℙ¹(𝔽₂)|=3 | Pass | none |
| 6.1 factoring ideals | A=k; dual numbers; A₂ | all die; k→A→k composes to 0 so id(k) survives; id(P₁) dies, id(S₁) survives in projective quotient; S₁ injective dies, S₂ survives in injective quotient | Pass | none |
| 6.1 translate | A₂ S₁; dual-number k; A=k | Tr S₁ = coker(e₁A→e₂A)=k e₂, D Tr S₁=S₂; A→A→k by ε gives Tr k=k, τk=k; everything zero | Pass; `AuslanderReitenTranslate` = Dual of transpose with the right action | none, R03 cites the pinned equivalence |
| 6.2 AR duality | A₂ (S₁,S₂),(S₁,S₁); dual numbers (k,k); M projective | dim Ext¹ 1 and costable Hom(S₂,S₂)=k/0 dim 1; 0 and Hom(S₁,S₂)=0; 1 and 1 (k→A→k is 0); both 0 | Pass | R05 (source generality) |
| 6.3 almost-split existence | A₂ S₁; projective S₂; dual-number k | 0→S₂→P₁→S₁→0; excluded; 0→k→A→k→0 dims 1,2,1 | Pass | none |
| 6.3 endpoint uniqueness | rescale f by a≠0 | comparison (a⁻¹,1,1): (af)a⁻¹=f, g·1=1·g | Pass; `exists_iso_τ₃_eq` with local End S.X₁ | none |
| 6.3 left end | A₂; dual numbers | S.X₁=S₂=τS₁; k=τk | Pass | none |
| 6.4 mesh multiplicity | A₂ X=P₁,S₁,S₂; dual numbers X=A,k | Irr(P₁,S₁)=1=Irr(S₂,P₁); 0=0; 0=0; Irr(A,k)=1=Irr(k,A) (ε factors through k, in rad²); Irr(k,k)=0 | Pass; ASS IV.4.4 needs algebraically closed k, Lean has it | none |
| Universe/finiteness context | all Layer 6 statements | `Module.Finite A` on M,N,P₀,P₁; `FGModuleCat` objects finite by construction; A Noetherian from finite-dimensional | Pass | none |

### Library declarations opened at the pins

Tau Ceti (66 names cited in README and Lean, all found): `pathAlgebra` `PathAlgebra/Basic.lean:209`, `pathAlgebraBasis` `:719`, `adjoin_vertexIdempotents_union_arrows` `:1071`; `Quiver.IsAcyclic` `Acyclic/Basic.lean:40`; `finite_paths_of_isAcyclic` `Acyclic/FinitePaths.lean:83`; `QuiverRep` `Representation/Basic.lean:53`; `quiverRepEquivalence` `AsModule.lean:574`; `quiverRepFunctor` `OfModule.lean:441`; `IsFinDim` `FiniteDimensional.lean:66`, `module_finite_quiverRepEquivalenceFunctorObj_of_isFinDim` `:187`, `isFinDim_quiverRepFunctor_obj` `:219`; `dimVector` `DimensionVector.lean:48`; `simpleRep` `Simple.lean:103`; `vertexSimpleModule` `VertexSimpleModule.lean:46`; `indecProjRep` `Projective/Basic.lean:111`; `indecInjRep` `Injective/Basic.lean:105`; `isEssentialEpi_indecProjRepToSimpleRep` `Projective/Cover.lean:191`; `isLocalRing_end_of_isIndecomposable` `KrullSchmidt/Indecomposable.lean:266`; `exists_indecomposable_decomposition` `Existence.lean:178`; `exists_equiv_linearEquiv_of_finset` `Uniqueness.lean:228`; `exists_completeOrthogonalIdempotents_isPrimitiveIdempotent` `Idempotents/Primitive/Decomposition.lean:223`; `IsSemiperfectRing` `Jacobson/Semiperfect.lean:62`; `exists_projectiveCover` `ProjectiveCover/ModuleCat.lean:128`; `IsBasic` `Semisimple/BasicAlgebra.lean:184`, `isBasic_iff_isReduced` `:222`; `cartanMatrix` `GrothendieckGroup/CartanMatrix.lean:138`, `cartanMatrix_apply` `:148` (entry `(i,j)` is `[P j : S i]`, columns index projectives as the README says); `IsAdmissibleIdeal` `AdmissibleIdeal/Basic.lean:102` (arrow-ideal powers, `[Finite Q]`); `eulerForm` `EulerForm.lean:57`, `titsForm` `:99`, `titsPolarForm` `:113`; `HomArrow` `HomDifferential.lean:62`, `homDifferential` `:65`, `eulerForm_eq_finrank_hom_sub_finrank_coker` `:149`; `vertexPreReflection` `Reflection/DimensionVector.lean:67`, `vertexReflection` `:132`; `reflectionFunctor` `Reflection/Representation.lean:475`, `dimVector_reflectRep` `:687`; `dimVector_reflectRep_of_indecomposable` `Reflection/Indecomposable.lean:509`; `reflectionFunctorList` `Composite.lean:114`, `coxeterFunctor` `:359`, `indecomposable_and_dimVector_coxeterFunctor_or_isZero` `:467`; `IsAcyclic.exists_isSinkAdmissible` `Admissible.lean:318`; `reflectList_eq_self` `Iterate.lean:278`; `exists_vertexPreReflectionList_take_apply_eq_single_and_nonneg` `PositiveRoot.lean:175`; `isFiniteRepType_iff_titsForm_posDef` `FiniteRepType/Gabriel.lean:100`; `gabrielIndecomposableEquivPositiveRoot` `Correspondence.lean:78`; `IsFiniteRepType` `FiniteRepType/Basic.lean:87`; `IsMinimalProjectivePresentation` `MinimalProjectivePresentation/Basic.lean:133`; `AuslanderReitenTranspose` `AuslanderReiten/Transpose.lean:103`; `AuslanderReitenTranslate` `Translate.lean:111`, `nonempty_linearEquiv_auslanderReitenTranslate` `:244`; `AuslanderReitenTranspose.stableMap` `StableMorphism.lean:147`; `irreducibleMorphismSpace` `Preadditive/Radical/Quotient.lean:151`; `ObjectProperty.factorIdeal` `MorphismIdeal/FactorThrough.lean:65`; `MorphismIdeal` `MorphismIdeal/Basic.lean:85`, `MorphismIdeal.Quotient` `:194`; `ShortComplex.IsAlmostSplit` `AlmostSplit/Sequence.lean` (short exact, left and right almost split); `IsAlmostSplit.exists_iso_τ₃_eq` `AlmostSplit/Uniqueness.lean:188` (needs `IsLocalRing (End S.X₁)` and `(End S'.X₁)`). Found and not cited (R01–R03): `exists_isInjectiveEnvelope_of_finite`, `IsMinimalInjectiveCopresentation`, `extEuler_eq_eulerForm_dimVector`, `extEulerPairing_add_flip_eq_titsPolarForm`, `extEulerMatrix_eq_inverseCartanMatrix_transpose`, `cartanMatrix_transpose_mul_extEulerMatrix_eq_one`, `IsIdempotentElem.cornerEquivalence`, `stableTranspose` (equivalence), `arTranslate`. No almost-split existence, AR duality, Gabriel presentation (basic ⇒ bound quiver), or root-pairing bridge exists at the pin (`grep` of `CategoryTheory/AlmostSplit`, `Algebra/Module/AuslanderReiten`, `RepresentationTheory/Quiver`, and `RootPairing` across `RepresentationTheory/`), so those headlines are this roadmap's.

Mathlib: `Module.equiv_directSum_of_isTorsion` `Algebra/Module/PID.lean:230`; `HasBinaryBiproducts.of_hasBinaryCoproducts` `CategoryTheory/Preadditive/Biproducts.lean:421`; `Module.finrank_of_not_finite` `LinearAlgebra/Dimension/Free.lean:268`; `CompositionSeries.jordan_holder` `Order/JordanHolder.lean:454`; `MoritaEquivalence` `RingTheory/Morita/Basic.lean:57`; `IsArtinianRing.isNilpotent_jacobson_bot` `RingTheory/Artinian/Ring.lean:54`; `isSemisimpleRing_iff_jacobson` `Artinian/Module.lean:641`; `Quiver.WeaklyConnectedComponent` `Combinatorics/Quiver/ConnectedComponent.lean:46`; `RootPairing.Base` `LinearAlgebra/RootSystem/Base.lean:68`; `Base.cartanMatrixIn` `CartanMatrix.lean:52` with `pairing` `Defs.lean:195`; `ModuleCat.restrictScalars` `ChangeOfRings.lean:85`; `ShortComplex.ShortExact` `ShortComplex/ShortExact.lean:34`; `Abelian.Ext` `DerivedCategory/Ext/Basic.lean:118`; `Indecomposable` `Limits/Shapes/BinaryBiproducts.lean:1096`; `FGModuleCat` finite limits and colimits for any ring (`FGModuleCat/Limits.lean:74`, `Colimits.lean:66`), abelian for Noetherian rings (`Abelian.lean:28`).

### Cross-roadmap citations and ownership

SemisimpleAlgebras on main: Layer 1.5 (`README.md:200`) and Layer 2 (`:212`) exist and say what §3.1 consumes. RootSystems on main: Layers 1 (`:218`), 2 (`:245`), 5 (`:321`) exist; Layer 5 carries `existsUnique_dynkinType` and `exists_rootPairing_of_dynkinType`. GrothendieckEulerForms on main (`README.md:12`, `:162`, `:588`) consumes this roadmap and uses `C_{ij} = [P_j : S_i]`, the transpose of the row convention here, as README:723–725 says. QuiverRepresentationsPartII at its open head (`README.md:7`, `:73–79`, `:219`) consumes Layers 1, 2 and 5 and has §§1.1–1.6 and Layers 2–4. McKaySkewGroup at its open head (`README.md:77`, `:272`) consumes primitive idempotents and Morita invariance. The merge order lists QuiverRepresentationsPartII (246) and McKaySkewGroup (290) after this on-main roadmap; the other suppliers are on main. Dependency check, verbatim:

```text
depcheck: 204 roadmaps, 1502 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Ownership against open pull requests: `roadmaps grep` over the 438 open heads for almost-split sequences, AR duality, injective envelopes and basic Morita reduction hits this roadmap on main, ArtinAlgebras (open, another author, not in the merge order) and incidental mentions elsewhere. ArtinAlgebras at its head says its Artin-algebra Layers 0 and 3–5 **replace** this roadmap's field-case Layer 6 and cites sublayers “6A–6F”, “6E” and `arQuiver k A`, labels this head no longer has. This roadmap is on main and owns its Layer 6; that drift and the two-owner question are ArtinAlgebras' to settle when it is reviewed, not a defect of this folder. No two `Suggested.lean` files among the checkouts declare the same fully qualified name as this file's `TauCetiRoadmap.QuiverRepresentations.*`.

### Sources read

- **ass** (institutional teaching copy, `ass`, scan page = printed page + 11). Standing field: `ass line 302–304`, `359`. II.1.4 p.45 (`2394`), II.1.8 p.48 (`2524`), II.2.1 p.53 (`2782`), II.3.7 p.64 (`3404`), I.4.8 pp.22–23 (`1321`), I.4.10 p.23 (`1370`), I.5.12–5.14 pp.30–31 (`1747`, `1755`, `1779`), I.5.15–5.16 pp.31–32 (`1790`, `1802`), I.6.3 p.33 (`1893`), I.6.10 p.37 (`2044`), III.1.6 pp.72–75 (`3897`–`4012`), III.2.4 p.79 (`4322`), III.2.6 p.81 (`4445`), III.2.12 pp.84–85 (`4621`), III.3.8–3.13 pp.89–91 (`4848`–`4968`), VII.1.4 p.245 (`12128`), VII.1.7 pp.248–249 (`12279`), IV.1.11–1.13 pp.104–105 (`5675`, `5697`, `5723`), IV.2 stable categories pp.109–110 (`5889`–`5944`), IV.2.10–2.11 p.116 (`6267`, `6283`), IV.2.13 pp.117–118 (`6331`), IV.3.1 p.120 (`6441`), IV.4.1 p.125 (`6725`), IV.4.2 p.126 (`6735`), IV.4.4 p.128 (`6867`). Each supports the statement it is cited for, after the right-to-left module transposition the README declares; the page slips are R04 and the field convention R05.
- **bgp** (author-hosted translation, scan page = printed page − 16): arbitrary field and finite-dimensional vertex spaces p.17 (`bgp line 22–23`); Theorem 1.1 pp.21–22 (`173`); roots and Lemma 2.2 pp.27–28 (`404–426`); Lemma 2.3 p.28 (`430`); Theorem 3.1 p.28 (`447`); Note 1 p.30 (`527`). All as cited.
- **etingof** (arXiv:0901.0827v5, scan page = printed page): Definition 5.20 and Remark 5.21 p.89 (`3977`, `3980`), Theorem 5.23 p.89 (`3991`), Definitions 5.26–5.27 p.90 (`4007`, `4021`), Example 1.19(2) p.9 (`322`); standing algebraically closed field at `221`, which README:555 respects.

## Not verifiable

- Auslander–Reiten–Smalø is not cited by this head and was not fetched; it is the natural source for R05 and would be `uncertified` (Cambridge).
- Ownership was checked against the open pull requests this brief lists and, through `roadmaps grep`/`roadmaps show`, against ArtinAlgebras; board packages were checked by the index only (none concerns quivers).

## Source issues

- none
