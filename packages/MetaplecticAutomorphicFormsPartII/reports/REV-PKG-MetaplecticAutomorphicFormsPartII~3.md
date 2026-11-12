<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13037#issuecomment-6782754773 -->
Review (codex) of 9a3e2b3

Verdict: accepted

No findings. Both previous findings are repaired. The eight headline statements elaborate, all eight fail the one-tactic padding probe, and all fourteen freshly elaborated signatures agree with the supplied signatures. The acceptance has no declared supplier gaps. Source-access limitations are recorded below; the settled uncertified source was not requested again.

## Previous findings and repair verification

**R01 — repaired.** `packages/MetaplecticAutomorphicFormsPartII/Suggested.lean:287` now declares `isNormalizedWeil_pi_tensor`. Its conclusion is “`W g (fun x => ∏ i, f i (x i)) = fun x => ∏ i, Wᵢ i (gᵢ i) (f i) (x i)`”. The explicit block equation at lines 299–301 identifies the action through `LinearMap.single`; finite field, odd characteristic, nontrivial character, finite index family, finite-dimensional factors and normalization of every action are retained. `README.md:480` states the same result. The module docstring now includes tensor compatibility among the stated headlines. This is a general finite-family statement on the actual polarized spaces, including the empty family, rather than a two-factor example.

I checked that the block hypothesis is satisfiable: for block inputs `(xᵢ,yᵢ)`, assemble the output dual by `z ↦ Σᵢ yᵢ′(zᵢ)`. Evaluation of a functional on a finite product is the sum of its coordinate evaluations, so the displayed block condition preserves the summed alternating form. Product delta functions span the function model. On two 𝔽₃ planes both normalized actions send the delta function at zero to the constant −1/3; the unnormalized sum would give +1/3. The determinant calculation and additional instances are in the table below.

**R02 — repaired.** `packages/MetaplecticAutomorphicFormsPartII/README.md:438` now says “The representation `η_U` of `Q` is the inflation of `S_{ψ,V̄}`” and separately identifies `θ_U(t,i)=ψ(t)` as a character of `HU`. For a line in 𝔽₃⁴ the domains have orders 81 and 9, the dimensions are 3 and 1, and the equation is `3²·9=81`. The restriction of the representation to `HU` is three copies of the character. All other occurrences of `θ_U`, including the Lean theorem's docstring, were checked: none identifies the character with the higher-dimensional representation.

The additional changes were reviewed too: replacing field enumeration by `[Finite k]` in three theorems; the square/nonsquare conclusion and new 𝔽₉ Check in §4.1; `LinearMap.single` and the two quadratic-character supplier declarations; the tensor paragraph, API, Check and docstring; and the revised explanation of the missing Gérardin comparison. No previous finding was marked not actionable. The older determinant/induction-notation repair remains intact: parity means `R`, not `W(−1)`, and the induction twist is on the inducing representation.

## Verified sound

### Coverage, principles and shape

Read the four package files, the previous review and repair, all 18 target sections with their APIs and Checks, all 18 Needs lines, the board-package index, overlap leads, near-match results and supplied signatures. Reopened all 15 seeded source targets and checked the additional tensor headline. For unchanged mathematics I used the previous review's explicit computed rows as permitted, checked their algebra, and carried representative values into this report. Its prose-only statements about sources, ownership, declarations and signatures were checked afresh. Newly changed mathematics was recomputed independently.

The scope is the general finite odd-characteristic theory, including extension fields, noninjective nontrivial additive characters, rank zero, the exceptional Sp₂(𝔽₃) normalization, and fully ramified representations of arbitrary finite groups with cyclic central image of arbitrary order. Odd characteristic is a hypothesis of the half-form theory, not a good-prime shortcut within a larger promised theorem. The characteristic-two negative control explicitly exposes division by zero; the general fully ramified theorem still covers Q₈. The existing local/adelic roadmap and its discriminant-module Mp₂(ℤ) representation are not replanned.

No computational algorithm, copied source passage, sorry'd data, free condition replacing unexpressible mathematics, conclusion-as-hypothesis, `set_option`, admitted example or Lean `lemma` declaration was found. No process narrative, job identifier, pull-request number, machine path or LaTeX delimiter appears in the README or Lean file. `metadata.toml` has topic `math.RT`. All five references have distinct existing manifest keys and recorded legal provenance/status. The manifest was not changed.

The required Summary, ownership, conventions, supplier contracts, reading guide, mathematical layers, Examples, Dependencies, consumers and references are present. The order is forced by coordinates → Heisenberg models/uniqueness → normalized operators → parabolic restriction/induction → fixed lines/tensors. No layer is named after a source chapter, and the README does not claim to follow a source's arrangement. The mathematical and source arrangements coincide only where these dependencies require it.

