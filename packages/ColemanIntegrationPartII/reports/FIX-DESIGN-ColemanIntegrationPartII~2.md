# Design repair: ColemanIntegrationPartII

## F01 (P1) — applied

Nonexistent ColemanIntegration §7.7 import → its actual L0/L1 good-reduction boundary. §§4.0a–4.0c now own abelian primitive rigidification, proper-Albanese rational-form reduction, and all-prime natural integration, including affine universal values and coefficient extension. The compactification ingredient is imported from ResolutionOfSingularitiesCharacteristicZero §6.2. All `base-single` edges now point to §4.0c.

## F02 (P1) — applied

Unbound contracts → producing targets: §2.0 residue transport, §§3.0a–3.0c component/full-coefficient/curve comparisons, §3.1a index reciprocity, §4.0d natural reciprocity, §4.0e Jacobian bridge, §6.0 form relations and §7.0 Tate differential charts. Import abelianLog from AnabelianGeometryAndNonabelianChabauty §5.8 and generic rigid comparisons/weights from PadicDifferentialEquationsAndRigidCohomology. No unresolved premise or backwards index ownership remains.

## F03 (P2) — applied

Repeated analytic logarithmic construction → imports of ColemanIntegration L0.A1–L0.A2, L0.11–L0.12 and L0.20–L0.23, retaining coefficient, parameter and convergence hypotheses. §2.1 keeps the formal extension and degree-one subspace; §2.1a owns only the broader analytic coefficient extension. §5.1 constructs labelled compatible choices using supplied analytic primitives, with a separate formal argument.

## F04 (P2) — applied

Disconnected graph API → explicit pinned cochain, quotient, coefficient-map and relabelling imports. `LengthCochains.simpleCochainsEquiv` and `harmonicProjection_simpleCohomologyEquiv` compare modules and quotients through Multiplicative k. Cochain values are preserved; the chain comparison negates degree one. The single-edge Check computes roadmap −3 versus pinned +3. Simple-graph quotient/functoriality results are imported through these bridges.

## F05 (P2) — applied

Whole-component natural/Coleman restriction premise → a proved smooth-residue-domain comparison in §4.2, using independently owned natural reciprocity, component reciprocity and the compact Jacobian subgroup bridge. §4.3 alone supplies connecting-annulus values. New Tate negative controls give differences −1/3 and −2/3 from the same Coleman primitive at valuations 1/3 and 2/3.

## F06 (P2) — applied differently

A missing order entry treated as certification → an explicit failed dependency outcome. The required design-README command was run; ColemanIntegrationPartII remains absent from the order. Registration is outside the permitted edits. The merge-order owner must place it after every supplier, including AnabelianGeometryAndNonabelianChabauty, then rerun the gate. No order or tooling file was changed.

## F07 (P3) — applied

ArithmeticDynamics §§3.58 and 3.60 → §3.58, “No rational 5-cycles”, target `noRationalFiveCycle`, with ED.3/`fps-genus-two-mordell-weil` and ED.4/`fps-quintic-cycle-curve`. The description retains Jacobian rank 1, below genus 2. The unrelated Möbius-product section is no longer cited. Consumer descriptions introduce no supplier edges.

## F08 (P3) — applied

Definitions 4.1–4.3 on p. 12 → printed pp. 11–12 in §1.1, its plan locator, references and source manifest. Definition 4.1 starts at besser2017 line 528 before the page marker at line 533. Theorem 4.4 remains on p. 12, besser2017 line 553.

## Evidence and ownership verification

The source texts were read from their supplied legal extractions. No passages were copied into the deliverables, no additional mathematical text was required, and no missing-reference table is needed. Acquisition metadata and hashes were retained; only locators and consuming sections changed in `packages/ColemanIntegrationPartII/sources.toml`.

