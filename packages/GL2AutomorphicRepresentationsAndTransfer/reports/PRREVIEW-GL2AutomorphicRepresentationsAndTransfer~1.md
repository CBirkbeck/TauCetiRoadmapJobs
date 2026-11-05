# Review of GL2AutomorphicRepresentationsAndTransfer (pull request #931 at efb6d45)
**Verdict:** needs changes

## R01 (P1) — Remove the local Langlands–quaternionic dependency cycle

**Location:** `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:424`: “The inner-form parameter assignment uses … through R17.1/local-quaternionic-comparison.” The same backward edge occurs in the layer dependencies at line 445.

**Claim:** R16.0/local-langlands requires R17.1/local-quaternionic-comparison.

**Witness:** `README.md:1380` constructs the quaternionic parameter by applying R16.0 to JL; `README.md:1395` explicitly needs R16.0. Thus the target graph has R16.0 → R17.1 → R16.0. This is independent of the external order checker.

**Repair:** Keep the split-group correspondence and its factor comparisons in the earlier target, supplied as in R03. Move the entire inner-form parameter assignment and its Needs edge into R17.1. In R16.0 describe it only as a downstream application. Also keep the quaternionic Check in R16.3.3 downstream, as its last paragraph already intends. On the two-target witness this changes the edge set from {A→B, B→A} to {B→A}; the trivial D× class can then acquire the Steinberg parameter after the GL₂ correspondence exists.

## R02 (P2) — Retain the local-field hypotheses in the elaborated projectivity theorem

**Location:** `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean:90` and `:106`: the section declares `p`, primality, a normed ℚ_p-algebra structure and finite dimensionality, but the theorem signature does not retain them.

**Claim:** The Lean acceptance test expresses the fixed-central-character supercuspidal projectivity theorem of README R16.2.10 over the intended nonarchimedean local field.

**Witness:** `#check @TauCeti.GL2Blueprint.supercuspidalProjective` starts with an arbitrary `NontriviallyNormedField F` and `CompleteSpace F`. There is no p, primality, `NormedAlgebra`, or `FiniteDimensional ℚ_[p] F` binder. The signature admits ℝ; the intended finite-extension hypothesis does not.

**Repair:** Put `(p : ℕ) [Fact p.Prime] [NormedAlgebra ℚ_[p] F] [FiniteDimensional ℚ_[p] F]` explicitly on this theorem, or explicitly include named instances with the equivalent effect. I elaborated that repair on a scratch copy: all four binders survive `#check`, and the file succeeds with only its ten admitted-proof warnings. This excludes the ℝ witness and retains finite extensions of ℚ_p. I am reporting an unsupported enlargement of the domain, not claiming a counterexample to every possible generalized projectivity theorem.

## R03 (P2) — Consume the existing classical local Langlands correspondence

**Location:** `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:366`: “construct the bijection”; line 398 similarly constructs the rank-three correspondence. Lines 53–54 and 259–261 assign ownership here.

**Claim:** This roadmap owns construction and inversion of the classical finite-place GL₂ correspondence and the GL₃ correspondence used by transfer.

**Witness:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4591`, SR.5.2, explicitly owns the classical GL_n correspondence, followed by its coefficient descent and normalization. `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:187` consumes that same SR.5.2 owner.

**Repair:** Cite SR.5.2's classical correspondence at n=2,3 in Scope and Exact supplier contracts. Retain precise targets for the geometric-reciprocity adapter and any conductor/pair-factor comparison not actually supplied there; delete the second construction and inverse. Update R16.3.3's ownership language too. Test the adapter on a character whose arithmetic Frobenius value is 2: its geometric Frobenius value is 1/2, not 2. Retain the existing Steinberg test (rank N=1, conductor 1) so that normalization transport cannot silently discard monodromy. This repairs a duplicated component; it does not require rejecting the whole roadmap.

## R04 (P2) — Build general correspondence traces before the curve application

**Location:** `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2646`: “For a smooth proper curve X”; line 2674 further restricts the contraction centre to “a reduced closed point”.

**Claim:** These two constructions provide the trace and contraction theory needed by the conductor argument, but own only its curve/point special cases.

**Witness:** varshavsky05 lines 169–175, 360–376 and 629–652 allow separated finite-type schemes and arbitrary closed contraction centres. The identity on ℙ² has trace 1+1+1=3 and integrated local term 3, but is excluded here.

**Repair:** State the trace construction for separated finite-type schemes over a separably closed field and the source's constructible finite-Tor coefficient categories; state proper-pushforward compatibility and the proper trace formula with their respective hypotheses. State contraction for an arbitrary closed subscheme Z, with integration only for proper fixed components. Keep the smooth-curve, reduced-point and adic-realization comparisons as applications. On ℙ² the repaired trace theorem reads 3=3. For X=ℙ¹×ℙ¹ and the graph of (t,s)↦(t²,s), the component Z={0}×ℙ¹ contracts since (t²)⊂(t) and (t²)¹⊂(t)²; its local term is χ(ℙ¹)=2, matching the restricted term. Both instances are outside the stated construction and inside its cited source. This follows the brief's general-library requirement, rather than making the conductor route own a restricted replacement. Keep the prerequisite earlier in the supply order: EtaleDualityAndPerverseSheaves is later, so adding it as a supplier is not a repair. The shared trace prerequisite must be owned earlier and later consumers should import it.

## R05 (P3) — Remove the 121 anchor tags rejected by the gate

**Location:** `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:362`, for example `<a id="r16-0-local-langlands"></a>`.

**Claim:** The document satisfies the supplied text gate.

**Witness:** The worker's gate reports `residue=121`, all represented by the explicit anchor-tag rule; the first examples are lines 362, 456, 496, 506 and 535. No other text scanner fails.

**Repair:** Delete the forbidden HTML anchors and use Markdown heading links, updating incoming links where necessary. Removing the displayed tag removes this instance of the scanner match without deleting its target heading or mathematics. Re-run the gate for all 121 occurrences.

## R06 (P3) — Align the Lean namespace and README API names with the acceptance-test form

**Location:** `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean:51` and `:86`; `README.md:2253`–`:2260`.

**Claim:** Backticked own API names refer to declarations in the acceptance test, in the roadmap namespace.

**Witness:** The file uses `TauCeti.GL2Transfer` and `TauCeti.GL2Blueprint`. The README names `cubicBaseChange_local`, `cubicBaseChange_unramified` and four sibling API declarations; none is declared in its ten-theorem Lean file.

**Repair:** Use `TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer`, update the README's qualified references, and add the prescribed layer comments and “target signatures” module heading. Write the unstated cubic API, projector API and similar API bullets in mathematical prose without invented Lean identifiers. Do not fill the acceptance test with those missing API lemmas. The six cubic promises remain readable targets while the own-name/declaration comparison becomes accurate.

## R07 (P3) — Give the Iwahori-centre definitions discriminating Checks

**Location:** `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:793`–`:801`: the section defines U₀, U₁, eK and z₁ and gives their comparison, but has no Checks.

**Claim:** The definitions have the required three discriminating Checks, including their denominator normalization.

**Witness:** At q=4 and Satake roots 2,3, U₁ has eigenvalues 4,6, U₀ has value 6, and both z₁ eigenvalues are 10. The nearby layer examples do not test this calculation or the q+1 denominator.

**Repair:** Add at least these three prose Checks: (1) the distinct-root calculation just given, agreeing with √q(2+3)=10; (2) roots 1,1 at q=4 give U₀=1, z₁=4; (3) at q=2 over ℤ[1/2], q is invertible but q+1=3 is not, so the proposed normalized eK is unavailable. These distinguish the missing q coefficient, repeated roots and the extra idempotent denominator. Keep them out of Suggested.lean.

## R08 (P3) — Add the source ledger required by the review contract

**Location:** `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:3001`, References; the folder has no `sources.toml`.

**Claim:** Source identity, legal provenance, version and certification status are recorded reproducibly.

**Witness:** The references use several aliases for the same work (notably jl70/jl70-ubc/jl70-global), but there is no source entry recording their shared identity or the different pagination. The prescribed source ledger is absent.

**Repair:** Add the required source ledger with one lifetime key per work, legal fetched metadata and version/locator notes. Consolidate the JL, Pan and CDN aliases as appropriate. Record inaccessible or paywalled texts honestly; do not copy PDFs or extracted source text into the repository. For the JL witness, one entry must distinguish the printed page numbers from the fetched retypeset document's PDF indices.

## Verified sound

The review read both target files, the normative repository README and CONTRIBUTING, and the ModularForms and GlobalQuadraticForms roadmaps on main for shape. The reviewed HEAD is the requested commit; the worktree has no changed files, and the diff outside this roadmap is empty. This is a new folder rather than a replacement of an existing roadmap. No computational algorithm, sorry'd data, set_option, admitted example or copied passage was found in the inspected source sample. R04 records a restricted foundational construction. No previous review was supplied.

**Gate and elaboration.** The worker's complete gate summary is:

```text
gate GL2AutomorphicRepresentationsAndTransfer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=121 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=3 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL
```

The imported object files were available for the review, and I ran `lake env lean` on the target file. It succeeds with exactly ten `sorry` warnings. The initial missing-object-file diagnostic was an environment build prerequisite, not a defect in the source. A scratch copy appended `#check @name` for all ten declarations; R02 is the lost-binder discrepancy found. The other nine retain their number-field, characteristic, irreducibility, continuity/open-kernel, local reduction and Frobenius hypotheses. In particular, the Artin statements quantify over genuine unramified Frobenius elements and normalized newforms. The residual statement excludes 2 and the level in its good-prime comparison and supplies an actual ring-of-integers reduction map.