Checks per target: 0.1:4; 0.2:3; 1.1:4; 1.2:4; 1.3:4; 1.4:5; 1.5:3; 2.1:3; 2.2:4; 2.3:3; 2.4:3; 2.5:3; 3.1:3; 3.2:3; 3.3:3; 3.4:5; 4.1:5; 4.2:5. These total 67 Checks. Every retained definition has an API and at least three Checks in its section. Every target has a source or exact native supplier locator. The six real-bodied definitions are precisely those used by the headline signatures. All fourteen names attributed to this roadmap resolve to its declarations, and every declaration is named in the README; notation such as Ω and S_ψ is mathematical notation, not a claimed extra Lean declaration.

### Lean elaboration, signatures, headlines and padding

Ran the prescribed `lake env lean` invocation on the package's absolute Suggested.lean path from the pinned content checkout. Exit status 0; exactly eight warnings, all `declaration uses 'sorry'`, at lines 78, 90, 115, 129, 200, 222, 257 and 287. No missing Tau Ceti object file required a build. No Lean process was left running. The module header contains the single Mathlib umbrella import and the three used individual Tau Ceti imports, in the pinned module system's `public import` spelling; no Mathlib submodule or roadmap module is imported.

On a scratch copy, replaced every theorem's `sorry` by alternatives requiring complete closure with `simp`, `rfl`, `infer_instance` or `exact?`, followed by `sorry` only if they failed. All eight declarations still produced a sorry warning; no single-lemma suggestion closed a target. The only additional warnings were probe-local unused-tactic lint messages. The copy also appended `#check @name` for all fourteen declarations. All fourteen output types equal the worker's recorded types after whitespace normalization. Their explicit binders agree with the README; no finite-dimensionality, normality, nontrivial-character, invariance or block-action hypothesis disappeared.

The broader domains of the six real-bodied definitions do not claim the deep results there. For example, the half-form factor set still exists at characteristic two, but its commutator then vanishes; every finite Stone–von Neumann/Weil theorem carries `ringChar k ≠ 2`. `IsNormalizedWeil` is a concrete conjunction of covariance and determinants, with no opaque conditions. The fixed-line determinant cannot be zero because the restriction of an isometry to a stable finite-dimensional subspace is injective, hence invertible. Thus the square/nonsquare split has exactly the intended quadratic-character meaning.

| Headline from the README summary | Acceptance-test coverage and probe |
|---|---|
| §1.3 finite Stone–von Neumann existence | `finite_stoneVonNeumann_exists`; no one-tactic closure |
| §1.3 dimension, character support and uniqueness | `finite_stoneVonNeumann`; no one-tactic closure |
| §1.4 fully ramified existence | `fullyRamified_exists`; no one-tactic closure |
| §1.4 fully ramified dimension, support and uniqueness | `fullyRamified_unique`; no one-tactic closure |
| §2.2 normalized Weil existence and uniqueness, including Sp₂(𝔽₃) | `existsUnique_isNormalizedWeil`; no one-tactic closure |
| §3.3 corrected Gérardin parabolic induction | Specifically named in the module docstring at lines 35–40. The supplied native factor-set extension has no constructed isometry action or associated quotient-parabolic Weil–Heisenberg induction comparison. Those constructions are named targets of the base roadmap and this README. No surrogate theorem is stated. |
| §3.4 isotropic invariants | `fullyRamified_isotropicInvariants`; Q-stability, irreducibility and the cardinality equation; no one-tactic closure |
| §4.1 quadratic determinant on the fixed line | `isNormalizedWeil_lagrangian_fixed`, in the equivalent square/nonsquare form; no one-tactic closure |
| §4.2 finite orthogonal tensor compatibility | `isNormalizedWeil_pi_tensor`; finite-family block action on pure products, which span; no one-tactic closure |

`TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean:508` only identifies the extension of the *trivial factor set* with a semidirect product. It does not supply the action of symplectic isometries on the nontrivial half-form extension needed by §3.3. The repaired reason no longer confuses an unchosen representation with an unavailable construction. In contrast, the tensor theorem now uses precisely the already expressible covariance and normalization predicates. No statable headline was found omitted, and none of the eight theorems is an API restatement or a README boundary Check.

### Computed adversarial table