| Question | Evidence read | Conclusion |
| --- | --- | --- |
| Natural integration and construction | colmez1998 line 2982, line 2986, line 2996; finite-difference theorem line 3169, primitive rigidification line 3193; Albanese reduction line 3376 and apparent-pole extension line 3399 | Existence belongs here, with its construction prerequisites. The affine universal coefficient and natural-theory uniqueness are explicit, not derivative-only uniqueness. |
| Good-reduction and coefficient comparison | colmez1998 line 229 and line 246; vologodsky2001 line 51, line 195 and line 1806 | Good-reduction comparison and equivariant descent support the added targets. Vologodsky's preprint comparison retains p>2; Colmez supplies the all-prime theorem. |
| Local indices and graph signs | besser2017 line 402, line 421, line 528 and line 553 | Residue orientation, antisymmetry and harmonic decomposition agree with the kept conventions; graph-definition pagination needed correction. |
| Wide-open reciprocity and curve maps | besser2017 line 503, line 586, line 627, line 646, line 654, line 671 and line 747 | The missing curve maps and index/cup identification are genuine targets, with the local index preceding index-dependent reciprocity. Generic rigid foundations are imported separately. |
| Smooth-residue comparison | besser-zerbes2017 line 74, line 88, line 95, line 108, line 142, line 161 and line 212 | No upstream whole-component natural restriction can be assumed. Principal-divisor reciprocity and compactness prove the comparison on smooth residue domains. |
| Formal versus analytic primitives and triple choices | besser-dejeu2012 line 2232, line 2251, line 2299, line 2430 and line 2520 | Keep the formal characteristic-zero extension and labelled primitive data; import already-owned analytic primitives. Preserve opposite pair-constant shifts. |
| Global relations | besser-dejeu2012 line 2533, line 2546, line 2591, line 2769 and line 2784 | Full analytic Coleman coefficients and the actual-form relation theorem require producers before the global pairings use them. |
| Tate bridge and negative control | besser-zerbes2017 line 245, line 256 and line 265; colmez1998 line 237 | Point uniformization alone does not export its differential/chart comparison. On q=p³ with log(p)=1 the valuation correction varies across an annulus. |

ColemanIntegration was read at `acaaf506f3822fc5c8211345cb48f6b1cb00656c`: L0.20–L0.23 have the analytic logarithmic ring, parameter transport and primitive/kernel results; L1.2, L1.17, L1.17a, L1.18–L1.19 and L1.43 have the stated good-reduction, coefficient and strict-neighborhood boundaries. It has layers L0–L3 and no natural-integration §7.7. Its algebraic coefficient extension is not identified with arbitrary full analytic ℂ_p data.

AnabelianGeometryAndNonabelianChabauty was read at `59d989dd138cd28b4a4643ab233c04ad6d62aa34`: §5.8 owns arbitrary-reduction abelianLog, while colemanAbelian.integral assumes good reduction. ResolutionOfSingularitiesCharacteristicZero §6.2 exports sncCompactification only for smooth quasi-projective varieties. §4.0b imports it on a dense such open and owns the extra proper-Albanese extension argument. PadicDifferentialEquationsAndRigidCohomology §§RD.4.31–RD.4.33, RD.5.76, RD.6.1, RD.6.86, RD.6.88 and RD.6.92 were read at its open head (README blob `75bde7e5e7a1572121447c65f6d6fe414d6e3acd`). Their generic rigid comparisons, finiteness and weight theorem are imports, not repeated constructions.

The open ArithmeticDynamics text at `1921611a7a96ac19fb15c2b1291b35958c3ef0cb` has the five-cycle theorem in §3.58 and the Möbius-product theorem in §3.60. Its five-cycle application explicitly requests ED.3 rank 1 and ED.4 rational points on a genus-two curve. ErdosProgressionPowers at `e101259371172a32b3dd13e926676ae33b6af5cd` consumes fixed-exponent rational-point finiteness; it supplies no integration theorem. Main-branch StableReduction, RigidAnalyticGeometry, JacobianChallenge and EllipticCurves were also read; the first three supplied the README shape examples.

