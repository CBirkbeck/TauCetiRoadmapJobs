# Repair of KloostermanSheavesAndBesselIsocrystals

The findings below are those of `REV-PKG-KloostermanSheavesAndBesselIsocrystals~2`. They are mathematical repairs to the existing package, not an acceptance verdict. No commit was made.

## R01 (P1) — applied

§7.3: infinity horizontal section → dual solution functional at zero, radius `1/|c|`, or `|u|^{−h′}`. Added logarithmic and monodromy inputs, semisimple decomposition and absence of constant quotients; H′-irreducibility alone is insufficient. Updated §7.4 and all-prime §11.5. Evidence: XZ line 1125, lines 2544–2551. Checks compute radii `1,4,1/4` and zero infinity sections.

## R02 (P2) — applied

§1.2: divisor-only definition → graph tensor comparison for every coefficient object, smooth target, and every morphism between smooth bases. Divisor, trait and identity-smoothness assertions are consequences with their hypotheses. Updated §1.6's reference. Evidence: XZ lines 988–998, 1024–1035, 1060–1072. Added the nonsmooth zero-point base change.

## R03 (P1) — applied

§2.6: arbitrary-field uniqueness → geometric existence, central isomorphism torsor and uniqueness respecting a rational marking. §2.7 retains the arithmetic comparison as an explicit normalized, Galois-equivariant descent target. Added gap:critical-center-rational-forms for AffineLieAlgebras A7–A8's coefficient extension. Evidence: XZ lines 2283–2289; nonsquare conjugation needs `c²a=1`, while `a=b²` admits `c=b⁻¹`.

## R04 (P2) — applied

§3.4 now proves the specific quasi-minuscule convergence/overconvergence theorem before extending the comparison without Frobenius via RD.5.102(a). Its missing general analytic input is gap:dense-convergence-detection, in both contracts and plan. The rank-248 E₈ argument uses no minuscule generator or §4.1. Evidence: XZ lines 2093–2107; Miy lines 1294–1303.

## R05 (P2) — applied

The README and plan's cuspidal-newton-bound contract now require a nonzero eigenform and finite-order central character. §5.2 explains central-lattice invariance of the normalized trivial-central datum and preserves reductive scope. Evidence: VL-est lines 270–279, 291–303. The torus Check gives slopes `0` for finite-order characters and excludes the degree character of slope `1`.

## R06 (P2) — applied

§5.2: unique eigenfunction → the nonzero cuspidal eigenfunction of the chosen eigenobject with fixed component values and shift normalization. HNY lines 639–648 permit arbitrary values on Ω. For PGL₂ the vectors `(1,1)` and `(1,−1)` differ by the unramified quadratic twist; trivial component character chooses `(1,1)`.

## R07 (P1) — applied

§2.8 separates diagram foldings and D₄ triality from the seven-dimensional G₂ inclusion in B₃. Added preservation of the alternating three-form and the dimensional controls `14<21`, `14<28`. Evidence: FG lines 621–626, 1233–1242. B₃'s trivial diagram automorphism group cannot produce its proper monodromy subgroup.

## R08 (P2) — applied

§9.1 now treats both parameter sequences, both unequal-length directions, balanced punctured domain, convolution, traces, base change and the empty convolution unit. Nilpotent zero spectrum and §9.2 normalization remain explicitly all-zero-upper specializations; the rank-one Dwork case is distinguished from SL₁. The Lean docstring records the missing general carrier. Evidence: Miy lines 64–90, 922–981, 1149–1165, 1304–1344.

## R09 (P2) — applied

§2.8 now uses characteristic-zero de Rham cohomology and the corrected two local terms, independently of §6.6 (FG lines 1255–1275, 1330–1341). Former §7.2 moved to §2.9; consumers and numbering map updated. Added §2.8 to §4.1's inputs. The explicit internal graph has 65 vertices, 168 edges, zero forward edges and zero cycles.

## R10 (P3) — applied

Replaced every KM label by actual supplier package sections: normalization §1.1, monodromy §1.3, connection §2.1, differential Galois group §2.5, dictionary §2.6. Updated Scope, contracts, examples, needs, dependencies and the plan's scalar gap section. The rank-one sign cites RD.6.48. §2.7 and §8.1 distinguish cyclic functionals from column-horizontal coefficients at odd rank.

## R11 (P3) — applied

Added the former-numbering map for KB layer labels and every target label cited by GlobalShtukasAndFunctionFieldLanglandsPartII, including the moved symmetry target. Its §3.8 needs line resolves to §§0.2–0.3, 1.4–1.6, 1.8, 4.1–4.2, 6.6, 11.5. No consumer became a supplier.

## R12 (P1) — applied

The eliminated-variable API and supplier presentation now say positive rank. §11.1 explicitly gives the rank-zero delta function and tests both fibres. Over F₂, rank zero at `a=1` gives `1`, whereas truncated subtraction gives `−1`; rank one gives `ψ(a)`. The total definition and five Lean headlines remain.

## R13 (P3) — applied