All equalities below give the values on both sides. The previous round's exhaustive SL₂(𝔽₃), SL₂(𝔽₅) and higher-rank stabilizer tests were evidence only for unchanged formulas; I did not represent them as new runs. The new numerical computation used direct complex matrices and elimination for determinants, with no added dependency. It checked eight two-factor cases over 𝔽₃ and 𝔽₅, and every nonzero scalar in 𝔽₃, 𝔽₅ and 𝔽₉. Maximum new tensor matrix discrepancy was 8.1·10⁻¹⁶. These finite computations check conventions and repairs; the proof routes, not numerical tolerance, justify the general assertions.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| §0.1 adapted coordinates and quotient | I=0; a plane; a line in two planes | Dimension equations: dim V=0+dim V; 2=2·1+0; 4=2·1+2. Last case: dim I^⊥=3, quotient dimension=2; subtracting only dim I would give 3. | Sound; no change. |
| §0.2 `polarizationForm` and J convention | e=(1,0), f=(0,1); zero space; zero form on a plane | ω(e,f)=1, ω(f,e)=−1; ω(Je,Jf)=ω(−f,e)=1. Zero-space radical has dimension0; zero-form plane radical has dimension2, so fails nondegeneracy. | Sound; J uses the stated coordinate identification, and is −Matrix.J. |
| §1.1 `heisenbergFactorSet` and `Heisenberg` | 𝔽₃ plane; V=0; characteristic2 | Forward/reverse central coordinates 2 and1; commutator 2−1=1=ω(e,f). Corrected polarized coordinate is 2+1/2=1. V=0 gives order q; characteristic2 gives commutator0 versus desired1. | Sound with explicit odd-characteristic guard. |
| §1.2 `schrodingerOp`, product and induction convention | 𝔽₃, T and M on δ₁; arbitrary pair of coordinates; X=0 | TMδ₁=ζδ₀ and MTδ₁=δ₀. Both composite exponents equal t+s+y(z)+y′(z)+y′(x)+y(x)/2+y′(x′)/2. At X=0 dimension1 and central scalarψ(t). | Sound. Positive subgroup action in right translation gives this sign. |
| §1.3 `finite_stoneVonNeumann_exists` | q=3,n=1; n=0 | Schrödinger dimension3 and character norm (3·9)/27=1; zero-rank model dimension1, character norm q/q=1. | Nonzero irreducible model exists; no change. |
| §1.3 `finite_stoneVonNeumann` and character formula | q=3,5; 𝔽₉ trace character; ψ=1 negative control | d²=q²=card V; central trace qψ(t), other traces0; normalized norm q·q²/q³=1. In 𝔽₉ the trace fibers each have size3: sum=3(1+ζ+ζ²)=0 although kerψ has size3. For ψ=1 on the 𝔽₃ plane there are9 inequivalent quotient characters. | Nontriviality, not injectivity, is necessary; sound. |
| §1.4 `fullyRamified_exists` | Q₈,H={±1},θ(−1)=−1; J=H; S₃,H=A₃ | Q₈ representation has trace2 at1, −2 at−1, and0 elsewhere; norm(4+4)/8=1. J=H has η=θ, dimension1. In S₃ conjugation sends θ((123))=ζ to ζ⁻¹, so the nontrivial θ fails invariance. | Hypotheses select the correct nonabelian models. |
| §1.4 `fullyRamified_unique` and perfect pairing | Q₈; central product H(𝔽₃²) with C₉; abelian proper quotient | Q₈: θ([i,j])=−1, d²=4=8/2. Central product: order81, centre9, d=3, d²=9=81/9. Abelian proper quotient: pairing identically1, and [J:H] distinct extensions. | Sound for arbitrary cyclic central order. |
| §1.5 polarized intertwiners | Same/distinct lines in 𝔽₃²; V=0 | Same line T=3id, composite9id=3·3id. Distinct lines: composite3id=3·1id; off-intersection sum1+ζ+ζ²=0. At V=0 composite1=1·1. | Both normalization and inverse direction checked; no change. |
| §2.1 projective action, multiplier and parity | Rescale μ(u(1)) byζ; parity conjugation | c(g,g) acquiresζ²; covariance is unchanged. Rπ(t,v)R⁻¹=π(t,−v); trace R=1, so a conjugated scalar aR has trace a=1. | Correct multiplier direction and parity preservation. |
| §2.2 `evenPart` | δ₀ and δ₁−δ₋₁; q=3,5; X=0 | eδ₀=δ₀, e(δ₁−δ₋₁)=0, e²=e. Even/odd dimensions (2,1),(3,2),(1,0); N−2N⁺=−1 in each case. | Identity projector and W(−1)-eigenspace are excluded. |
| §2.2 `IsNormalizedWeil` and `existsUnique_isNormalizedWeil` | Scalar rescaling a; q=3 J; rank0; order3 twist | κ(aμ)=a⁻¹κ(μ), so κ(aμ)aμ=κ(μ)μ. q=3: detF=−i, detF⁺=−1, detW(J)=1=(detW(J)⁺)². Rank0 gives (a/a²)a=1. Twistλ: determinant factorsλ³=1 versusλ⁴=λ. | Existence/uniqueness route survives the exceptional group. |
| §2.3 generators | q=3 and5; m(2); J | q=3 u(1)=diag(1,ζ,ζ), W(−1)=−R; κ_J=−i. q=5 κ_J=−1 and W(m(2))δ₀=−δ₀, χ₅(2)=χ₅(3)=−1. F²=R; Je=−f gives T↦M⁻¹. | Sound; wrong Fourier sign reverses the covariance. |
| §2.4 Weil–Heisenberg product | (h,1)(1,J), h=(0,e); V=0 | Correct productπ(h)W(J); reversed recipeW(J)π(h). Their rewritten arguments differ: J⁻¹e=f≠e. General product gives π(h(g·h′))W(gg′) on both sides. Rank0 scalarψ(t). | Sound normal-first convention. |
| §2.5 equivariant special-isomorphism transport | Identity data; inner action w=e on v=f; exponent9 example | Identity pulls backΩ. Inner action sends (0,f) to(1,f), while s=1 sends it to(0,f): required equivariance fails. Orders of elements reach9 in the negative example versus exponent3 in H(𝔽₃²). | The marked equivariance law excludes the wrong lift. |
| §3.1 mixed model | I=0; I Lagrangian; line in 𝔽₃⁴ | Fixed dimensions qⁿ,1,3. Last case induction dimension3·3=9. For i=e,j=f, phaseψ(ω(j,i))=ζ⁻¹; averaging over i gives1+ζ+ζ²=0 at j≠0. | Correct phase, quotient kernel and support-at-zero assertion. |
| §3.2 parabolic fixed space | q=5, I=y-axis or x-axis, m(2); I=0 | On y-axis det3 and δ₀ scalar−1; on x-axis det2 and constant scalar−1. Untwisted value+1 is wrong. I=0 has det1 and twist1. | Sound; previous higher-rank computed row also covers the line stabilizer in 𝔽₃⁴. |
| §3.3 corrected Gérardin induction | q=3,n=2,dim I=1; I=0; q=5 Lagrangian | Index3, inducing dimension3, total9. I=0: index1, quotientV, twist1. q=5 fixed-line scalar−1, not the untwisted+1. | Sound; twist belongs before induction. |
| §3.4 `fullyRamified_isotropicInvariants` | A=J/H with perfect pairing; U=1; U≤H in kerθ; bad U=H | If b=card Ū, then dim E^U=d/b, cardQ=cardH·cardA/b, cardHU=cardH·b; (d/b)²cardHU=cardH·cardA/b. U=1 or U≤kerθ gives d²cardH=cardJ. Bad U=H gives0·cardH≠cardJ. | Stability uses θ([q,u])=1, and radical of Ū^⊥ is Ū; sound. |
| §3.4 repaired character/representation Check | Line I in 𝔽₃⁴; Lagrangian in a plane | θ_U dimension1, domain order9; η_U dimension3, domain order81. Correct equation3²·9=81 versus incorrect1²·9=9. Lagrangian case1²·p²=p². | Repair verified. |
| §4.1 square/nonsquare fixed-line theorem | Every a≠0 in 𝔽₃ and𝔽₅, L=y-axis | For a=(1,2) over𝔽₃, detL=(1,2), actual and predicted scalars=(1,−1). For a=(1,2,3,4) over𝔽₅, detL=(1,3,2,4), both scalar lists=(1,−1,−1,1). | New formulation verified, including both implications. |
| §4.1 new extension-field Check and flags | 𝔽₉=𝔽₃(i), i²=−1; g=−1; zero space; I⊂L | Nonzero squares={1,−1,i,−i}; scalar at−1 is+1, so W(−1)δ₀=δ₀. Prime-field sign would give−δ₀. Rank0 det1, scalar1. Flag det is ab; χ(ab)=χ(a)χ(b). | Sound; actual field's square predicate is essential. |
| §4.2 `isNormalizedWeil_pi_tensor`, normalization | Two factors, dimensions n₁,n₂, detWᵢ⁺=αᵢ | Both full determinants are α₁^(2n₂)α₂^(2n₁); square of even determinant is (α₁^n₂α₂^n₁)². Since N−2N⁺=−1, a competing scalar satisfies a⁻¹=1. | General normalized tensor argument checked independently. |
| §4.2 new concrete tensor Check | Two 𝔽₃ planes, J⊕J on δ₀₀; also two𝔽₅ planes | 𝔽₃ left: det(F⊗F)=(−i)⁶=−1, value−1/3. Right:(−i/√3)²=−1/3. Wrongκ=1 gives+1/3. 𝔽₅ both values+1/5. | Full matrix errors3.4·10⁻¹⁶ and1.4·10⁻¹⁶ respectively. |
| §4.2 other new tensor instances | J⊕u(1), m(2)⊕J, u(1)⊕m(2), q=3,5 | At δ₀₀, both sides give (−i/√3,+i/√3,−1) forq=3 and (−1/√5,+1/√5,−1) forq=5. Every full determinant and squared even determinant is1 within3.6·10⁻¹⁴. | All six full matrix comparisons agree within8.1·10⁻¹⁶. |
| §4.2 finite-family and central-character controls | Empty family; a zero factor; distinct characters | Empty product function1 and W(1)1=1, dimensionq⁰=1. A zero factor contributes scalar fᵢ(0) on both sides. If ψ₁(1)=ζ,ψ₂(1)=ζ², central(1,−1) acts byζ²≠1. | Empty/zero cases sound; common character is necessary for descent. |