Replacing each admitted proof by the one-tactic alternatives `rfl`, `simp`, `infer_instance` did not close any of the ten declarations. Searches of the pins found no single library lemma asserting these ten full statements. No padding deletion is requested. These probes test ease of proof, not truth.

**Headline inventory.** The statable headlines represented by the ten Lean declarations are Chevalley power congruences; finite Hecke character prescription on full local groups; fixed-character supercuspidal projectivity; quaternion ramification realization; quaternion local-global isomorphism; continuous finite projective lifting; Fong–Swan integral lifting in arbitrary rank; odd-dihedral characteristic-two projective classification; odd solvable Artin weight one over ℚ; and characteristic-two solvable residual weight one. The README also reaches local LLC and factor/conductor comparisons, local type and newvector comparisons, the adelic/classical/Hilbert dictionaries and rationality, local/global Jacquet–Langlands and trace comparison, prime-cyclic/solvable/non-normal cubic base change, adjoint transfer and automorphic induction, strong all-place Langlands–Tunnell, ramified cohomological conductor comparison, exact Rohrlich–Tunnell weight/level, Katz weight one and compatible-system descent. The module docstring names these missing-carrier families. Their missing smooth/WD/automorphic/cohomological carriers were not replaced by free Prop fields. The two classical coefficient headlines are explicitly identified as good-prime consequences, not as the all-place theorem. I found no additional statable headline that should be forced through a proxy.

**Seeded source sample.** All 54 distinct reference keys in the inventory were attempted through the legal sources service; aliases were consolidated for fetching. Forty-eight yielded cached texts, of which four relevant older articles have no readable body. There were no explicit “unverified” locators beyond the seeded list in the README. The following is a locator audit, not a claim that source access proves the entire roadmap.

| Seeded target | Text and locator inspected | Outcome |
|---|---|---|
| Fixed-space comparison, R16.2.7 | cg20 lines 179–195, §1.3, pp.805–806; AL.2 GL₂ newvectors | The roadmap's infinite-dimensional hypothesis avoids the source's nontrivial-character exception. K₁ and K₀ fixed spaces agree only with unramified central character; dimensions 2 and 1 separate principal series and Steinberg. |
| Ramification realization, R17.1.5 | prr23 Theorem 1.33 pp.42–43 not accessible; main GlobalQuadraticForms §4.4 and ClassFieldTheory Layer 10 opened | Direct source locator uncertified here. The actual supplied sign prescription and Brauer injectivity support the even finite/real ramification argument. |
| Quaternion proof, R17.2.6 | jl70 lines 18501–18510, 19696–19706, 19733–19735, §16, printed pp.261,276–277 in the fetched IAS scan | Two local factors satisfying (16.1.7) kill terms (iv)–(viii); the derivative product explains why one factor is insufficient. The source explicitly leaves analytical justification unfinished; the roadmap assigns it to AutomorphicSpectralTheory. |
| Classical coefficient/Hecke adapter to Pan, R17.3.9 | pan26 lines 3075–3086, Definition 5.4.11, p.71; lines 3271–3288, pp.75–76; QuaternionicModularForms §§1.3,2.1,3.1 | Checked the inverse coefficient action, right translation, opposite-Hecke adapter and weight k+2. Weight zero retains the norm-character summand; positive polynomial degree excludes it. Inspected version is arXiv v1, whose cited section numbers agree. |
| Whittaker-type-module bridge, R17.4.13b | gj78 lines 2051–2158 and 2209–2270, §§9.1–9.3 and 9.5–9.6, pp.531–537 | The reducible attached module is retained. Its extra Euler factor differs from the generic constituent's; genericity is an output, not a premise. The non-self-twist hypothesis is used in the pole argument. |
| Cubic monomial input, R17.4.17 | jpss79 Theorem 14.2 pp.253–254 and p.255 | Image-only body; source-level support not certified. The S₃ decomposition and norm-pullback exceptional formula were independently tested below. |
| All-place comparison, R17.4.17 | henniart02 lines 122–133, Theorem 1.5 p.590; deligne73 lines 792–821, 901–930, 1272–1289, 1335–1346, 1972–1984 | Pair-factor compatibility and dimension-zero induction give the squared lambda factor. The real cubic étale tests have signs −1 and +1; a global product of one does not remove them locally. Deligne's extracted displayed formulas are partly degraded, so not every symbol of (8.12.2)–(8.12.4) is certified from that extraction. |
| Oddness API, R17.5.13 | bcgp21 lines 12593–12624, Proposition 10.1.3 and proof, pp.473–474 | The source uses a solvable lift in a more specialized setting; it is not itself the general determinant lemma. The domain/characteristic argument in the roadmap is a direct deduction, checked with positive and negative controls below. |
| Domain test, R17.5.15 | tunnell78 Theorem 1.3 pp.182–183 inaccessible; explicit character calculated independently | Values at 2, units and torsion distinguish the full local group from its units or roots of unity. No unsupported certification of Tunnell's theorem is inferred. |
| Order test, R17.5.15 | Same inaccessible locator; finite C₄ calculation independent of it | The extension has order four; an order-two extension is impossible. This does not claim a prescribed-order Grunwald theorem. |
| Construction and local finiteness, R17.5.16 | patrikis lines 1374–1386, Lemma 2.3.1 p.28; carayol86 lines 1558–1575, §11.2 p.450; pinned Units.mem_torsion | The angular infinity type and Carayol's local/archimedean prescription agree. The nonsplit prime is fixed by CM conjugation, making a/conjugate(a) a global unit of modulus one. Local finiteness follows; it is not inferred merely from being unitary. |
| Parabolic comparison, R17.6.4 | carayol86 lines 447–490 (§2.2 pp.419–420), 700–705 (§4.9 p.426), 1595–1613 (§11 p.451); varshavsky05 lines 360–385 and 629–663 | Checked the rank-two multiplicity, arithmetic dual/unitary twist, retained monodromy, and contraction direction. The Δ calculation and unequal-order branch tests below distinguish the normalizations. |