Recomputed all listed Checks: uniformizer `t` versus `t²`; normalized origin fibre versus ordinary `K[2]`; cyclic functional versus horizontal first coefficient in §§2.7, 8.1; affine vertex neighbourhood versus projective Schubert surface; nonintegral ρ for SL₂ versus integral ρ for PGL₂. Evidence: HNY lines 669–674, scalar supplier §2.6, XZ lines 2045–2047 and the explicit calculations below.

## R14 (P3) — applied

§1.1 now cites AC Proposition 1.3.13(i), p. 16, with complete c-affine couple/frame hypotheses transported by the operations contract; XZ Proposition 2.4.4 is smooth-pullback full faithfulness (XZ lines 784–786). §8.4 and the PRW manifest locator now cite §3.3, pp. 13–14, Theorem 3.2, p. 14 (PRW lines 709, 718).

## R15 (P3) — applied

Added three or more dedicated prose Checks for each §11.1 definition, including non-prime-field trace, coefficient-characteristic collapse and zero hypergeometric parameter. Added block-truncation controls in §10.1 as the same pattern. No Lean examples or boundary theorems were added. The trace-character definition now explicitly retains prime `p` and finite `F`.

## R16 (P3) — applied

Former §7.2, now §2.9, defines `r_{a,σ}:V→V`, its affine-simple coordinate action and functional pullback before the symmetry formula. It retains the actual lowest-root scalar of σ and avoids the derivation symbol δ. Identity, composition and SL₂ invariant-product Checks give scale `a`, not `a²`. Evidence: XZ lines 1915–1935.

## Gate failures

All nine reported statement-hygiene occurrences were repaired. The package text scanners return `statement-hygiene=0` and no other text-scanner hits.

| Original declaration/occurrence | Change |
| --- | --- |
| `kloostermanSum`, field F | `[Fintype F]` → `[Finite F]`; product-fibre finite-support sum |
| `orthogonalSum`, field F | `[Fintype F]` → `[Finite F]`; two finite-support sums |
| `quadraticCharIn`, field F | `[Fintype F]` → `[Finite F]`; enumeration used only inside the body to specialize Mathlib's character |
| `quadraticHypergeometricSum`, field F | `[Fintype F]` → `[Finite F]`; finite-support sum |
| `orthogonalSum_sub_card_eq_kloostermanSum`, field F | `[Finite F]`, cardinality `Nat.card F` |
| `gaussSum_mul_orthogonalSum_sub_card`, field F | `[Finite F]`, `Nat.card F`; Gauss sum written as its finite-support sum, with the same inverse character |
| `orthogonalSum_sub_card_eq_convolution`, field F | `[Finite F]`, `Nat.card F`; outer finite-support sum |
| `orthogonalSum_ordinary`, field F | `[Finite F]`, `Nat.card F` |
| `orthogonalSum_ordinary`, extension L | `[Finite L]`, `Nat.card L` |

`Nat.card_eq_fintype_card` at Mathlib/SetTheory/Cardinal/Finite.lean:47 identifies the cardinalities. These are presentation changes, not restrictions to enumerable field data. The unchanged finite-index sums still use their native finite types. No datum is chosen by an existential witness in a definition, and no local instance appears in a signature.

## Required checks and exact outcomes