The finite-group proofs also rule out vacuity: every nondegenerate alternating finite space has the exhibited Schrödinger model; the normalized actions are constructed from intertwiners, not assumed without existence; the fully ramified case has an induced nonzero constituent. All denominators are nonzero under the stated hypotheses: 2 in k, positive q and subgroup indices, and determinants of invertible intertwiners and their parity restrictions. The natural-cardinality and index defaults are never used on infinite groups in a theorem. The flags, inverses, isometries and subgroup inclusions were checked in both directions where an equivalence or equality is asserted.

### Source sample and locators

The four readable texts were reopened directly in the supplied legal cache. F21 and S08 use the declared arXiv-version pagination, FS25 the author manuscript, N02 journal pagination (PDF page+14). No additional source was fetched. No author-flagged readable citation remained unchecked; Gerardin77 is the settled uncertified exception.

| Seeded target | Source text read, hypotheses and support |
|---|---|
| 1.1 | FS25 line391–395, Example3.1.6, p.11, supplies the odd-prime half-form group; F21 line1320, p.33, uses the same law with factors reversed. N02 line64–75, §2, p.16, supplies the general finite-field version. |
| 1.2 | N02 line71–75, §2, p.16, gives exactly the plus-translation and half-phase operator. FS25 line540–559, Lemma3.3.4, p.15, gives the induced function model. The native induction formula was separately checked for the right-translation convention. |
| 1.3 | N02 line81, Lemma2.1, starts on p.16; its character computation and uniqueness discussion are at lines85–104 on p.17. FS25 line509–514, Lemma3.3.1, p.14, gives uniqueness and square-root dimension for Heisenberg F_p-groups. Nontrivial ψ is retained. |
| 1.4 | S08 line570–578, Proposition3.5, p.14, concerns semisimple-character groups; F21 line1197–1250, Lemmas7.7–7.8, pp.30–31, uses constructed Heisenberg groups. Neither is silently treated as a theorem for arbitrary J. The README explicitly derives the broader finite-group assertion by induction, trace conjugacy and character orthogonality; that derivation works with precisely its stated invariance/nondegeneracy assumptions. |
| 1.5 | FS25 line540–559, Lemma3.3.4, pp.15–16 locator, and N02 line185–225, Theorem4.1, pp.19–20, support the induced/Fourier models. The README explicitly chooses its own unnormalized left average; its factor cardA·card(A∩B) was derived from the displayed commutation and character sum, not attributed verbatim to either source. |
| 2.1 | N02 line168–184, §4,p.19, and FS25 line626–632, Construction3.4.2,p.17. The source multiplier in N02 line178 is reciprocal to the roadmap's multiplier; the roadmap's equation matches the pinned `IsProjectiveRep`. |
| 2.2 | N02 line230–245, Theorem4.2, pp.20–21; line298–316, Theorem4.3,p.22, especially the legible ratio at311. FS25 line630 explicitly retains the three linearizations at Sp₂(𝔽₃). The scalar-rescaling argument fixes a unique parity normalization. OCR limits are below. |
| 2.3 | N02 line131–132, Theorem3.3,p.18; line185–225, Theorem4.1,pp.19–20; line322–349, determinant computations,p.23; line351–372, Example4.4,pp.23–24. Lower shear, A⁻¹ pullback, positive Fourier sign and determinant factor agree. |
| 2.4 | FS25 line626–632, Construction3.4.2,p.17; F21 line1286–1293,p.32. The passage assembles/uses the Weil–Heisenberg representation. The normal-first product is verified algebraically in the README's convention. |
| 2.5 | FS25 line633–640, Remark3.4.3,p.17; line649–662, Definitions3.4.4–3.4.5,pp.17–18. Both the special isomorphism and extension/equivariance requirement are present; the pullback result for an arbitrary K follows from its explicitly imposed equivariance. |
| 3.1 | FS25 line540–559, Lemma3.3.4(a),(b),p.15; F21 line1298–1326,pp.32–33. The partial polarization, induction, support at zero and evaluation are supported. The sign was derived anew in half-form/right-translation coordinates. |
| 3.2 | F21 line1322–1337, proof of Lemma7.10,p.33, and line1346–1349,footnote3. These give the quadratic determinant twist and quotient Weil factor. The README's direct generator route supplies complement independence and arbitrary stabilizing subgroups. |
| 3.3 | F21 line1346–1349,footnote3,p.33, explicitly inserts the twist before induction in Gerardin77 Theorem2.4(b). The README dimension/Frobenius route reproduces the corrected formula. Direct access to Gerardin77 remains uncertified. |
| 3.4 | S08 line1241–1274, Lemma5.6 and Corollary5.7,pp.29–30; line1382–1406, Lemma5.12 and following explanation,p.33; FS25 line544–559,p.15. These are classical-group and Heisenberg instances. The general fully ramified statement is the explicit pairing/induction argument of the README; the repaired θ_U/η_U distinction matches the sources. |
| 4.1 | F21 line1327–1337, proof of Lemma7.10,p.33, and N02 line328–349,p.23. The roadmap uses the determinant-one property of unipotent actions, and its own generator proof, rather than a blanket assertion about small general-linear commutator subgroups. The new IsSquare form follows from the pinned quadratic-character equivalences at nonzero determinants. |