**Adversarial finite-instance record.** The 144 rows below record actual values or a concrete included/excluded instance. A successful finite test is not a proof of a general theorem; inaccessible source steps remain listed separately. Rows cover every numbered target subsection, the ten Lean headlines, all twelve sampled targets, and the statements affected by findings. Within an API block the listed values test its displayed formulas and associated compatibility together. “Retain” means the tested assertion needs no change; it does not certify untested universal cases.

| Statement | Instances tried | Computed sides / positive and negative controls | Result and change |
|---|---|---|---|
| Conventions: modulus, reciprocity, normalized induction  |  q=4, diag(ϖ,1); scalar ϖI  |  δ=1/4, δ½=1/2; scalar δ=1. χ(Φarith)=2 gives χ(Φgeom)=1/2  |  Retain. |
| R16.0.1 correspondence, monodromy/conductor  |  q=4, r=diag(1/2,2), N=E12; N=0 control  |  rNr⁻¹=N/4; a=0+2−1=1; with N=0, a=0+2−2=0  |  Mathematics retained; ownership R03 and dependency R01. |
| R16.0.1 inner-form build order  |  A=local LLC, B=quaternion adapter  |  Declared A→B and B→A give a directed cycle of length 2; proposed graph has just B→A  |  R01. |
| R16.1.3 last-row K₁/K₀  |  depth 1 at 5: upper/lower unipotents, diag(2,1), 2I; depth 0  |  Membership: upper (yes,yes), lower (no,no), diag(2,1) (yes,yes), 2I (yes,no); both depth-zero groups GL₂(O)  |  Retain. |
| R16.1.4 Iwasawa/Cartan  |  diag(ϖ²,ϖ), diag(ϖ,ϖ²)  |  Elementary-divisor valuations {1,2} both; determinant valuation 3 both; ratio modulus q⁻¹ versus q  |  Retain. |
| R16.1.5 central-character L²  |  f(zg)=ω(z)f(g); ω(z)=i or 2  |  Squared norm ratios 1 and 4; only first descends without a norm twist  |  Retain. |
| R16.1.6 finite-level/classical comparison  |  k=2, scalar −I; k=3 with trivial character  |  Transformation factors (+1,+1) and (−1,+1); latter forces f=0  |  Retain. |
| R16.1.7 Chevalley headline  |  E=⟨2⟩ in ℚ×, n=2 or 3; n=1  |  Mod 3: 2^j=1 iff j even; mod 7 iff 3 divides j. n=1 gives E¹=E and unit modulus  |  Retain. |
| R16.1.7 saturation step  |  E=⟨4⟩⊂ℚ×  |  Saturation contains ±2^j, quotient has order 4; exponent 2 kills it, since (±2^j)²=4^j  |  Retain. |
| R16.1.8 finite Hecke headline  |  S empty; local unramified quadratic at 2  |  Empty prescription: Ψ=1. Nonempty: χ₂(2)=−1, χ₂ on ℤ₂×=1; even quadratic character mod 5 has χ(2)=−1 and χ(−1)=1  |  Retain. |
| R16.1.8 quotient extension criterion  |  G=C₄, H={0,2}; N=0 or H  |  χ(2)=−1 extends by χ(1)=i for N=0; for N=H, H∩N=H and extension killing N would require −1=1  |  Both directions discriminate. |
| R16.1.8 quasicharacter norm removal  |  q=4, α(ϖ)=2  |  s=−1/2 gives q^(−s)=2; ν(ϖ)=α(ϖ)/2=1  |  Retain. |
| R16.2.1 local classification  |  ratio ν, generic ratio 2/3 at q=4; rank-one determinant class  |  Reducible boundary has character quotient dim 1 and generic St constituent; generic ratio is neither 4 nor 1/4  |  Retain. |
| R16.2.6 spherical Whittaker formula  |  q=4, α=2, β=3, m=−1,0,1,2  |  W values 0,1,5/2,19/4; repeated roots α=β=1 give W₂=3/4, not a 0/0 quotient  |  Retain. |
| R16.2.7 fixed-space comparison [sample]  |  unramified principal series, St, nontrivial unramified χdet  |  (dim I,dim K)=(2,1),(1,0),(1,1); K₁=K₀ invariants with unramified centre  |  Retain. |
| R16.2.7 repeated-root oldform matrix  |  U=[[2,1],[-1,0]]  |  U−I=[[1,1],[-1,-1]]≠0 and (U−I)²=0; characteristic polynomial (X−1)²  |  Retain. |
| R16.2.8 Kirillov comparison  |  characteristic function of O×; x=ϖ and x=1  |  Values 0 and 1; multiplying by ψ(bx) preserves support O×; zero function has empty support  |  Retain. |
| R16.2.9 type unicity  |  τ and an unramified twist τ⊗χdet  |  Restriction χ to O× is 1, so the K-type action is identical; an outside inertial class has Hom dimension 0 versus 1 inside  |  Retain. |
| R16.2.10 projectivity headline  |  intended F=ℚ₂; wider admitted F=ℝ  |  Original signature retains 0 of the 4 p/extension binders; scratch repair retains all 4  |  R02; fixed ω and smooth-dual conditions otherwise present. |
| R16.2.11 vexing type  |  tame χ of order 3, residue q=2  |  χ^q=χ²=χ⁻¹≠χ, χ^(q+1)=1; trivial χ has χ=χ^q  |  Retain. |
| R16.2.12 Iwahori centre  |  q=4, roots 2,3  |  U₁=4 or 6, U₀=6; U₁+qU₀/U₁=10 both, equal √q(2+3)  |  R07: add as Check. |
| R16.2.12 repeated roots and denominator  |  q=4 roots 1,1; q=2 over ℤ[1/2]  |  z₁=2+4/2=4, U₀=1; at q=2, 2 is a unit and 3 is not  |  R07: two further Checks. |
| R16.2.13 archimedean classification  |  real ratio absolute value or sign; complex z zbar or z/zbar  |  Real quotient dimensions 1 versus infinite limit; complex pq=1 versus opposite signs, irreducible  |  Retain. |
| R16.3.1 principal parameters  |  q=4, α=2,β=3; one ramified character  |  det=6, Euler polynomial 1−5T+6T²; ramified rank-one factor equals 1  |  Retain. |
| R16.3.2 Steinberg  |  r=diag(1/2,2), N=E12 at q=4  |  ker N=span(e₁), L=(1−T/2)⁻¹, det=1; forgetting N gives degree 2 and conductor 0 instead of 1  |  Retain. |
| R16.3.3 primitive dyadic example  |  α=[[0,−1/2],[1,0]]  |  α²=−I/2; normalized depth 1/2; proposed conductor 3 gives Swan=3−2=1; different d≥1 makes 1≥3d false  |  Algebraic/ramification checks retained; full BH source uncertified. |
| R16.3.4 Tate normalization  |  q=4, roots 2,3  |  Tate roots 4,6, determinant 24=4·6; L(s−1/2) has exactly these roots  |  Retain. |
| R16.3.5 conductor and twist  |  St unramified; ramified χ of conductor 1  |  a=1 versus 2; formula a(St)+2a(χ) would give 3, so is rejected  |  Retain. |
| R16.3.5 additive character  |  q=4, a=ϖ, ω(a)=1, s=1  |  ε(ψ_a)/ε(ψ)=4⁻¹=1/4; at s=1/2 ratio=1  |  Retain. |
| R16.3.6 infinity factors  |  s=1,2; D₂ and angular ±1  |  Γℝ(1)=1, Γℝ(2)=1/π, product=Γℂ(1)=1/π; Γℂ(2)=1/(2π²); ε(D₂)=−1, ε(±1)=i  |  Retain. |
| R16.3.7 tame dihedral prime order  |  q=2, θ order 3 on unramified quadratic units  |  θ^q=θ⁻¹≠θ; inertia eigenvalues ζ₃,ζ₃⁻¹; fixed dimension 0 and tame conductor 2  |  Retain. |
| R16.3.8 tame supercuspidality  |  same θ, versus θ invariant  |  Ind θ irreducible for θ≠θ^σ; θ=1 gives 1⊕η  |  Retain. |
| R16.3.9 CDT inertial comparison  |  θ,θ⁻¹ of order 3  |  Inertial trace ζ₃+ζ₃⁻¹=−1, determinant 1; unramified scalar twist changes neither  |  Retain. |
| R16.4.1 tensor realization  |  pure tensor with two varied places, all others distinguished  |  Product coefficient a·b, with a=2,b=3 gives 6; replacing a distinguished vector by 0 gives zero tensor  |  Retain. |
| R16.4.2 Fourier expansion  |  additive circle characters e(x),e(2x)  |  ∫e(x)e(−x)=1; ∫e(2x)e(−x)=0; constant cusp coefficient=0  |  Retain. |
| R16.4.3 multiplicity comparison  |  embeddings j and 2j, nonzero vector v  |  Images j(v),2j(v); Hom multiplicity dimension 1, not two distinguished embeddings  |  Retain. |
| R16.4.4 Hecke strong multiplicity  |  roots 2,3 versus 1,4  |  Both traces 5, determinants 6 versus 4; pairs (5,6),(5,4) differ  |  Retain. |
| R16.4.5 rationality  |  root pair {i,−i}; complex conjugation  |  trace 0 and determinant 1 are rational; coefficient conjugation permutes roots  |  Retain. |
| R16.4.6 non-CM condition  |  dihedral Ind θ with quadratic η; non-self-twist hypothesis  |  η restricted to inducing subgroup=1, hence Ind θ⊗η=Ind θ with η≠1  |  Retain. |
| R16.5.1 Mellin comparison  |  one Fourier term e^(−2πy)  |  ∫₀∞e^(−2πy)y^(s−1)dy=(2π)^(−s)Γ(s); at s=1 both 1/(2π)  |  Retain. |
| R16.5.2 converse adapter  |  π with no omitted local factors versus omitted place v  |  Full Euler datum includes P_v=1−5T+6T²; outside-v data have no coefficient fixing 5 or 6  |  Retain. |
| R16.5.3 classical/unitary L shift  |  weight k=2 or 1  |  Shifts (k−1)/2=1/2 or 0; arithmetic roots √qα,√qβ or α,β  |  Retain. |
| R16.5.4 global functional equation  |  conductor N=16, s=0,1,1/2  |  N^(1/2−s)=4,1/4,1; applying reflection twice gives 1  |  Retain. |
| R16.6.1 primitive dictionary  |  k=1 and k=2  |  Infinity types are full weight-one limit and D₂; replacing the first by a nonexistent D₁ discrete series fails  |  Retain. |
| R16.6.2 complete level dictionary  |  local conductor c=1; level depths 0,1,2  |  fixed dimensions 0,1,2; minimum 1, not any deeper oldlevel  |  Retain. |
| R16.6.3 Hilbert weights  |  k=2,w=0; k=3,w=1  |  Sym exponents 0,1; dimensions 1,2; k and w have same parity in each  |  Retain. |
| R16.6.4 arithmetic weight conversion  |  k=2,q=4, unitary roots 2,3  |  arithmetic roots 4,6; det=24 versus unitary det=6  |  Retain. |
| R16.6.5 newvector exports  |  two finite factors each minimal dim 1; one raised by one  |  tensor dimensions 1·1=1 versus 2·1=2  |  Retain. |
| R16.6.6 weight one  |  odd involution diag(1,−1)  |  trace 0, det −1; parameter 1⊕sgn at infinity; scalar −I instead det +1  |  Retain. |
| R17.1.1 local JL  |  trivial D× class; split algebra  |  elliptic character values +1 on D× and −1 on St; split comparison sign +1  |  Retain. |
| R17.1.2 norm characters  |  χ(a)=i at chosen a  |  centre of χ∘Nrd equals χ(a²)=−1, same as St⊗χdet  |  Retain. |
| R17.1.3 real coefficients  |  k=2,3  |  quaternionic Sym^(k−2) dimensions 1,2; transferred weights 2,3  |  Retain. |
| R17.1.4 wild/dyadic compatibility  |  primitive example a=3, Swan=1  |  JL has the same degree-two WD datum with N=0, a=3; St would have N rank 1, a=1  |  Retain. |
| R17.1.5 ramification headline [sample]  |  ℚ: S=∅, {∞}, {2,∞}; complex place control  |  Cardinal parity even, odd, even; split algebra, impossible singleton, Hamilton (−1,−1) ramified at 2,∞; complex place always split  |  Retain. |
| R17.1.5 local-global headline  |  identical (−1,−1) pairs; compare split (1,1)  |  Identity equivalence for first; Hamilton vs split disagree at ∞ (nonsplit/split), so hypothesis fails  |  Retain. |
| R17.1.5 exchange of invariants  |  S={2,∞}, exchange 2 with 3  |  New S={3,∞}; both size 2; signs at 2,3 swap and product stays +1  |  Retain. |
| R17.2.1 Steinberg projector  |  χ=1; St, spherical principal, trivial character  |  H/K projector trace pairs (1,0),(1,1),(0,1); differences +1,0,−1  |  Retain. |
| R17.2.2 orbital sign  |  matched elliptic division/split classes  |  Character identity multiplies by (−1)^(2−1)=−1; two ramified places multiply to +1  |  Retain. |
| R17.2.3 cyclic matching  |  split degree-two algebra; A=diag(2,3)  |  cyclic product of (A,I) is A; identity extension has A unchanged, not A²  |  Retain. |
| R17.2.4 spectral ledger  |  quadratic exceptional summand; derivative product with two zero traces  |  exceptional coefficient 1/2, not 1; a'·0+0·b'=0 when a=b=0  |  Retain. |
| R17.2.5 strongly cuspidal vanishing  |  one zero local trace among products  |  ordinary product is 0; derivative hitting that factor may leave a'∏b nonzero  |  Retain. |
| R17.2.6 Quaternion proof [sample]  |  two factors satisfying (16.1.7), norm exception  |  all derivative summands have another zero factor; product of two norm-character traces (−1)²=+1  |  Source supports formal cancellation; analytic gap owned by supplier. |
| R17.2.6 atom-free periodization  |  density t^(−1/2) on (0,1); constant map  |  L¹ norm 2, singleton preimages countable and mass 0; constant map pushes total mass 2 to one atom  |  Retain. |
| R17.3.1 global JL  |  ramification {2,∞}, discrete-series components  |  two local signs multiply +1; an irreducible principal-series component at 2 is outside division JL domain  |  Retain. |
| R17.3.2 norm exception  |  global χ∘Nrd  |  local targets St⊗χdet at division places, but global input spans a one-dimensional norm-character spectrum  |  Retain. |
| R17.3.3 split Hecke  |  split local roots 2,3  |  (trace,det)=(5,6) on both identified matrix groups  |  Retain. |
| R17.3.4 local factors  |  St parameter at q=4; unramified pair 2,3  |  factors (1−T/2)⁻¹ and ((1−2T)(1−3T))⁻¹ on matching sides  |  Retain. |
| R17.3.5 quaternionic strong multiplicity  |  two transfers with same (T,S)=(5,6) outside finite set  |  split characteristic polynomial 1−5T+6T² agrees; character/norm sector separately excluded  |  Retain. |
| R17.3.6 multiplicity one  |  nonnorm cuspidal class, scalar rescaling  |  Hom dimension 1; rescalings by 1,2 give same line  |  Retain. |
| R17.3.7 coefficient conjugation  |  χ(a)=i, complex conjugation  |  conjugate i=−i; χ²(a)=−1 fixed on both sides  |  Retain. |
| R17.3.8 rational models  |  two models of a line, bases e and 2e  |  comparison matrix 2; trace of scalar 3 remains 3  |  Retain. |
| R17.3.9 Pan adapter [sample]  |  n=0,1; noncommuting U=[[1,1],[0,1]], V=[[1,0],[1,1]]  |  dimensions 1,2; UV=[[2,1],[1,1]], VU=[[1,1],[1,2]]; inversion reverses order  |  Retain. |
| R17.3.9 inverse Hecke cosets  |  central eigenvalue S=6, T=10  |  inverted T becomes 10/6=5/3, S becomes 1/6; leaving T=10 would fail  |  Retain. |
| R17.3.10 indefinite parity  |  totally real degrees 1,2, split at one real place  |  infinity ramification counts 0,1; even total needs finite counts even,odd respectively  |  Retain. |
| R17.3.11 exchanged invariants  |  two exchanged places  |  parity change 0 mod 2; local invariants 0,1/2 exchange, total unchanged  |  Retain. |
| R17.3.12 supercuspidal globalization  |  local projector trace 1; norm character  |  target trace 1, norm-character trace 0 for supercuspidal projector  |  Retain. |
| R17.4.1 Satake power rule  |  A=diag(2,3), residue degrees 1,2,3  |  traces 5,13,35; determinants 6,36,216  |  Retain. |
| R17.4.2 canonical cyclic adapter  |  degree-one extension  |  WD restriction identity, roots 2,3 unchanged  |  Retain. |
| R17.4.3 all-place cyclic compatibility  |  St under extension with ramification index 2  |  tame-coordinate N becomes 2N≠0 in characteristic zero; rank remains 1  |  Retain. |
| R17.4.4 cyclic descent  |  quadratic character η from extension  |  η restricts to 1 upstairs, so π and π⊗η have same BC  |  Retain. |
| R17.4.5 cuspidality  |  π=AI θ from the chosen quadratic extension  |  π⊗η=π, BC=θ⊞θ^σ has two constituents rather than a cusp  |  Retain. |
| R17.4.6 cuspidal fibres  |  cyclic extension degree 3, characters 1,η,η²  |  all three norm characters restrict to 1; fibre twists have exponent 3  |  Retain. |
| R17.4.7 isobaric fibres  |  two characters μ,ν; twist first by η only  |  upstairs pairs coincide; downstairs μ⊞ν and μη⊞ν need not share one twist  |  Retain. |
| R17.4.8 normal tower  |  successive residue degrees 2 and 3  |  (A²)³=A⁶=diag(64,729), trace 793, det 46656  |  Retain. |
| R17.4.9 tower independence  |  same degrees reversed  |  (A³)²=A⁶, same 64,729  |  Retain. |
| R17.4.10 tower descent  |  successive quadratic twists  |  two binary choices give up to 4 character choices before identifications  |  Retain. |
| R17.4.11 prescribed splitting  |  locally split quadratic extension  |  two components A,A, each trace 5 and det 6, not one A²  |  Retain. |
| R17.4.12 fill-and-twist converse  |  bad local factor killed by sufficiently ramified χ  |  local twisted L and dual L become 1; after untwisting candidate local data remain specified  |  Retain. |
| R17.4.12a outside-S converse  |  S={v}; arbitrary change at v  |  outside-S products identical when P_v changes from 1−5T+6T² to 1−6T+8T²  |  Retain. |
| R17.4.13a adjoint integral input  |  rank-two diagonal roots 2,3  |  Ad roots 2/3,1,3/2; product 1; common scalar twist by 5 leaves ratios unchanged  |  Retain. |
| R17.4.13b Whittaker bridge [sample]  |  q=4, t=1/4, χ=1, s=2  |  roots 1/2,1,2. Full L=4096/3255; generic constituent L=512/465; ratio=8/7≠1  |  Retain. |
| R17.4.13 adjoint lift  |  dihedral Ind θ versus no-self-twist case  |  Ad(Ind θ)=η⊕Ind(θ/θ^σ), dimensions 1+2=3; dihedral output is noncuspidal  |  Retain. |
| R17.4.14 cyclic cubic induction  |  θ=1; inert Frobenius  |  eigenvalues 1,ζ₃,ζ₃², trace 0, det 1; induced trivial character is 1⊞η⊞η²  |  Retain. |
| R17.4.15 rank-three recognition  |  roots 1,ζ₃,ζ₃²  |  polynomial 1−T³; equality of all factors includes determinant 1 and trace 0  |  Retain. |
| R17.4.16 quadratic induction  |  unramified quadratic, θ(Φ²)=a=2  |  Frobenius matrix [[0,2],[1,0]], trace 0, det −2; central sign is η(Φ)=−1  |  Retain. |
| R17.4.17 cubic base change  |  splitting (1,2), A=diag(2,3)  |  outputs diag(2,3),diag(4,9); uniform cubing would give 8,27 at both and is wrong  |  Retain. |
| R17.4.17 cubic monomial [sample]  |  θ=1; S₃ identity, transposition, 3-cycle  |  permutation traces 3,1,0; 1+Std traces 1+(2,0,−1)=3,1,0  |  Algebraic decomposition retained; JPSS locator not certified. |
| R17.4.17 cubic exceptional restriction  |  Std(S₃) restricted to C₂  |  eigenvalues 1,−1, trace 0, determinant −1; equals 1⊕sgn  |  Retain. |
| R17.4.17 all-place comparison [sample]  |  cubic real algebras ℝ³ and ℝ×ℂ  |  λ²=+1 and −1 respectively; induced rank-two epsilon ratio equals that same sign  |  Retain. |
| R17.4.17 norm-phase calculation  |  a,b,c=(0,1,0),(0,0,1),(1,1,1), C=1  |  N=2,4,1; Q=0,0,−3; N(2,1,1)−6=−4=−2−3+1  |  Retain. |
| R17.5.0 global Weil carrier  |  norm character at q=2 and finite quadratic character  |  norm value 1/2 has infinite powers; finite character values ±1 factor through finite Galois quotient  |  Retain. |
| R17.5.1 dihedral Artin  |  Ind of order-3 character of C₃⊂S₃  |  dimension 2; identity trace 2, transposition trace 0, 3-cycle trace −1  |  Retain. |
| R17.5.4 finite projective-lift headline  |  trivial projective map; nontrivial central extension  |  trivial lift ρ=1 has image size 1 and open full kernel; binary dihedral lifts may double the image order  |  Retain. |
| R17.5.5 weak-to-strong matching  |  two distinct local polynomials but same outside-S product  |  (1−2T)(1−3T)≠(1−T)(1−4T), despite identical trace 5; local twisting must separate them  |  Retain. |
| R17.5.6 tetrahedral case  |  A₄⊃V₄  |  quotient order 3; normal Klein group order 4; solvable series lengths finite  |  Retain. |
| R17.5.7 octahedral case  |  S₄⊃A₄⊃V₄  |  indices 2,3; a transposition has sign −1, a 3-cycle +1  |  Retain. |
| R17.5.8 strong Artin  |  S₃ standard representation  |  ranks 2, finite image 6, Frobenius traces 2,0,−1 by cycle type  |  Retain. |
| R17.5.9 odd Artin Lean headline  |  transposition c in S₃ standard rep  |  c eigenvalues 1,−1, trace 0, det −1; identity instead det +1  |  Retain. |
| R17.5.10 totally odd Hilbert case  |  two real places, determinant signs (−1,−1) or (−1,+1)  |  first has two odd restrictions; second fails one required sign  |  Retain. |
| R17.5.11 prime-regular characters  |  p=2, C₃ root ζ₃; involution  |  prime-regular rotation trace ζ₃+ζ₃⁻¹=−1 lifts; involution eigenvalue −1 reduces to 1 and is not 2-regular  |  Retain. |
| R17.5.12 Fong–Swan headline  |  S₃ standard module mod 2; n=0 control  |  dimension 2 remains 2 after integral lift; reflection determinant −1 reduces to 1; zero-dimensional module is not irreducible  |  Retain. |
| R17.5.13 oddness [sample]  |  diag(1,−1), −I, I over ℤ reduced at 3 and 2  |  determinants −1,+1,+1; mod 3 remain distinct; mod 2 all equal 1=−1  |  Retain. |
| R17.5.13 domain negative control  |  R=ℤ×ℤ, A=diag((1,1),(−1,1)); f=first-coordinate mod 3  |  A²=1, det=(-1,1), f(det)=−1, but −1_R=(-1,−1)  |  Domain genuinely needed; no extension to arbitrary rings. |
| R17.5.14 residual modularity  |  same lifted S₃ module at p=3 only when simple hypothesis holds  |  representation rank stays 2; a reducible reduction violates absolute irreducibility rather than becoming an allowed input  |  Retain. |
| R17.5.15 Domain test [sample]  |  x=2,−1,5 in ℚ₂×  |  (−1)^v₂(x)=−1,1,1; restriction to all torsion and integral units is 1  |  Retain. |
| R17.5.15 Order test [sample]  |  C₄ character i^a at a=1,2,3  |  i,−1,−i; fourth power 1, square at 1 is −1  |  Retain. |
| R17.5.16 Construction/local finiteness [sample]  |  L=ℚ(i), P=(1+i), a=1+i  |  a/conjugate(a)=i, phase=e^(iπ/4) of order 8, (a)=P; local a-powers have valuation index 1  |  Retain. |
| R17.5.16 infinity/centre  |  k=2,w=0; positive real t=2  |  ζ(t)=t^(−w)=1; general same-parity k,w gives t^(−w); k=3,w=1 gives 1/2  |  Retain. |
| R17.5.17 mod-three octahedral application  |  GL₂(F₃), PGL₂(F₃)  |  orders (9−1)(9−3)=48 and 24; projective group S₄, hence solvable  |  Retain. |
| R17.6.1 adelic cohomological summand  |  Δ weight 12, p=2  |  raw T₂=−24; unitary T₂=−24/2⁵=−3/4; coefficient degree 10  |  Retain. |
| R17.6.3a generality  |  identity on ℙ², constant ℚℓ sheaf  |  cohomology dimensions 1,1,1 in degrees 0,2,4: trace 3; integrated local term 3  |  R04: source allows this, curve-only target excludes it. |
| R17.6.3b positive-dimensional centre  |  graph of (t,s)↦(t²,s) on ℙ¹×ℙ¹; Z={0}×ℙ¹  |  ideal orders 2 and 1, n=1: 2≥2; local and restricted terms both χ(ℙ¹)=2  |  R04: arbitrary closed Z needed. |
| R17.6.3a proper correspondence trace  |  constant sheaf on ℙ¹, identity; zero correspondence  |  alternating trace 1+1=2; whole-curve local term 2, not point count; zero morphism trace 0  |  Retain. |
| R17.6.3b contraction  |  reordered orders (3,2), n=2; equality (2,2)  |  3·2=2·3=6 gives ideal inclusion; 2n<2(n+1) for every n, so identity fails contraction  |  Retain. |
| R17.6.4 parabolic comparison [sample]  |  Δ weight 12, q=2  |  arithmetic trace −24; unitary Satake sum −24/2^(11/2), so √2 times that sum=−3/4  |  Retain. |
| R17.6.4 conductor inequality  |  primitive level M=15, residual conductor N=5  |  N divides M but M does not divide N; cannot conclude equality. If both divide, valuations agree at each prime  |  Retain. |
| R17.6.4 ramified trace  |  (a,d)=(2,3),(3,2) and constant stalk rank 1  |  fixed length 2 in both; contracting ordinary/dual trace is 1, not 2  |  Retain. |
| R17.6.5 determinant untwist  |  F̄₂ character d, δ²=d  |  det(δ⁻¹r)=δ⁻²d=1; d=1 gives δ=1 uniquely since x²=1 has sole root 1 in char 2  |  Retain. |
| R17.6.6 dihedral headline  |  GL₂(F₂) natural action; reducible C₂ unipotent  |  GL₂(F₂) has order 6=D₃; unipotent C₂ fixes a line and fails irreducibility  |  Retain. |
| R17.6.7 Teichmüller invariants  |  rotation order 3; reflection  |  rotation fixed dims 0/0; identity 2/2; reflection complex eigenvalues ±1, residual nontrivial unipotent, fixed dims 1/1  |  Retain. |
| R17.6.7 four dyadic cases  |  discriminant residues 1,5,4,0 mod 8 with allowed norm conductors  |  ν values 0,2,2,3; −5=3 mod 8 is not a quadratic discriminant residue  |  Retain. |
| R17.6.8 RT technical theorem  |  ν=0,2,3 and odd level N  |  weights 2,2,4; extra Fourier-vanishing hypothesis belongs to ν=2  |  Retain. |
| R17.6.9 real-quadratic trick  |  mixed signature quadratic ξ  |  real determinants switch from (+1,+1) inducing signatures to an odd induced involution of determinant −1; mod 2, ξ=1  |  Retain. |
| R17.6.10 RT exact result  |  D≡5,0,4 mod 8  |  first two meet D odd or 8 divides D; third does not  |  Retain. |
| R17.6.11 odd lifts  |  negative-norm λ in real quadratic K  |  its two real signs multiply −1; associated quadratic twist reduces to 1 mod 2  |  Retain. |
| R17.6.11a Katz descent  |  m=1; weight-two level 11 form mod 5  |  identity pullback for m=1; level-11 form has a₁=1 while target S₂(level 1)=0  |  Retain. |
| R17.6.12 Katz weight one  |  equal unramified characters at 2; real quadratic norm −1 unit  |  repeated local roots give discriminant 0 but are allowed; norm −1 character obstruction concerns characteristic-zero lift, not the Katz conclusion  |  Retain. |
| R17.6.13 residual Lean headline  |  characteristic two S₃ standard module  |  identity trace 0, transposition trace 0, 3-cycle trace 1; determinants all 1  |  Retain. |
| R17.6.14 higher-weight witness  |  p=2, multiply by Hasse invariant  |  weight increases by p−1=1; q-expansion multiplies by 1, so a₁ and all good coefficients unchanged  |  Retain. |
| R17.6.15 disjoint base change  |  finite image field E disjoint from F′; non-disjoint control F′=E  |  disjoint restriction has image size [E:F]; F′=E makes image size 1 and a rank-two representation reducible  |  Retain. |
| R17.6.16 bad-dihedral restriction  |  ρ=Ind_H^Gχ, [G:H]=2  |  restriction χ⊕χ^σ reducible; quadratic twist fixes ρ  |  Retain. |
| R17.6.17 compatible-system base change  |  roots 2,3, residue degree 2  |  polynomial becomes 1−13T+36T² at every coefficient place  |  Retain. |
| R17.6.18 compatible-system descent  |  descent twist χ and its inverse  |  (ρ⊗χ)⊗χ⁻¹=ρ; using χ again gives ρ⊗χ², unequal when χ has order 3  |  Retain. |
| R17.6.19 potential modularity interface  |  identity extension versus nontrivial solvable tower  |  identity has residue degree 1 and unchanged polynomial 1−5T+6T²; tower (2,3) gives 1−793T+46656T²  |  Retain. |