Pinned object searches located the relevant files; the declarations themselves were read at the manifest commits, not inferred from default-branch search results:

| Pin and file | Declarations/evidence | Use |
| --- | --- | --- |
| Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `TauCeti/Combinatorics/SimpleGraph/Cohomology/Basic.lean:54`, `:79`, `:99` | oneCochains; coboundary evaluates target/source; FirstCohomology is the quotient by its range; lift and quotient criteria | The module/quotient bridge is an extension; those group quotients are not rebuilt. |
| Same pin, `TauCeti/Combinatorics/SimpleGraph/Cohomology/Map.lean:97` and `Relabel.lean:123` | oneCochainsMap_coboundary and oneCochainsRelabel_coboundary | Import functoriality through the signed comparison. |
| Same pin, `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84`, `:109`, `:173` | IsAlbanese, homEquiv, uniqueUpToIso | Import the universal-property carrier; own the additional existence/rational-form theorem. |
| Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, `Mathlib/RingTheory/LaurentSeries.lean:132`, `:176`, `:184` | hasseDeriv_coeff, derivative, derivative_map | Reuse the bounded-below formal Laurent carrier. Analytic families with infinite negative tails are not silently coerced into it. |
| Same pin, `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean:80`, `:125` | lapMatrix, lapMatrix_mulVec_apply' | Keep only the multigraph/positive-rational-metric extension and its comparison. |

## Adversarial mathematics pass