Also checked §0.1 against FS25 line540–559 and the prescribed-basis suppliers, §0.2 against the native symplectic-basis theorem, and §4.2 against F21 line1178–1186 (p.30), line1286–1293 and line1338–1345 (pp.32–33), and S08 line1272–1274 and line1401–1406. These last sources provide tensor applications; the general normalized compatibility is justified by the independently checked parity-determinant argument. No conclusion was imported from a source proof at a wider generality than that proof supports.

### Pinned declarations and duplication audit

Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Reopened the following declarations and surrounding hypotheses at those pins. These are library-relative paths.

| File at pin | Declarations / content verified |
|---|---|
| `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean:96` | `TauCeti.FactorSet`; `Extension` at180 has coefficient `left` and quotient `right`; `inl` at296 sends a to (a,1). |
| `TauCeti/Algebra/GroupAction/Trivial.lean:51` | `trivialMulDistribMulAction`, the action used by the factor-set body. |
| `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean:183` | `isometryGroup`; membership theorem at196 is preservation of B on every pair. |
| `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:357` | `IsAlt.exists_basis_toMatrix_eq_J`; `IsAlt.even_finrank` at365, with finite-dimensionality, alternation and nondegeneracy. |
| `TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean:58` | `HeisenbergGroup`, `card_eq` at89, multiplication at95 and `commutatorElement_eq` at116: central coordinate z+z′+xy′ and commutator xy′−x′y. |
| `TauCeti/RepresentationTheory/LinearCharacter/Basic.lean:162` | `FDRep.ofLinearCharacter`, one-dimensional module with scalar action (unbundled definition at81). |
| `TauCeti/RepresentationTheory/Induction/FiniteDimensional/Basic.lean:259` | `Rep.indSubtypeEquivPi_ρ_apply`: right-coset representative q.out*g, with the positive subgroup action; `indFDRep` at375, `indFDRepForgetEquiv` at381, `finrank_indFDRep` at640. |
| `TauCeti/RepresentationTheory/ProjectiveRepresentation/Basic.lean:97` | `IsProjectiveRep`: ρ(g)ρ(h)=α(g,h)ρ(gh), identity normalization; `rescale` at133 gives c(g)c(h)c(gh)⁻¹α(g,h). |
| `Mathlib/LinearAlgebra/BilinearForm/Properties.lean:236` | `IsAlt`; `Nondegenerate` at291 delegates to two-sided separation, defined in `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:547`. |
| `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean:102` | `orthogonal`; `finrank_orthogonal` at240. Underlying carrier in `Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean:48` is all y with B(x,y)=0 for x in the subspace; alternation makes the orientation harmless here. |
| `Mathlib/LinearAlgebra/BilinearMap.lean:317` | `LinearMap.mk₂`; `Module.Dual` in `Mathlib/LinearAlgebra/Dual/Defs.lean:61` is the native linear-map dual. |
| `Mathlib/LinearAlgebra/SymplecticGroup.lean:58` | `Matrix.J = fromBlocks 0 (-1) 1 0`, the negative of the README matrix. |
| `Mathlib/Algebra/Group/AddChar.lean:72` | `AddChar` supplies zero/add laws, not injectivity or nontriviality. |
| `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:83` | `AddChar.IsPrimitive.of_ne_one`; `sum_mulShift` at257, with finite ring and domain coefficients. |
| `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:120` | `quadraticChar`; `quadraticChar_neg_one` at267. `quadraticChar_two` is in `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/GaussSum.lean:37`. |
| `Mathlib/RepresentationTheory/Basic.lean:48` | `Representation` is G→*End(V); no irreducibility is built into the carrier. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29` | `Representation.IsIrreducible` uses a simple order of subrepresentations, including nontriviality. |
| `Mathlib/RepresentationTheory/Intertwining.lean:320` | `Representation.Equiv`; near-match `Equiv.dualTensorHom` at857 is the dual-tensor/Hom equivalence, not a Stone–von Neumann or Weil theorem. |
| `Mathlib/RepresentationTheory/Character.lean:56` | `Representation.character`; `Representation.char_orthonormal` at144 and `FDRep.char_orthonormal` at248, with invertible group order and algebraic closure. |
| `Mathlib/RepresentationTheory/FinGroupCharZero.lean:90` | `simple_iff_end_is_rank_one`; `simple_iff_char_is_norm_one` at121 has characteristic-zero hypothesis, satisfied by ℂ. |
| `Mathlib/RepresentationTheory/Maschke.lean:159` | `MonoidAlgebra.Submodule.exists_isCompl`. |
| `Mathlib/RepresentationTheory/Invariants.lean:73` | `Representation.invariants` is the subspace of v with ρ(g)v=v for every g; it does not assert nonzero dimension. |
| `Mathlib/RepresentationTheory/Induced.lean:132` | `Rep.indResHomEquiv`, induction/restriction Frobenius reciprocity, with universe-maximized carriers. |
| `Mathlib/LinearAlgebra/Determinant.lean:164` | `LinearMap.det`, default1 if no finite basis; `LinearEquiv.det` at416; finite-dimensionality prevents misuse of the default here. `LinearMap.trace` is in `Mathlib/LinearAlgebra/Trace.lean:75`. |
| `Mathlib/Algebra/Module/Submodule/LinearMap.lean:209` | `LinearMap.restrict`, explicit subspace-preservation hypothesis. |
| `Mathlib/GroupTheory/SemidirectProduct.lean:46` | Normal-first carrier and multiplication at63. `Subgroup.index` in `Mathlib/GroupTheory/Index.lean:55` has default0 for infinite index; all uses here are finite. `Subgroup.Normal.conj_mem` is in `Mathlib/Algebra/Group/Subgroup/Defs.lean:608`. |
| `Mathlib/LinearAlgebra/Pi.lean:110` | `LinearMap.single`, used by the new tensor signature to state the actual block decomposition. |

The new contracts were opened too: `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:134` (`quadraticChar_one_iff_isSquare`, requiring a≠0) and line159 (`quadraticChar_neg_one_iff_not_isSquare`). `LinearMap.single` at `Mathlib/LinearAlgebra/Pi.lean:110` maps into the actual product and needs decidable equality on the index, which the new signature retains. The tensor near-match `Representation.tprod` at `Mathlib/RepresentationTheory/Basic.lean:618` constructs a tensor action; it does not prove that the independently normalized Weil action equals it.

The native definitions were inspected for what they do *not* impose. `Representation` is a monoid homomorphism into linear endomorphisms, not an irreducible representation; the theorem signatures add irreducibility. `Representation.invariants` is exactly “∀g, ρ(g)v=v”, without a nonzero-dimension promise. `AddChar` has zero/add laws, not nontriviality or injectivity. `Nondegenerate` means left and right separation; `orthogonal` tests B(x,y)=0 for x in the subspace. `LinearMap.det` defaults to1 without a finite basis, while trace defaults to0; finite-dimensionality prevents those defaults in every headline use.

The supplied near-matches and fresh object searches found no duplicate of an admitted headline. The symmetric `dualProd` in `Mathlib/LinearAlgebra/QuadraticForm/Dual.lean:38` is f(y)+g(x), not the alternating form here. `Module.natCard_eq_pow_finrank` at `Mathlib/FieldTheory/Finiteness.lean:98` and `finrank_eq_nat_card_basis` at `Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean:433` do not establish representation dimensions, character support or uniqueness. The dual-tensor/Hom equivalence and generic invariant projector also do not supply these conclusions. The rank-one Heisenberg carrier is consumed with an explicit coordinate comparison, not recreated. No declaration has another roadmap's fully qualified name.

### Supplier order, ownership and open heads

Read the main-branch InductionRestriction and CharacterTheory roadmaps as shape examples and to resolve their contracts. Resolved all supplier citations again:

- `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md`, PR #1063: §0.1 at77; half-form commutator at119, centre at127, isometry extension at135, action at154, quadratic correction at172, Lagrangian complements at180, polarized extension equivalence at194. The named carriers, signs and hypotheses agree. The local smooth/unitary statements at346/356 and discriminant-module finite Weil construction at1244 are different from the finite-field symplectic representation here.
- `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md`, PR #1231: §§3.1–3.2 at1331/1343 supply the dimension criterion and extension of an entire prescribed Lagrangian basis over every field. Its contract at355 consumes MetaplecticAutomorphicForms §0.9a, so this direction remains acyclic.
- `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md` on main: Layers0,2,4,5,7 at213,268,503,607,721. The PR #1187 head retains those same layers and native induction/projective interfaces. No revision-only identifier is needed.
- `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md` on main: the Mathlib orthogonality contract at174 and the class-function pairing at271–289 give precisely the characteristic-zero inputs used here.

The source tool adds a banner to open-head files; line numbers above refer to the underlying README, excluding that banner. Supplier conventions were recomputed: the parent half-form commutator gives1 on e,f; the polarization correction sends (1/2,1,1) to(1,1,1); right-coset induction uses q.out·g with the positive subgroup action; the native projective multiplier is ρ(g)ρ(h)=α(g,h)ρ(gh).

The prescribed dependency check returned:

```text
depcheck: 236 roadmaps, 2138 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. In `merge-order/ORDER.txt`, the base roadmap is at151, MordellLawrenceVenkatesh at161 and this roadmap at200. Every Needs line and supplier contract was inspected; no forbidden supplier, upward dependency, cycle, drifted target or undeclared missing construction was found. `design/plan.json` has `gaps: []` and the README declares none.