**Pinned objects opened (19 declaration groups).** Paths here are relative to the corresponding pinned library checkout, not to a newer release. Mathlib is `6b7abb3`; Tau Ceti is `a91d3aa`.

| Library declaration / file and line | Contract checked |
|---|---|
| Mathlib `Representation`, `Mathlib/RepresentationTheory/Basic.lean:48` | Algebraic linear action; it supplies neither smoothness nor admissibility automatically. |
| Mathlib `IsNonarchimedeanLocalField`, `Mathlib/NumberTheory/LocalField/Basic.lean:45` | Actual local-field assumptions, unlike a bare complete normed field. |
| Mathlib `MonoidHom.domRestrict_surjective`, `Mathlib/GroupTheory/FiniteAbelian/Duality.lean:107` | Finite abelian group, finite character spaces and enough roots of unity; used only after obtaining a finite quotient. |
| Mathlib `NumberField.Units.mem_torsion`, `Mathlib/NumberTheory/NumberField/Units/Basic.lean:151` | Applies to a global integer unit and all infinite places, not an arbitrary local unit. |
| Tau Ceti `HeckeRing.GL2.Newform`, `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | Newspace, normalization, nebentypus, good-prime eigenform conditions. |
| Tau Ceti `Newform.dirichletLift`, same file `:134` | Extension of the unit character to all residues; vanishes at nonunits. |
| Tau Ceti `Newform.eq_of_forall_notMem_eigenvalue_eq`, `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean:120` | Fixed level, weight and character; not arbitrary-level adelic strong multiplicity one. |
| Tau Ceti `symPowerRep`, `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:59` | Real native symmetric-power representation over a commutative ring. |
| Tau Ceti `simple_indFDRep_ofLinearCharacter_iff`, `TauCeti/RepresentationTheory/Induction/Mackey/LinearCharacter.lean:115` | Finite-group characteristic-zero Mackey criterion; not the characteristic-two generalization. |
| Tau Ceti `IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero`, `TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean:249` | Algebraic lift from vanishing class; no continuity or finite-image guarantee. |
| Tau Ceti `Matrix.GeneralLinearGroup.not_isSolvable_fin_two`, `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Solvable.lean:36` | Needs a nonzero scalar a with a²≠1. F₂ and F₃ do not satisfy that premise. |
| Tau Ceti `QuaternionAlgebra.oneEquivMatrix`, `TauCeti/Algebra/Quaternion/Split.lean:121` | Split quaternion equivalence with unit second parameter and invertible 2; does not realize arbitrary ramification. |
| Tau Ceti arithmetic Frobenius existence, `TauCeti/NumberTheory/NumberField/Frobenius.lean:97` | Unramified primes have arithmetic Frobenius witnesses; the two modularity headlines are not empty universal quantifications. |

Additional pinned declarations opened were `Modulus` and `IsCongrOne` in `TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:96` and `:314` (nonzero ideal, real infinite part, valuation congruence on units); `IdeleClassGroup.ofCompletion` and `ofAdicCompletion` in `Mathlib/NumberTheory/NumberField/AdeleRing.lean:123` and `:128` (full local multiplicative groups); `Representation.invariants` in `Mathlib/RepresentationTheory/Invariants.lean:73`, `IntertwiningMap` in `Mathlib/RepresentationTheory/Intertwining.lean:36`, and `IsIrreducible` in `Mathlib/RepresentationTheory/Irreducible.lean:29` (fixed vectors, equivariant linear maps, nontrivial simple subrepresentation lattice). Also opened `Representation.charTwist` in `TauCeti/RepresentationTheory/CharacterTwist.lean:86` (unit scalar rescaling) and `CuspForm.LSeries_qExpansion_coeff_eq` in `TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean:122` (positive weight and Re(s)>k/2+1, with the cusp-width factor). None is a replacement for a completed headline theorem. The file has no own definitions whose hidden section variables require another check.

**Ownership and supplier resolution.** Searches were by objects (classical correspondence, WD, newvectors, compact coefficients, quaternion transfer, full-local character prescription, projective lifting, Fong–Swan and contracting correspondences), using the roadmap index and pinned source files. The index searches include main and open heads; findings use the actual named supplier files, not search snippets alone. Board packages and the supplied sibling paths were searched for the same ownership terms. No duplicate fully qualified name of a kept Lean theorem was found in the readable sibling files. Existing primitives are already deferred in Scope; R03 identifies the material ownership collision. The inspected EtaleCohomologyFoundations identity-correspondence Gauss–Bonnet target does not supply general correspondence traces. R04 requires the earlier owner to construct the general prerequisite and retain the curve application. The roadmap index also locates broader trace targets in the later EtaleDualityAndPerverseSheaves; that later job is not an admissible supplier here. Ownership against open pull requests without supplied files was not checked beyond index leads.

| Resolved supplier | Actual location and limitation |
|---|---|
| SmoothRepresentationsOfLocalGroups | SR.2.3 Whittaker functionals; SR.3a.1 compact representations at README:2256; SR.3.2 cuspidal splitting at :2661; SR.5.2 classical LLC at :4585. Last item creates R03. |
| PadicLocalLanglandsForGL2Qp | §4.4 at README:1514 supplies the K-type, not its new unicity proof; §6.9 at :2414 supplies general local JL and its D× inverse at m=1 with sign (−1)^(n−m). |
| AutomorphicLFunctionsAndLocalFactors | Representation prerequisites; AL.2 GL₂ newvectors at README:1715; AL.3 full-rank converse at :2417 and AL.4 WD comparison at :2831. Genericity and omitted-place limitations retained. |
| AutomorphicSpectralTheory | §§0.48–0.50, §3.6a strip bounds, Layer 6 trace theory, §§7.0a–7.0c and §7.1 at README:3781. The supplier owns weak cyclic/isobaric output and fibres; the reviewed roadmap adds all-place identification. |
| AutomorphicFormsOnReductiveGroups | §2.6 archimedean unitary classification; §§7.2–7.3 classical/adelic dictionary. The target's explicit full-O(2), coefficient and level comparisons are distinguished from those constructions. |
| ArithmeticLocallySymmetricSpaces | ALS.F.6 automorphic/cuspidal carriers, ALS.F.7 relative cohomology. Resolver's missing `LocallySymmetric.AutomorphicForm` is a planned supplier name, not a pinned-library claim. |
| ArithmeticGaloisRepresentations | §§2.4–2.7 at README:1767 onward; Layer 3 at :2461 onward; §7.6 torsion-character extension/Tate vanishing. The idelic torsion domain does not replace full-local multiplicative-character prescription. |
| AlgebraicModularFormsAndSerreWeights | R15.1–R15.3 and R15.5/5A/6; higher-weight and weight-one attachments, eigenvalue lifting and residual-form carrier. Read as supplied attachments, not an unconstructed Galois map in Suggested.lean. |
| QuaternionicModularForms | README:440 (§1.3), :492 (§2.1), :510 (§2.2), :792 (§3.1). Right coefficient action and opposite Hecke product resolved against the Pan adapter. |
| ClassFieldTheory on main | Layer 9 at README:1505; Layer 10 at :1552, Brauer injectivity at :1606; Layer 11 at :1683. These are already available roadmap contracts on main. |
| GlobalQuadraticForms on main | §4.4 at README:443, sign prescription at :470; Suggested.lean:350 gives the named pair prescription. |
| RepresentationTheory on main | `RepresentationTheory/SemisimpleAlgebras/README.md:292`–`:303`, Layer 6 unique division representative; InductionRestriction and CompactGroups subroadmaps resolve the other citations. |
| HeightsAndUnits | §4.2 at README:419, `Set.unit_fg` at :422; supplies finite-S units, not arbitrary unsupported finite generation. |
| AdelicAlgebraicGroups / ReductiveGroupsPartII | AA.0–AA.3 measure and adelic-level contracts; RG2.0/RG2.4 local topology and Iwasawa/Cartan/modulus contracts. |
| EtaleCohomologyFoundations | §§0.6,0.8,0.11 and F.0–F.6; finite trace at README:582 and identity-correspondence Gauss–Bonnet at :1220. Those do not themselves state the arbitrary contracting-correspondence theorem. |
| ClassicalAdicEtaleCohomology / ComplexComparisonPartII | Layers 8–9 adic operations; C6.3 at README:4166, C6.4 at :4225, C6.5 at :4266 and C6.6 at :4332. Coefficient realization is an explicit dependency. |
| LefschetzPencilsAndVanishingCycles | LPV.0 at README:317, LPV.2 ordinary quadratic singularities/Picard–Lefschetz; N is retained. |
| ModularCurves / SchemeAndStackFoundations | ModularCurves §0E at README:386, 5B and 9A; scheme fpqc descent supplies the Katz level-independent descent route, not character descent alone. |
| Completed Chebotarev / NumberFieldArithmetic | `Completed/Chebotarev/README.md:410`, Layer 10 density; `Completed/NumberFieldArithmetic/README.md:1290`, Layer 5 finite-place completions and valuations. These are completed main-owned suppliers. |
| GlobalNumberFields / ProfiniteCohomology | Moduli, finite ray quotients, characters; continuous cochains and extension classes. The construction of the global Weil carrier is separately assigned here. |

The worker's five unresolved-name leads are not five missing mathematical inputs: two are planned JL names resolved in PadicLocalLanglandsForGL2Qp §6.9, one is the ALS carrier just resolved, and two are this file's own namespaces (R06 addresses their form).

**External supplier-order check.** The exact dependency-check output was:

```text
not movable: GL2AutomorphicRepresentationsAndTransfer consumes GlobalQuadraticForms (#353) and is consumed by EllipticCurveModularityWild3Adic (#286), which comes first: moving GL2AutomorphicRepresentationsAndTransfer after GlobalQuadraticForms would put a supplier after a consumer, a cycle through GL2AutomorphicRepresentationsAndTransfer
UPWARD: GL2AutomorphicRepresentationsAndTransfer (#88) -> ClassFieldTheory (#258) at README lines [305, 417, 442, 836, 982, 993]
UPWARD: GL2AutomorphicRepresentationsAndTransfer (#88) -> GlobalQuadraticForms (#353) at README lines [307, 1462, 1473, 1752, 1764]
UPWARD: GL2AutomorphicRepresentationsAndTransfer (#88) -> RepresentationTheory (#185) at README lines [154, 156, 309, 813, 1462, 1473]
depcheck: 164 roadmaps, 1185 edges, 3 problem(s)
```

All three named suppliers are present on content main `3ec8d5f`, and the cited contracts above exist there. The brief expressly permits consumption of main roadmaps and forbids using revisions of existing roadmaps as dependencies. I therefore regard these three UPWARD lines as false positives for the inspected main-owned contracts, not evidence that this roadmap needs the later revision heads. The “not movable” conclusion is about that same coarse graph; moving this roadmap after revision jobs is not the repair. The worker must reconcile those main-owned edges before recording a passing gate. This review neither edits the order nor treats the failing gate as passing. R01 is a separate, real internal cycle visible without those external edges. There are no declared supplier gaps to excuse an unowned input.

## Not verifiable

- **prr23**, Theorem 1.33, pp.42–43: the sources service found the Cambridge book/DOI landing page; searches did not yield a readable legal full text. Ramification realization was tested and its main-owned mathematical inputs resolved, but this exact book locator is not certified.
- **jpss79**, Theorem 14.2, pp.253–254 and the monomial classification on p.255: the legal author-hosted Columbia PDF was fetched. Its body is image-only in this environment. A browser rendering attempt returned no readable page image. The cubic monomial source claim remains unverified, although its finite S₃ calculations were checked. See the [author-hosted source](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf).
- **tunnell78**, Theorem 1.3, pp.182–183: legal GDZ scan fetched, body not text-readable. The Domain and Order tests were calculated directly; they do not certify the full globalization theorem.
- **casselman73** and **rt83**: legal author-hosted/GDZ scans fetched, bodies not text-readable. Their quoted newform/local-factor and low-dimensional Artin locators are not certified from the scans.
- **bh06**: the sources service marked the book uncertified/paywalled. Its cited local type and primitive dyadic existence proofs were not read. It is not re-requested as a missing reference.
- **bz76**: the cited Bernstein author server closed the connection on two attempts. In particular Theorems 2.44, 3.21 and Proposition 3.28 remain unverified; the SR supplier contract was separately inspected.
- **artin-tate**, Chapter XV; **tate-global**, §11.6 pp.200–201; **clozel90**, Theorem 3.13: citation resolution and legal-source searches did not produce readable full texts. The precise global Weil and rationality locators remain unverified.
- **jl70 version:** the fetched IAS text places Theorem 16.1 at printed p.261, agreeing with the README’s jl70-global alias. Its formal cancellation was read. I did not identify the separately labelled “IAS retypeset (2026)” version needed to certify the pp.269–270 locator; the source ledger must distinguish these paginations.
- **deligne73**: prose at the induction and WD-factor locators is readable, but some extracted displayed equations lose symbols. The numerical induction/sign/conductor tests are recorded above; a symbol-perfect transcription of every displayed formula was not possible.
- Remaining non-sampled source locators were inventoried and fetched, but this is not a certification of every page in those works. The checks above are finite-instance checks and a seeded locator audit, not proofs of the roadmap's universal existence theorems.

The consolidated missing-reference request preserves unresolved works and removes failed first attempts that later succeeded. No source text or PDF was placed in the worktree or report. No unavailable source is counted as a mathematical counterexample. No approval or merge is issued.

## Source issues

- **Error** in cg20 at §1.3, pp.805–806: the source says a nontrivial unramified GL₂ representation has two Iwahori invariants; it should require an infinite-dimensional representation, excluding nontrivial unramified determinant characters; affects a stated result.
- **Misprint** in rt97 at §2, case (ii), p.306: the source says the discriminant is congruent to either sign of five modulo eight; it should say five modulo eight, since three is not a quadratic discriminant residue; affects nothing.
- **Misprint** in rt97 at §2, sentence after cases (i)–(iv), p.307: the source says the dyadic conductor exponent is three in case (iii); it should assign that exponent to case (iv); affects nothing.
- **Gap** in jl70 at Theorem 16.1 and its proof introduction, printed p.261 in the fetched IAS scan: the source presents a formal trace comparison while explicitly leaving analytic justification unfinished; it should supply convergence and the analytic trace identities before concluding the theorem; affects the proof.