This is a manual mathematical audit, not a Lean proof. Each target row includes every API entry attached to that target in `packages/ColemanIntegrationPartII/design/plan.json`. The matrix covers all 44 targets, their 121 API entries, and the defining conventions. “Retained” means the stated formula survived these tests with its actual hypotheses; it does not certify that the planned construction has been formalized.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1 cochains, incidence, maps and simple-graph bridge | Empty graph, isolated vertex, loop, one edge with values 2 and 5, length 1/2 | d gives −3; pinned additive coboundary gives +3; loop divergence is zero; pairing of 2,3 is 12 | Added value-preserving module bridge and signed chain comparison. |
| §1.2 decomposition and quotient bridge | Tree; disconnected graph; triangle (3,0,0); characteristic 3; ℚ₃ | Harmonic part (1,1,1), exact part (2,−1,−1); characteristic 3 permits a nonzero exact harmonic cycle | Retained CharZero and componentwise ambiguity; added pinned quotient comparison. |
| §1.3 metric subdivision | Jump 6, lengths 1/3 and 2/3; m=1; attached tree | New jumps 2,4 preserve current, energy and residue sum; zero length is excluded | Retained. |
| §2.0 residue transport/germs | z=t²; z=t⁻¹; identity; quadratic residue field; infinite negative analytic tail | Residues 2,−1,1; residue 1 traces to 2; an infinite negative tail is not a formal Laurent germ | Added target and meromorphic-germ qualification. |
| §2.1 degree-one logarithmic subspace | Constants; L; L²; u=az(1+h); characteristic p | Res d(f+aL)=a; L² has logarithmic differential and is outside degree one | Imported analytic algebra; retained formal extension and new subspace. |
| §2.1a general analytic coefficients | ℚ₂, ℚ₃; trivial restriction on rational integers; closed versus open annulus | d(L²/2)=L dz/z and d(L³/3)=L² dz/z; interior radius margins absorb inverse-integer growth | Added only the broader coefficient theorem, with actual openness/completeness hypotheses. |
| §2.2 double index and constant laws | (1,L), (L,1), (z,z⁻¹), (L,L); two constant shifts | Values 1,−1,−1,0; change A Res dG−B Res dF | Retained formula; residue owner bound. |
| §2.3 double pullback | Identity; z=t²; z=t⁻¹; constant map | Factors 1,2,−1; degree-zero maps excluded | Uses §2.0 transport rather than an unspecified premise. |
| §3.0a component cover | Smooth model; xy=π; self-node | One core without connecting ends; opposite node residues; self-node requires genuine refined domains | Added producing construction, allowing compatible finite extension. |
| §3.0b full analytic Coleman coefficients | (1−αz)⁻¹ with α transcendental; scalar; log z; incompatible end constants | Full analytic coefficient series need not be a finite tensor sum; constant kernel and globally compatible primitives remain essential | Added coefficient extension without asserting equality of carriers. |
| §3.0c curve Čech/cup/operators | Smooth positive-genus curve; total coboundary; φ=diag(1,q), N(e₂)=e₁ | Graph maps vanish in good reduction but H¹ need not; χ of a global form is its jump; Nφ=qN | Added curve-specific comparison, importing generic rigid foundations. |
| §3.1 end-sum and global residue theorem | Zero form; filled regular disc; residues +1,−1 | Global constant changes cancel; a newly filled nonsingular disc contributes zero | Defined pairing and proved residue cancellation before reciprocity. |
| §3.1a compact cup/reciprocity | Rational core; cup value 1; logarithmic unit; one quadratic boundary point | Values 0,1,0; the last spectrum is −q, not q; 1/q is still excluded | Added compact projection/index comparison; imported general qζ spectrum and added nonsplit Check. |
| §3.2 harmonic data | Bridge jump 2; triangle cycle; one component; self-node | Subtracting 2 on the head removes a bridge jump; a cycle cannot be killed by constants | Bound cover/cohomology inputs; retained torsor, sign and refinement laws. |
| §3.3 auxiliary correction | (c,d,rη,rω)=(2,3,5,7); reversal; component shift | Correction −11, preserved by reversing all signs; component shifts can change both sums | Retained. |
| §3.4 corrected pairing | P¹; Z empty; proper second-kind cup value 1; rational tail | Zero in genus zero; value 1 for the specified proper classes; holomorphic-only representatives do not span proper H¹ | Replaced comparison gap by §3.0c and compact-pairing input by §3.1a. |
| §3.5 Frobenius/monodromy | diag(1,q), N(e₂)=e₁; N=0; identity φ with q≥2 | Scaling q and two graph terms 1−1=0; arbitrary identity φ fails scaling | Bound actual operators and wide-open scaling. |
| §4.0a abelian primitives | Dimension zero; invariant form; df; unrelated locally constant perturbation | Zero-dimensional integral is zero; invariant case is abelianLog; finite-difference rigidification excludes spurious locally constant changes | Added primitive and cocycle-splitting targets, importing the logarithm. |
| §4.0b rational-form Albanese reduction | A¹, dt; G_m, dt/t; proper curve; apparent poles | Proper-Albanese part is zero for the first two but exact/logarithmic terms survive; cancelling artificial poles must not create singularities | Added rational-form comparison and moving/extension targets on native IsAlbanese. |
| §4.0c natural integration | I(a,a); A¹ from 0 to 1; G_m from 1 to p; p=2 | Values 0,1,T; exact coefficient is zero and logarithmic coefficient is 1 | Added all-prime theorem and coefficient-extension API. |
| §4.0d natural reciprocity | Nonzero constant f; P¹ with ω=dt, f=(t−a)/(t−b); f=0 | Principal value a−b cancels the infinity index b−a; constant gives zero; f=0 excluded | Added independent natural reciprocity before harmonic identification. |
| §4.0e Jacobian bridge/topology | P¹; split multiplicative elliptic curve; valuation K×→K | Trivial Jacobian; compactness without good reduction; noncompact K× admits a nonzero locally constant homomorphism | Added compact open subgroup H and local-section/moving bridge; no false noncompact vanishing. |
| §4.1 logarithmic residues | xy=π, f=x; constant f; zero f | Res dx/x=1=ord_head−ord_tail; nonzero constants give zero; f=0 excluded | Bound residue and natural-integral producers. |
| §4.2 harmonic comparison | Tree; cycle; exact/log forms; smooth residue domains versus annulus | A cyclic jump can survive; derivative agreement alone is insufficient; Tate differences −1/3,−2/3 are unequal | Removed circular whole-component premise; added domain negative control and compactness proof. |
| §4.3 valuation formula | F_tail=2,c=6,t=1/3; reversal; quadratic ramification | Both orientations give 4; refined jumps are 3,3; Tate corrections vary with valuation | Added annular negative control. |
| §4.4 point-sum | Z empty; second-kind cup value 1; global constant change | Empty sum on holomorphic forms is zero; second-kind representatives give 1; residues cancel constants | Retained statement with resolved inputs. |
| §5.1 labelled auxiliary data | All functions L with half-squares; all zero; pair constants (1,−1) versus (1,0) | Half-squares work at p=2; opposite shifts preserve pair sums; unrelated shifts fail | Imported analytic primitive/kernel theorem; retained new choice-data construction. |
| §5.2 triple characterization | (1,1;L), (z,z;z⁻²), (z,z⁻¹;L), all L with half-squares | Values 1,−2,1,0; symmetry and three-term law agree | Retained; auxiliary labels remain part of the domain. |
| §5.3 triple choice changes | (L,0;L), auxiliary shift 1 or 2 | Changes −1 or −2 despite the zero function slot; F,G-pair change has no effect | Retained negative signs and actual auxiliary dependence. |
| §5.4 simple-pole formula | (2+L,3;L); all L; u=az | Value 6 for zero relevant constants; all half-squares give zero; constant term changes by −δ under transport | Retained simple-pole hypothesis and parameter-dependent coefficient functional. |
| §5.5 triple pullback | Degree 1,2; reversal; shifting one primitive after pullback | Factors 1,2,−1 only with every auxiliary entry transported | Retained. |
| §6.0 actual-form symbol relations | Analytic gη; G dC; nonzero [dG]⊗η | Analytic and zero forms have zero symbol; a nonzero symbol forbids a zero actual form | Added relation theorem before pairing descent. |
| §6.1 global triple | Zero triple; rational core; T(F,1;H) with B_U(F,H)=1 | Values 0,0,1; dependence cannot factor through [dG] | Bound full Coleman algebra and compact-pairing input. |
| §6.2 global laws | Add 2 to G; globally shared shift; shift at only one of two ends | Changes 2,0,−1 when B=1 and end residue=1 | Bound residue/reciprocity input; retained global-choice qualification. |
| §6.3 q-eigenspace theorem | q=2; zero eigenclass; G=1 with F outside q-eigenspace | Vanishing includes zero; the counterexample T=1 needs exclusion by the eigenclass hypothesis; reciprocal is 1/2 | Bound §3.1a spectrum/radical and §3.0b algebra. |
| §6.4 pairing on forms | 1 dH; G dC; two presentations of d(GH) | Values B,0; actual product relations must be killed, not stipulated | Uses independently proved §6.0. |
| §7.0 Tate differential/chart bridge | q=p³; n=1,2; q=1; p=2 | dlog(z/q)=dz/z while log values shift; loop/parallel-edge data essential; q=1 excluded | Added actual analytic differential/chart producer. |
| §7.1 branch transport | Equal branches; u=p; ramification e=2; exact form | Changes 0,Δλ,Δλ/2,0; varying annular valuation cannot be replaced by a constant | Bound §4.0c and imported base branch laws. |
| §7.2 proper holomorphic case | P¹; elliptic curve; nonproper G_m; extended endpoints | Proper coefficient of T is zero; G_m gives T and shows properness is needed | Imports abelianLog and uses the owned natural/Jacobian comparison. |
| §7.3 coefficient trace | Identity; K-defined scalar; α²=π; ramified p=2 extension | Tr(a)=[L:K]a; Tr α=0, Tr α²=2π; characteristic-zero averaging is legitimate | Bound natural base-change input; kept existing Galois API name only once. |
| §7.4 closed-point divisors | [t²−π]−2[0] with ω=t dt; zero divisor; one rational point subtraction | Value π; zero; degree-one counterexample is basepoint-dependent | Retained residue-degree definition and degree-zero hypothesis. |
| §7.5 traced indices | Quadratic point; rational point; empty set; trace of product | Residue 1 contributes 2; rational trace is identity; product of traces is generally wrong | Retained whole-scalar trace and local auxiliary qualification. |
| §7.6 realization descent | Good reduction; ramified splitting; common refinement; quadratic constant field | Comparison is through intrinsic §4.0c; scalar 1 in a quadratic constant field traces to 2 | Bound producing interfaces; no arbitrary whole-curve triple construction. |
| §7.7 Tate normalization | q=p³, log(p)=1; n=1,2; q=1; p=2 | F=log z−ν_p(z), jump −1; q-periodicity and branch cancellation hold; n=0 excluded | Bound §7.0 and retained all-prime normalization. |