`roadmaps resolve` reports no unresolved roadmap citation or own Lean name. Its warning that external library names were not checked was addressed by the pinned-file inspection above. The supplied head-derived overlaps file lists no conflicting edit, dropped cited id, dropped owned id or revision-only id. The closest four roadmaps were read at their available heads or on main, as applicable.

Used `roadmaps grep` on main and the indexed open heads for fully ramified characters, finite Weil representations, special isomorphisms, Stone–von Neumann, finite Heisenberg objects and Schrödinger models. Also searched the available board packages and read the board-package index before drawing an ownership conclusion. The nearest extra head, PR #1736, `TauCetiRoadmap/ExceptionalThetaCorrespondencesForG2/README.md:6` and101, owns exceptional local/minimal-representation comparisons and consumes the base local oscillator theory; it does not own this finite library. The phase-space lattice comparison in PR #1149, `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/README.md:19` and589, concerns C*-algebra imprimitivity and L² representations, not normalized finite symplectic actions or fully ramified finite-group induction. The finite Heisenberg appearance in PR #1474, `TauCetiRoadmap/FunctionFieldArithmetic/README.md:2692`, is a double-quotient measure Check, not a competing construction. Discriminant-module finite Weil references in half-integral-weight and q-series roadmaps consume the base's §4.7. No competing owner of these finite headlines was found.