- Final package elaboration, `lake env lean` on `packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean` from the content checkout: **exit 0**, exactly five `declaration uses 'sorry'` warnings at lines **66, 133, 145, 156, 169**, no errors or other warnings. Only `import Mathlib` is present; no Tau Ceti object build was required.
- A scratch copy with `#check @name` for **all eleven declarations** was elaborated after the final signature change: **exit 0**, the same five expected warnings. Compared every elaborated signature with §§10.1–10.2, 11.1 and 11.3. All needed DVR, completeness, characteristic-zero, nonunit-two, character, rank and field-extension hypotheses remain. The finite-field binders and cardinalities changed as above; `traceChar` additionally retains `[Fact p.Prime]` and `[Finite F]`. No section binder disappeared.
- The exact prescribed dependency command with `--movable` and the main content checkout returned **exit 0**:

  ```text
  depcheck: 236 roadmaps, 2146 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line was emitted.
- The worker's installed `scan_folder` text gate on the actual package README/Lean returned **ok=true**, every count **0**, including imports, statement hygiene, README identifiers, layer/target ids, process residue and private paths. Two attempts to invoke the generic worktree CLI against the board's package layout returned missing-file errors before scanning; the direct package text scan avoids that layout mismatch. No tooling was changed.
- Internal prerequisite audit: **65 sections, 168 explicit own-section edges, zero forward edges, zero cycles**. In particular, §2.8 needs §2.1 rather than §6.6; §6.3 needs §§2.8, 6.2; §6.6 needs §§4.2, 6.3–6.5. The symmetry consumer §6.4 now needs §2.9. §4.1 explicitly includes §2.8.
- `roadmaps resolve` found no missing own Lean identifier. Its sole cross-roadmap lead says KloostermanMomentsAndPotentialAutomorphy §2.6 has no main/open-head roadmap. That is an index limitation: `packages/KloostermanMomentsAndPotentialAutomorphy/README.md` contains §2.6 at line 747, and its package and merge-order entry exist. The declaration and sign dictionary were read there.
- JSON comparison with the starting plan, after deleting the top-level `gaps` member from each value: **equal**. No other plan member changed. `metadata.toml` is unchanged. `git diff --check`: **exit 0**, no whitespace errors. The report also has zero private-path scanner hits.

## Source, ownership and interface audit

Source evidence was read in the operator's legal cached extractions. The supplied certified works retain their provenance and hashes. The seven previously settled uncertified sources remain settled; none was requested again. The dense-convergence input is certified here as the exact step used in the accessible proofs, XZ line 2104 and Miy lines 1298–1303; no claim to have read Ogus's original theorem is made, and that original is not a new direct citation. A supplementary original-source lookup was unsuccessful; the repair uses these two inspected passages instead and has no outstanding source request.

The main-branch shapes of ReductiveGroupsPartII and AffineLieAlgebras were read. Ownership searches used `roadmaps grep` across main and the supplied open heads, plus the board packages. The scopes of the five closest roadmaps were compared: GlobalShtukasAndFunctionFieldLanglandsPartII consumes the Bessel construction; GlobalShtukasAndFunctionFieldLanglands supplies level/Satake geometry; GeometricSatakeAndFusion supplies its étale/diamond theory; CharacterSumsOverFiniteFields owns Hasse–Davenport; PadicDifferentialEquationsAndRigidCohomology owns analytic foundations and the scalar rigid objects. None supplies the newly corrected general arithmetic hypergeometric construction. The group-specific descent and quasi-minuscule comparison remain this roadmap's targets; the two new general prerequisites are explicit supplier gaps, not claims about completed supplier content.

Cross-roadmap contracts were resolved against the actual main or supplied head: GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.14, 1.1–1.2, 1.4–1.6, 1.8–1.9, 1.12; CongruenceSpectralGap §§4.2a–4.2b; CharacterSumsOverFiniteFields §3.3; ReductiveGroupsPartII RG2.3.3, RG2.3.6, RG2.4.1; ReductiveGroups Layers 1, 7, 9–10; OrthogonalSpinGroups Layers 0–1; FormalConnectionsOpers F2, F4, F6; AffineLieAlgebras A7–A8; SpringerResolutionAndCharacteristicCycles Layers 8–9; MotivesAndAlgebraicCycles §§6.1–6.3, 6.5; BunGAndNewtonStrata §§1.5, 1.22; DeligneWeightsAndPurity §§8.5, 8.12, 8.14, 8.19; and the stated EtaleCohomologyFoundations operations. The RD headings cited in the package exist, including the material distinctions among RD.5.9, RD.5.102(a) and RD.5.112(ii). The Part II curve contract is MS.4.6–MS.4.7. AffineLieAlgebras' centre results are over ℂ; their extension to general coefficient fields is therefore requested, rather than presumed.

The pinned commits read from the content manifest are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. In those copies, Mathlib/FieldTheory/Finite/Trace.lean:37,49 provides the prime-field nondegenerate trace and Frobenius-sum trace; Mathlib/NumberTheory/GaussSum.lean:72,200 defines Gauss sums and proves their product relation with its nontriviality/primitivity hypotheses; Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:120 and Mathlib/NumberTheory/MulChar/Basic.lean:455 provide the transported quadratic character. These do not prove the orthogonal identities. The near-match candidates are scalar character, sum, series and dimension APIs, not any of the five headlines. TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean:95 and TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:138 supply finite comodules and tensor reconstruction; neither constructs a curve isocrystal. Object searches found no duplicate arithmetic hypergeometric or group-valued Bessel construction at either pin.

No open revision uniquely defines a cited supplier id. The downstream KB citations missed by the overlap summary were checked directly and are preserved by the numbering map.

## Adversarial mathematics pass

The following are computations and separating controls, not proofs of the deep targets. Each row identifies the statement tested; numerical identities use exact integers, rational numbers or cyclotomic coefficient vectors. For a primitive p-th root ζ, vectors are coefficients of `1,ζ,…,ζ^{p−2}`. Finite-field calculations covered orders `2,4,8,3,9,5,7`, every nonzero parameter and every nontrivial additive character for the odd identity (`n=1,2`) and convolution (`N=2`); the characteristic-two identity used the specified prime-field trace character. Geometric and cohomological rows compute the small instances of the stated construction and its normalizations.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Standing finite-field datum | p=2,3; extension degree 2 | q=4,9; q=1 gives no finite field | positive characteristic and nonempty field enforced | none |
| Column Frobenius direction | SL₂, N=E₁₂, q=c² | NC and qCN both have upper-right c for C=diag(c⁻¹,c); inverse choice gives c⁻¹ versus c³ | column equation separates inverse convention | none |
| Ordered Frobenius products | U=[[1,1],[0,1]], V=[[1,0],[1,1]], D=diag(2,1) | UV=[[2,1],[1,1]], VU=[[1,1],[1,2]]; tr(UVD)=5, tr(DVU)=4 | reversal changes the construction | none |
| Dwork sign convention | q=p, d−πdt | C′/C=π−pπt^{p−1}; replacing the connection sign leaves constant error 2π | compatible multiplier fixed | citation repaired |
| Kummer sign convention | q=5, a=1/4 | C=x⁻¹; at Teichmüller 2 the value is 2̃⁻¹, not 2̃ | inverse tame character fixed | none |
| Half twist | q=4, degree 2 | c_q⁻²=1/4; square is 1/16 | half and integral twists distinguished | none |
| Raw/normalized trace | q=3, r=2, a=1 | raw −1; normalized 1/√3; dividing by q gives 1/3 | correct square-root coefficient field required | scalar locator repaired |
| Newton dominance convention | GL₂, μ=(0,0), λ=(−1/2,1/2) | endpoints both 0; intermediate heights 0 and −1/2 | μ≤λ gives the higher polygon | none |
| §0.1 coefficient extension | Q₃(μ₃) and adjoining √3 | trace 1/√3 absent in first, present in second | half-twist datum necessary | none |
| §0.2 root-depth quotient | SL₂; torus | dimensions 2 and 0; finite-root-only model has dimension 1 | affine coordinate essential | none |
| §0.2 genericity | SL₂ φ=(1,1), (1,0); torus | nonzero root restrictions 2,1,0 respectively; required numbers 2,2,0 | second datum fails, torus passes empty condition | none |
| §0.2 kernel comparison | F₂[[t]], y=t and t² | coeff_t(square)=0; coeff_t(1+t)=1; 1+t²=(1+t)² | uniformizer control holds, arbitrary y fails | R13 |
| §0.3 big-cell/component model | SL₂; PGL₂ | neutral chart A²; Ω has respectively 1 and 2 elements | neutral chart alone misses one PGL₂ component | none |
| §1.1 support-to-ordinary map | j:G_m→A¹, constant object | origin ordinary stalk of j_! is 0; ordinary j_* has H⁰-stalk K of rank 1 | map is not generally an isomorphism | exactness locator repaired |
| §1.1 dual weights | point K(−1/2) and its dual | weights 1 and −1 | dual bound changes sign | none |
| §1.2 LA graph normalization | f=id on smooth curve, constant M | f^!N=N(−1)[−2]; after (1)[2], both graph terms are N | dimension shift and twist cancel | R02 |
| §1.2 universal base change | zero point→A¹; constant object | relative dimension −1, hence not smooth; pulled-back rank is 1 on both sides | required base change retained | R02 |
| §1.2 trait consequence/nonexample | j_!K on A¹ | boundary stalk 0, nearby rank 1, vanishing-cycle rank 1 | not ULA over identity | R02 |
| §1.2 objects over a point | skyscraper on A¹→point | supporting rank 1 at origin, rank 0 away; nevertheless ULA over point | identity hypothesis needed for smoothness | R02 |
| §1.2 hyperbolic localization | A² weights (1,−1), then (1,1) | both sides K[−2](−1), then K[−4](−2) | dimensions and twists agree | none |
| §1.3 torus Satake | G_m | weight-0 and weight-1 one-dimensional objects have tensor weight 1; dual weight −1 | reconstructs G_m, not trivial group | none |
| §1.3 minuscule normalization | PGL₂, Schubert dimension 1 | stalk multiplier q⁻¹/² versus wrong q⁻¹ | half twist distinguished | none |
| §1.4 normalized fibre | SL₂ chart dimension 2 | ordinary fibre K[2] has H⁻²=K; shifting back gives H⁰=K | corrected inverse equivalence | R13 |
| §1.4 cleanness | generic versus zero root character | nontrivial additive stabilizer sum over F₂ is 1+(−1)=0; trivial character sum is 2 | stabilizer cancellation requires genericity | none |
| §1.5 unit/tensor Hecke action | W=1, Std_SL₂⊗Std_SL₂ | ranks 1 and 2·2=4 | tensor, not rank-two replacement | none |
| §1.6 eigenvalue ranks and trace | unit; Std_SL₂ over F₃, a=1 | ranks 1 and 2; scalar trace 1, normalized standard trace 1/√3 | eigenobject normalization agrees | stale ULA reference repaired |
| §1.7 rational tame exponent | F₅, order-four character | exponent 1/4 has monodromy of order 4; exponent 1 has monodromy 1 | integral exponent cannot substitute | none |
| §1.7 component conjugation | PGL₂, Ω element acting by inversion | order-four χ becomes χ⁻¹; at generator values i and −i | component character changes | none |
| §1.8 traces of all powers | diag(1,−1), diag(2,−2) | first traces 0,0; second traces 2,8 | degree-one trace alone insufficient | none |
| §2.1 connection | SL₂, SL₂×SL₃, torus | matrices [[0,1],[λ²x,0]], affine factors λ² and λ³, central matrix 0 | all factors and trivial centre correct | scalar citation repaired |
| §2.1 tensor/dual laws | two rank-one matrices a,b | tensor coefficient a+b; dual −a; evaluation coefficient −a+a=0 | horizontal evaluation | none |
| §2.2 invariant parameter | SL₂×SL₃, scale 2 | invariant scales 4 and 8 | common exponent would fail | none |
| §2.3 oper slice | PGL₂ at E=0 and E≠0 | slice dimension 1; infinity slopes 0 and 1/2 | tame origin retained, generic slope distinguished | none |
| §2.4 localization flatness test | A=K[t], specialization t=0 | derived tensor K⊗ᴸ_AK has Tor ranks 1 in degrees 0 and −1 | nonflat specialization need not lie in degree zero | rational-forms gap added |
| §2.5 quantized parameter algebra | PGL₂ | invariant algebra has one generator, oper slice dimension 1 | filtered parameter counts agree | rational-forms gap added |
| §2.6 geometric versus rational central torsor | a nonsquare, then a=b² | rational solutions of c²a=1: none, then c=b⁻¹ with determinant 1 | marking, not geometric triviality, supplies descent | R03 |
| §2.6 punctured torsor | √x at zero | local monodromy −1 versus required unipotent eigenvalue 1 | ramified central twist excluded | R03 |
| §2.6 reductive centre | GL₂; torus | centre dimensions 1 and 1; zero central connection gives determinant multiplier 1 | finite-kernel argument alone insufficient | R03 |
| §2.7 scalar functional/horizontal dictionary | r=3, λ=1 | functional coefficients 1,1,1/8; horizontal coefficients 1,−1,1/8; wrong substitution leaves coefficient 2 at x | signs differ in odd rank | R10/R13 |
| §2.7 rational comparison normalization | nonsquare conjugate versus chosen normalized object | torsor fibre has 0 rational points in nonsquare case; specified marking gives a point and Galois cocycle 1 | target demands construction of the marking | R03 |
| §2.8 monodromy rows | SL₃; SO₇; SO₈ triality | group dimensions 8; 14<21; 14<28 | B₃ drop uses G₂ representation, D₄ uses triality | R07 |
| §2.8 characteristic-zero rigidity | Ad_SL₂; E₆ restricted to F₄ | h¹=1−1−0=0; complementary rank 26 has h¹=2−2−0=0 | no rigid-cohomology input from Layer 6 | R09 |
| §2.9 root-line action | SL₂ φ=(b₁,b₀), rotation a | invariant b₁b₀ maps to ab₁b₀; wrong simultaneous scale gives a²b₁b₀ | affine-only rotation | R16 |
| §2.9 identity/composition | (1,id); rotations 2 and 3 in characteristic zero | coordinate v₀ maps to v₀; composition 6v₀ equals r_6(v₀) | group law holds | R16 |
| §2.9 dual map and low-rank identities | SL₂ Sym²; SL₂×SL₂ standard tensor | dimensions 3 and 2·2=4, matching SO₃ and SO₄ standards | dual direction and representations retained | moved for R09 |
| §3.1 specialization direction | W=1 | source and target A†, map 1↦1 | unit comparison identity | none |
| §3.2 minuscule comparison | Std_SL₂ | fibre middle dimensions 2 and 2; other degrees zero | rank matches representation | none |
| §3.3 quasi-minuscule geometry | rank-one Schubert surface | projective surface dimension 2; vertex chart uv=w² dimension 2; middle-image rank 3 | affine chart is not entire proper surface | R13 |
| §3.4 convergence theorem | E₈ adjoint | nontrivial minuscule generator count 0; dense-open comparison ranks 248=248 | new analytic input applies to rank 248 directly | R04 |
| §3.4 non-F restriction | unit object over X,U | End without Frobenius K=K; with semilinear Frobenius K^σ=K^σ | use underlying overconvergent theorem | R04 |
| §3.5 tensor comparison | SL₂ Std⊗Std; E₈ | 4=3+1; adjoint generator rank 248 rather than 0 | intertwiners and idempotents matter | none |
| §4.1 Frobenius construction | unit; torus; SL₂ | multipliers 1,1; standard trace −R₂/√q | central normalization retained | algebraic-centralizer input added |
| §4.2 nilpotent extension | Std_SL₂; unit | residue E₁₂ has rank 1 and square 0; unit residue 0 | nonzero nilpotent versus trivial object | none |
| §4.3 zero Frobenius | q=4, C=diag(1/2,2) | NC=qCN upper-right 2; slopes −1/2,1/2 | equation and normalized class agree | none |
| §4.3 integrality of ρ | SL₂; PGL₂ | exponents ±1/2 fail SL₂ integrality; PGL₂ half-coroot t↦[diag(t,1)] is integral; [diag(1,4)] and [diag(4,1)] are Weyl conjugate | corrected group and class | R13 |
| §4.4 horizontal equation | Kummer a=1/4, q=5 | C=x⁻¹, δC/C=−1; A−qA=1 | δC/C+A−qA=0 | none |
| §4.5 transpose/inverse dictionary | residue N=E₁₂, q=c² | C⁻¹NC=qN; CNC⁻¹=q⁻¹N; transposition changes N to E₂₁ | inverse alone is not the printed differential equation | none |
| §5.1 Newton class | slopes ±1/2, extension degree 2 | eigenvalues squared and v(q²)=1 give the same ±1/2 | degree normalization invariant | none |
| §5.2 central Newton bound | G_m finite-order and degree characters | central slopes 0 and 1; ρ=0 | second character excluded | R05 |
| §5.2 component eigenfunction | PGL₂ | component vectors (1,1), (1,−1); both nonzero, linearly independent | literal uniqueness false | R06 |
| §5.3 generic Newton comparison | SL₂ log fibre and allowed bound | log slopes −1/2,1/2; opposite dominance bounds force equality | uses no characteristic-two comparison | none |
| §6.1 generated group | trivial functor on Rep(G_m); Std⊗Std_SL₂ | trivial group dimension 0, not 1; tensor representation rank 4 contains invariant rank 1 | closure under subquotients essential | none |
| §6.2 wild nontriviality | SL₂; torus | principal N rank 1 versus 0; a semisimple procyclic representation has no nonidentity unipotent image | almost-simple hypothesis separates torus | none |
| §6.3 irregularity bound | G₂; SL₃ exponents | 14/6<3, integer Irr≤2; Sym²⊕Sym⁴ dimensions 3+5=8, wrong indexing 1+3=4 | exponent and integer bound agree | none |
| §6.4 classification/symmetries | type A₂ odd p; SO₇; Sp₄ | monodromy dimensions 8,14,10; B₃ ambient dimension 21 | symmetry inputs now precede theorem | R09 |
| §6.5 simple-wild parameter | rank-one root system, p odd | rank 1, Coxeter number 2, break 1/2, Swan 2·1/2=1 | p=2 fails p∤2 | none |
| §6.6 rigid adjoint Euler characteristic | SL₂ | χ=−1+1+0=0; h⁰=h²=0 implies h¹=0 | duplicated I₀ would give impossible h¹=−1 | independent from §2.8 proof |
| §7.1 central Frobenius torsor | SL₂ C and −C; PGL₂ | zero eigenvalues c⁻¹,c versus −c⁻¹,−c; adjoint group centre size 1 | normalization eliminates central multiple | none |
| §7.3 radius at zero | rank-two scalar at p=2 | v₂(4^j/(j!)²)=2s₂(j); at j=1,2,4,8,16 all are 2; liminf v/j=0, radius 1 | exact, not merely lower bound | R01 |
| §7.3 rescaling | λ↦2λ and λ/2 | radii 4 and 1/4; coordinate c=4 and 1/4 gives 1/|c|=4 and 1/4 | direction of radius change fixed | R01 |
| §7.3 wrong puncture | adjoint SL₂ at infinity | u₀=v₀=w₀=0; recurrence a(2k−1)u_k=((k−1)³/2)u_{k−1} gives every coefficient 0 | no nonzero power-series horizontal section | R01 |
| §7.3 irreducibility input | identity inclusion SL₄ | H′-irreducible adjoint dimension 15 becomes 10+5 under Sp₄ monodromy, with trivial constituent count 0 | use decomposition/no constant quotient | R01 |
| §7.4 integrality | relative scales c=1,4,1/4 at p=2 | radii on rescaled side 1,4,1/4, reference radius 1 | only unit relative scale compatible | R01 |
| §7.5 representation-ring comparison | G₂⊂Spin₇ | V₇ restricts to 7; Λ²V₇−V₇ has dimension 21−7=14 | spin representation alone insufficient | none |
| §7.6 comparison versus surjection | SL₂→PGL₂ | kernel μ₂ has order 2; both groups dimension 3 | dimension/surjectivity alone cannot prove isomorphism | none |
| §8.1 scalar realizations | r=2 over F₃; r=3 signs | normalized traces 1/√3,−2/√3; odd-rank scalar series first coefficient changes +1 to −1 | supplier dictionary agrees | R10/R13 |
| §8.2 form equations | odd ranks 3,5,7; even 6,8 | NᵗJ+JN=0 and EᵗJ+JE=0 in each case | explicit matrices lie in orthogonal Lie algebras | recomputed |
| §8.2 invariant line | even rank 6,8 | N(e_n−e_{n+1})=E(e_n−e_{n+1})=0 | wrong middle arrow destroys line | recomputed |
| §8.2 cyclic normalization | n=1, first solution coefficient | correct E gives 2λ²; E/2 gives λ² | factor 2 indispensable | none |
| §8.3 decomposition | F₂, SO₈ and SO₇ at a=1 | traces 7/8 and −1/8; difference 1 | invariant line has Frobenius 1 | recomputed |
| §8.4 potential/domain | n=3 | Q equation p₂p′₂−p₁p₃+p₀p₄=0; every W numerator/denominator degree difference 0 | projective rescaling exponent 0 | locator repaired |
| §8.5 boundary count | n=3, q=2,3,4 | direct chart sums 3;13,4;37,5,5 equal U₂+q²−q for the stated field coordinates | corrected count agrees | recomputed |
| §8.5 discriminating dimension | n=4, q=2,3 | chart sums 7;13,40; corrected constants 6,24 versus printed 4,18 | printed totals 5;7,34 fail | recomputed |
| §8.6 even trace | n=4,q=2 | 2⁻³(1+8−2)=7/8; wrong constant gives 5/8 | agrees with decomposition | none |
| §9.1 general nonresonance/rank | q=7, upper 0,1/2, lower 1/3 | differences −1/3,1/6; max(2,1)=2 | admissible rank 2 with nonunipotent tame spectrum | R08 |
| §9.1 balanced domain | q=7, upper 0, lower 1/2 | rank 1; leading coefficient x(1−x), zero at x=1 | extra puncture necessary | R08 |
| §9.1 reverse direction | upper empty, lower 1/2 | max(0,1)=1; inversion gives one rank-one factor | not rank zero | R08 |
| §9.1 resonance exclusion | upper 0, lower 1 | difference −1∈Z | fails hypothesis | R08 |
| §9.1 empty convolution | both sequences empty | support point count 1; rank 0 off that point versus constant local-system rank 1 | not a rank-one local system | R08 |
| §9.1 specialized zero spectrum | n=3,m=1, q=3 | g=−i√3, γ=i√3; three eigenvalues γ,3γ,9γ | correct count, no zero | R08 |
| §9.1 one-factor trace | n=1,m=0 | rank 1, trace ψ(a), zero-fibre eigenvalue 1 | Dwork object, not SL₁ trivial object | R08 |
| §9.2 normalization | n=3,m=1,q=3 | multiplying γ,3γ,9γ by 1/(3γ) gives 1/3,1,3 | only specialized zero spectrum exported | R08 |
| §9.2 degree-two Gauss lift | F₃→F₉ | g=−i√3, g′=−g²=3; missing lifting sign gives −3 | normalizing scalar must be squared before rewriting | recomputed |
| §9.3 odd comparison | n=1,q=3,a=1 | g(U₁−3)=2i√3=H₃(4a); 4a=1 in F₃ | Gauss sign and scaling agree | none |
| §9.4 normalized convolution | N=2,q=3,a=1 | U₂−3=7−3=4; convolution (−2)(−1)+(1)(2)=4 | cohomological sign/half twist retained | recomputed |
| §10.1 block definition | p=2,m=1,s=2; s=0,m=2,B(j)=j+1 | indices 4,5,6,7; second block is 3x², coefficients 0,3,0 at 1,2,3 | endpoint/prefix errors separated | added block Checks |
| §10.1 total block boundary | p=0,s=1; p=1 | all intervals empty; one-index interval [m,m+1) | junk p excluded from congruence theorem | added Check |
| §10.1 Dwork normalization/periodicity | B⁽ⁱ⁾(j)=3^{i+1} over Z₂ | B⁽⁰⁾(0)=3, consecutive ratios 1/3; period-r ratio 3^r≠1 | conditions do not imply normalization or periodicity | none |
| §10.1 signed necessity | constant rank-three B(j)=(−2)^{3j}/(j!)³ | B(4)/B(2)=1/27≡−1 mod 4; base ratio 1 | ordinary condition fails where sign is needed | none |
| `signed_dwork_congruence` | alternating rank 3 and 5, s=0..3,m=0..2,N=0..64 | minimum of v₂(coefficient)−s−v₂(B⁽ˢ⁺¹⁾(m)) is 2 | every tested coefficient has required divisibility | no headline change |
| §10.2 block identity degenerate case | B=1, m=0,s=0,p=2 | coefficient at even degree ≥2: 1−1=0; odd degree:0−0=0 | difference identically zero | none |
| §10.3 unit-root line | F=(1−x)⁻¹,p=2 | η=(1−x)⁻¹, f=1+x; η−2xη(x²)=1/(1+x)=f′/f | sign fixed | none |
| §10.3 constant extension | q=4 | f_q=(1+x)(1+x²)=1+x+x²+x³; single step is 1+x | degree-four multiplier differs | none |
| §10.4 two series and intertwiner | n=1 | F=1−8x+8x²+…; G=1+8x+24x²+…; h=1−16x+112x²+…; h′/h constant −16=η_F(0)−η_G(0) | correct orientation h=F/G | none |
| §10.4 Frobenius compatibility | same, coefficients through x² | h f_G and f_F h(x²) both start 1−8x+0x² | horizontal identity also respects Frobenius | none |
| §10.5 maximal quotient dual | rank-three, q=2 | quotient multiplier at 0 is 2; solution line multiplier is 1; slopes 1 and 0 | dual/twist cannot be omitted | none |
| §10.6 characteristic-two comparison | q=2,a=1,n=1,2,3 | both standard traces −1/2,−1/4,−1/8 | all tested ranks agree | recomputed |
| `kloostermanSum` rank zero | F₂,a=1; F₃,a=2 | values 1 and 0; wrong eliminated rank-zero expression −1 in first case | corrected API | R12 |
| `kloostermanSum` positive rank | F₂,a=1,k=1,2,3 | −1,1,−1; k=1 formula ψ(1)=−1 | correct tuple constraint and additive sign | R15 |
| `orthogonalSum` total/positive ranks | F₃,a=2,n=0,1 | both total values 4; empty-argument sum would be 1; headlines exclude n=0 | total definition disclosed | R15 |
| `quadraticCharIn` | F₃→C; F₅→C; coefficient characteristic 2 | at F₃ 0,1,2:0,1,−1; F₅ 4,2:1,−1; characteristic-2 targets send ±1 both to 1 | zero/square/nonsquare and coefficient reduction tested | R15 |
| `quadraticCharIn` source characteristic 2 | F₄ | values 0,1,1,1 | no nontrivial quadratic character | R15 |
| `quadraticHypergeometricSum` b=0 | N=0,1 | every quadratic factor 0, totals 0,0 | division-by-zero total value documented | R15 |
| `quadraticHypergeometricSum` N=0 | F₃, b=1,2 | ζ² and −ζ, from single empty tuple | agrees with eliminated y | R15 |
| `quadraticHypergeometricSum` N=1 | F₃,b=1,2 | 0 and ζ−ζ²=i√3 | corrected sign after recomputation | R15 |
| `traceChar` | F₄=F₂[ω] | Tr at 0,1,ω,ω+1:0,0,1,1; character 1,1,−1,−1; trivial base gives four ones | actual trace, not identity map | R15 |
| Characteristic-two headline | F₂,F₄,F₈,a=1,n=1 | U₁−q=−1,5,17 equals R₃ in each field | trace character normalization holds | recomputed |
| Characteristic-two character restriction | F₄,c=ω,a=1 | twisted U₁−4=−3; twisted R₃(1)=5; twisted R₃(1/c)=−3 | arbitrary character would falsify identity | hypothesis retained |
| Odd-characteristic headline | F₃ and F₉,a=1,n=1 | (−i√3)(−2)=2i√3; 3(25−9)=48 | both sides agree exactly | recomputed |
| Convolution headline | F₄,a=1,N=2 | U₂−4=25−4=21; convolution (5)(3)+(−3)(−1)+(−3)(−1)=21 | every-character formula holds | recomputed |
| §11.2 toric degree/volume | n=1,d=1,2 | volume d/2; normalized degrees 3 and 6 | dimension factorial factor correct | none |
| §11.2 toric slopes | n=1,p=3,d=2 | slopes 0,1/2,1,3/2,2,5/2; quotient retains 1/2,3/2,5/2 | correct half-integer slopes | none |
| `orthogonalSum_ordinary` | F₂,a=1,n=1, extension degrees 1,2,3 | power sums −1,5,17; polynomial T³+T²−2T−8 has lower-polygon root valuations 0,1,2 | fixed eigenvalues explain all three traces | finite binders changed |
| §11.3 normalized classical slopes | scalar rank 2,p=2; odd rank 3 | scalar slopes −1/2,1/2; orthogonal −1,0,1; even rank 4 adds 0 | ranks divisible by p retained | none |
| §11.4 exceptional branch | A₂ and A₆,p=2 | monodromy SO₃ dimension 3 and G₂ dimension 14, versus characteristic-zero SL₃ dimension 8 and SL₇ dimension 48 | ambient adjoints not identified by standard comparison | none |
| §11.5 all-prime local statements | rank-one root system,p=2 | inertia A₄ order 12; Weyl order 2 divisible by p | tame-Coxeter break theorem not applied at p=2 | radius extension included |

## For the maintainer

- Changed mathematical files: `packages/KloostermanSheavesAndBesselIsocrystals/README.md`, `Suggested.lean`, `sources.toml`, and only the top-level `gaps` member of `design/plan.json`.
- No Lean declaration was added, deleted or renamed. The five headlines remain the same mathematics; finite-field signatures now avoid enumeration data. The docstring additionally names the general hypergeometric construction as unstatable.
- Two new supplier gaps remain library prerequisites: PadicDifferentialEquationsAndRigidCohomology, dense-convergence-detection; AffineLieAlgebras, critical-center-rational-forms. Existing cuspidal-newton-bound now includes finite-order central character, and the scalar-ordinarity gap cites the actual package numbering. These edits do not assert that another roadmap already supplies the missing results.
- Former §7.2 is now §2.9. The README preserves the old subsection and KB target labels by an explicit map. No other layer or target was reorganized. Downstream consumers need not change their KB citations.
- Scalar supplier references use its board package, not its obsolete design labels. The source manifest corrects PRW and AC locators and extends Miy/FG locators for the repaired targets; source provenance remains unchanged.