Every denominator is controlled: positive rational lengths, positive subdivision degree, nonzero integers in characteristic zero, positive Tate valuation, or a nonzero finite extension/group order. Zero rings and characteristic-p coefficient fields are excluded by actual field/CharZero hypotheses; p-adic residue characteristics 2 and 3 remain included. Formal characteristic-zero fields do not acquire analytic completeness assumptions. Geometric fields are finite over ℚ_p, hence finite extensions used in trace/descent are separable. Geometric Frobenius and logarithm-parameter differentiation remain distinct.

## Checks and maintainer action

The final prescribed dependency check, on `packages/ColemanIntegrationPartII/design/README.md`, exited **1** with exactly:

```text
NOT IN ORDER: ColemanIntegrationPartII (insert it after its last supplier)
depcheck: 3 roadmaps, 10 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line, but this is **not a successful dependency certification**. An earlier intermediate run, before explicitly binding the generic rigid-cohomology supplier, likewise exited 1 with nine edges; the final ten-edge result above supersedes it.

Manual external-edge audit: RigidAnalyticGeometry, StableReduction, JacobianChallenge and EllipticCurves are on content main. The other suppliers occupy order positions 5 (ResolutionOfSingularitiesCharacteristicZero), 93 (PadicDifferentialEquationsAndRigidCohomology), 101 (ColemanIntegration) and 127 (AnabelianGeometryAndNonabelianChabauty). All are authorized suppliers; the extension itself has no position. Register the extension after its suppliers, at least after position 127, and rerun the same design check. After package generation, check the generated package README as well. The gate sees only three roadmap texts, so its edge count cannot replace this manual supplier audit.

Additional checks completed:

- JSON and TOML parsing: **PASS**.
- README/plan statement, hypothesis, API, Check and source-ID agreement: **PASS** for 44 targets, 12 definition targets, 121 API entries and 142 Checks; every target has at least three Checks.
- Internal dependency audit: **PASS**, all 110 explicit target edges point strictly earlier; no duplicate target/API names or unresolved `gap:` references.
- `git diff --check`: **PASS**.
- Machine-path scan of edited design files and manifest: **PASS**.
- Lean elaboration and Check examples: **not run**. There is no Suggested.lean in this design package, no such file is permitted for editing, and the brief supplies no executable Lean command. This is not a successful Lean build or a certification of generated signatures. A generated Lean file must mirror the final README, including the graph bridge and its signs.

Existing target names were preserved. The missing natural-integration and analytic comparison ownership moves into this extension, without changing any supplier roadmap. The original §3.1 definition now leaves analytic-exact/rational-core/cup/reciprocity proofs to §3.1a; affected consumers depend on that target. No existing consumer-facing name was renamed or deleted. Newly named prerequisites do not require earlier roadmaps to depend on Part II. No commit, push, issue/PR write, tooling edit or merge-order edit was made. F06 remains an external registration blocker; independent review is still required.