Ownership against open pull requests whose files are unavailable outside the supplied indexed heads was not checked. No absence claim is based on this board checkout alone. No package or source file was changed; only the requested review artifacts and scratch evidence were written.

## Not verifiable

- **Gerardin77, Theorem2.4(b):** direct text is paywalled and settled as `uncertified` in `sources.toml`. It was not fetched or requested again. F21 line1346–1349 was read for the correction, and the twisted formula was independently checked.
- **N02 OCR:** the glyphs for some exponents at lines300,310,316 remain damaged. The readable determinant ratio at311, the subsequent computations at322–349 and the independent determinant checks agree; the damaged glyphs themselves were not certified against a rendered scan.
- **Unprovided open-head files:** the ownership conclusion is restricted to main, the provided board index/available packages, and the accessible indexed heads. It does not certify unprovided revisions outside that evidence.

## Source issues

- **Misprint** in N02 at the computation after Theorem4.3, printed p.23 (N02 line343–344): the source says the generator's permutation is even while assigning sign minus one; it should be odd because its single cycle has even length; affects nothing.
- **Misprint** in FS25 at equation(3.3.3), p.14 (FS25 line522): the source says the pairing of representatives x and y uses the commutator with z; it should use the commutator of x and y; affects nothing.
- **Error** in Gerardin77 at Theorem2.4(b), as reported by F21 footnote3, p.33 (F21 line1346–1349): the source says to induce the pulled-back smaller representation without a determinant twist; it should first tensor with the quadratic determinant character of the isotropic subspace; affects a stated result; corrected in print at F21, footnote3.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9a3e2b348ee658d6e8e4b6648484ad41b63cde06", "job": "REV-PKG-MetaplecticAutomorphicFormsPartII~3", "model": "gpt-6-astra", "worker": "chris-6"} -->
