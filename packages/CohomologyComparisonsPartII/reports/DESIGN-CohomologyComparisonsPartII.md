# Design report: CohomologyComparisonsPartII

The design in `packages/CohomologyComparisonsPartII/design/README.md` and `packages/CohomologyComparisonsPartII/design/plan.json` contains seven layers and 33 targets. It covers all seven filed final interfaces. It is a mathematically specified design with explicit prerequisite gaps, not a certification that unavailable supplier roadmaps contain the required contracts. The missing base and supplier texts prevent a complete ownership reconciliation. No Lean file was requested or written, and no Lean command was run.

## Coverage and ownership

| Filed final interface | Design coverage | Ownership retained elsewhere |
| --- | --- | --- |
| Rigid syntomic cohomology on natural bases | 2.1–2.3: actual specialization diagram, Q_p-linear two-component fibre, exact sequence, descent, products and K=K0 elimination | General rigid and filtered algebraic de Rham realizations remain their named suppliers’ work. |
| Divided and undivided log-syntomic theory | 3.1–3.4: higher-level divisibility, both fibres, error maps, products, local PD presentations, gluing and completion | Sites, log geometry and filtered crystalline Poincaré theory remain CrystallineCohomology contracts. |
| Exact and bounded period comparisons | 4.1–4.5: both lattice normalizations, maps, precise small-weight comparison, all-weight ramified bounds and syntomic-étale gluing | General period rings, nearby-cycle topoi and local analytic/Galois tools have explicit required contracts. No result of the consumer regulator roadmap is used. |
| HK, semistable targets and rational descent | 5.1–5.3: carrier and classical adapters, signed total fibre and transport of base-owned h-comparisons | Proper HK theory, enhanced arithmetic-pair HK theory and h-descent remain existing owners’ obligations. The Part II does not plan another h-descent theorem. |
| Fil-F-MIC and extension evaluation | 1.1–1.6 and 6.7: exact category, tensor/Tate/pullback, coefficient fibre, all-degree evaluation, injectivity and geometric projections | GrothendieckEulerForms Layer 0 supplies ExactStructure. A proposed Part II must supply general exact-category Yoneda Ext; Mathlib abelian Ext is insufficient. |
| Relative realizations and curve residues | 6.1–6.7: datum, guarded promotion, both sufficient geometric settings, affine acyclicity, nonsplit finite étale residue target and Ext maps | General relative rigid finiteness and filtered relative de Rham/Gysin inputs require accepted supplier sections. |
| Frobenius points and absolute values | 7.1–7.5: point lift, detection, extension specialization, horizontal-log/rigid bridge and the connecting-map absolute value | AM symbol-to-Ext and symbol/regulator comparison, its (−1)^n and restricted application hypotheses remain PadicHodgeRegulators. |

The README reads like a roadmap, with hypotheses, named API, proof chains, locators, Checks, examples and dependencies. It does not turn the target catalogue into a numbering table. Every target has a source locator. All nine entries marked `definition` have at least three Checks; constructions that introduce objects also have at least three. The plan has no invented prerequisite kinds.

No theorem about general open-family coherence is inferred from the existence of a smooth family. The promotion interface exposes the all-degree coherence and comparison conditions, and the separate geometric Hodge input remains a recorded contract. No base-owned item is reintroduced as a new foundation. The retained HK and h-statements are named transport adapters on shared carriers, not new constructions of those theories.

## Inputs and duplicate-by-object audit

The supplied main tree was checked at commit `0e8b058a97cc4f9401d2679313e0e937761c1024`. The roadmaps read for form and mathematical boundaries include AdicSpacesPartIV, EnhancedDerivedSheaves, RigidAnalyticGeometry, EtaleCohomologyFoundations, GrothendieckEulerForms and DerivedModuleAlgebra. StablePeriodicCurved was checked to trace ownership of its exact-category input back to GrothendieckEulerForms Layer 0. The relevant section statements were read, including the dagger differential and strict-neighbourhood interfaces, enhanced inverse-limit contract and linear-functional Koszul complex.

CohomologyComparisons, CrystallineCohomology, PadicPeriodRings and PadicDifferentialEquationsAndRigidCohomology have no README in the supplied main tree. Reads at their main paths at that same commit also returned 404. Their declared ownership is preserved; exact sections are not fabricated. The board contains a ColemanIntegrationPartII target and source manifest but no supplier design filling these contracts. Its comparison dependency is bound here to the producer interfaces, while its integration and index theory stays downstream. Neither PadicHodgeRegulators nor EllipticRegulators has a supplied design to certify additional consumer demands.

Both supplied open roadmap heads were inspected: ArithmeticDynamics at `1921611a7a96ac19fb15c2b1291b35958c3ef0cb` and ErdosProgressionPowers at `e101259371172a32b3dd13e926676ae33b6af5cd`. Their scope/ownership sections introduce no classical syntomic, filtered Frobenius connection or relative residue supplier consumed here. They add no dependency. ArithmeticDynamics’s large README required the Git blob read after the contents endpoint returned empty content; the blob’s scope was read directly. No instructions in issue or pull-request text were treated as authority.

GitHub code search located the isocrystal, cone and standard-syntomic objects, followed by reads of their actual Lean statements at the two library pins. Complete pinned file trees were inspected (Mathlib: 10,680 entries; Tau Ceti: 13,144 entries, neither truncated). Object searches covered syntomic, crystalline, rigid cohomology, isocrystals, connections, exact categories, Yoneda and mapping cones, rather than just proposed names. This is an object/file audit, not a claim that a name search proves the absence of every possible formalization.

The consumed declarations and their variable blocks are recorded in the README’s exact supplier contracts and in the manifest’s pinned-code records. In particular, Isocrystal stores a semilinear equivalence, its classification theorem requires algebraic closedness and rank one, HasExt is under `[Abelian C]`, mappingCone has a biproduct hypothesis, and Tau Ceti’s standard-syntomic predicate is a flatness/presentation/dimension property. None supplies Fil-F-MIC or syntomic cohomology. No corresponding existing API was planned anew.

## Adversarial mathematics pass

Each row covers the target’s statement, defining data and named API. A retained gap means the proof chain is explicit but its supplier section is unverified; it is not a passed proof or an axiom containing the conclusion.

| Statement | Instances tried | Result | Change or retained guard |
| --- | --- | --- | --- |
| Base, scalar and coefficient conventions | p=2,3; finite and infinite perfect k; ramified and unramified V; equal characteristic; zero ring | Mixed characteristic base fields/DVRs exclude equal characteristic and zero base rings V; empty coordinate rings are allowed. No finite-residue hypothesis is used. | Keep K0 and K distinct and Frobenius fibres Q_p-linear. X_n means mod p^n. |
| AM base convention | V=Z_p[π], π²=p, including p=2 | A p-Frobenius modulo p cannot exist: image of π has valuation 1, whereas π^p has valuation at least 2. More generally this forces e=1. | Do not imply that AM’s strong lift exists on ramified traits. Classical ramified targets remain unrestricted by it. Added 1.1 negative control. |
| Cochain and connecting signs | Zero map; multiplication 2 on Q; (0,b) in a fibre | Fibre degrees 0,1 and d(a,b)=(da,f(a)−db) give d²=0 and positive connecting representative (0,b). | Require an explicit cone-coordinate adapter; do not infer a sign from the notation cone[-1]. |
| Tate, monodromy and residue conventions | O(1)⊗O(−1); dlog t; rank-two (φ,N) datum; t and 1/t | φ(dlog t)=p dlog t; Nφ=pφN; residues 1 and −1; positive uniformizer exponential. | Distinguish twist −1 in H¹(G_m) from twist +1; lower HK exponent is r−1 as an integer. |
| 1.1 FilFMIC | Rank 0 and 1; Φ(e)=t e with trivial connection; ramified base above; generic-only S=Spec(K) | Zero and unit objects satisfy all axioms; the t multiplier is nonhorizontal; ramified strong-lift hypothesis fails. | Require module isomorphism, continuous differentials, horizontality and locally free graded pieces. No algebra structure on coefficients. Only de Rham realization is claimed faithful: the rigid component vanishes on generic-only S. |
| 1.2 Tensor, Tate, dual and pullback | m=0,1,−1; zero tensor factor; identity base map; changed σ | Tensor cancellation and dual evaluation have the stated filtration and Frobenius; noncommuting base maps need isocrystal transport. | Import change-of-σ equivalence, including its cocycle; no naïve Frobenius tensor formula on a noncommuting square. |
| 1.3 Exact structure and Ext | Split extension; zero coefficient; underlying identity between two differently filtered rank-one objects | The underlying identity can be a morphism without a filtered inverse or strict admissibility. | Exactness is tested at every filtration step. General Yoneda theory is an explicit Part II gap, not an abelian instance. |
| 1.4 Coefficient fibre | Point O(0), O(1), zero coefficient; two-term map 2 | At k=F_p the groups are Q_p in degrees 0,1 for O(0), only degree 1 for O(1). | Keep filtered source A_H and σ on forms; verify d² by transversality and horizontality. |
| 1.5 Extension evaluation | i=0; split sequence; Φ(e)=e−h over a point | Identity evaluates to 1; split class to zero; last extension to (0,h), nonzero. | Evaluate the distinguished class 1 without claiming H⁰(S(O))=Q_p on disconnected bases. |
| 1.6 Injection and representatives | F⁰H=0; H=O(1) with Φe=e+a h; F⁰O(0) nonzero | Unique lift exists only with F⁰H=0; representative is (0,−a h) at the point. | Explicit remainder sign and change-of-σ formula; projections without the filtration guard are rejected. |
| 2.1 Specialization diagram | Spec(V); empty X; Spec(K) as a smooth V-scheme | sp=id_K at the integral point, zero for empty X, and K→0 for generic-only X. | General sp is not an equivalence; retain actual comparison map and presentation independence. |
| 2.2 Rigid syntomic fibre | V=Z_p,r=0 and r>0; empty special fibre | r=0 gives diagonal H⁰ and first-target H¹; r>0 gives H⁰=0,H¹=Q_p. Generic-only case gives filtered de Rham. | Preserve both A and C target components and Q_p-linearity; no blanket K0-linear claim. |
| 2.3 Exact sequence, cup, descent, unramified elimination | Point; G_m; empty scheme; sp noninvertible | The single fibre is obtained by eliminating an identity component, even when sp is not an equivalence. | Do not restrict this adapter to proper schemes or invert sp. Cup sign and φ/p are fixed by dlog t. |
| 3.1 Divisible PD coefficient | r=0; p=2,r=1; n=1 | J^⟨0⟩=O; small-weight equality at r=1 does not expand the period-isomorphism range. Division modulo p is nonunique. | Divide at a higher level before reducing; include s-independence and reduction API. |
| 3.2 Two log-syntomic fibres | r=0; zero chain map; empty log scheme | Divided and undivided agree at weight zero; an ordinary kernel loses H¹ of a zero-map fibre. | Preserve derived pushforward and distinguish syntomic from étale site. |
| 3.3 ω,τ and products | r=0; multiplication p on Z/p²; odd degree and p=2 | Composite bounds do not imply an isomorphism; no division by 2 is used for odd-degree products. | Keep p^r errors and the source’s restriction of multiplicative comparison to ω; no multiplicativity instance for τ. |
| 3.4 Presentations and completion | r=0; rationalization of τω=p^r; arbitrary coherent tower | Rational inverse is p^(−r)τ; an underived limit is not a general replacement for Rlim. | Local-PD and derived-reduction hypotheses remain explicit supplier inputs. |
| 4.1 Modified lattices | r=0; p=2,r=2,n=1; r=p−1 | At p=2,r=2, EN generator is 1/8 versus CN 1/4. Inclusion reduces to zero modulo 2. CN’s two endpoint choices differ by p. | Use actual lattices and quotient coefficients. Track factorial valuation and endpoint error; do not divide elements of Z/p^n. |
| 4.2 Period maps | r=0 unit; horizontal boundary; nonproper X | Weight-zero maps coincide and send 1 to 1. The target is nearby cycles on X0. | Do not identify nearby-cycle global sections with generic-fibre cohomology; use 4.5. |
| 4.3 Exact comparison | p=2,r=0,1; p=3,r=0,1,2; undivided r>0 | Exact divided range is r≤p−2; positive r is excluded at p=2. | No integral transfer through ω at positive weight, and no all-weight exact assertion. |
| 4.4 Bounded comparison | Ramified chart xy=π^h,h>1; p=2,r=1; q>r | Base-change charts are included; p=2 retains dimension dependence in c_p. No q>r conclusion follows. | Quantify A(e,p,r) before X,n; retain refined and general bounds separately. Missing local intermediate tools are listed precisely. |
| 4.5 Syntomic-étale gluing | Generic restriction; empty closed part; weight-zero unit | Open restriction is Rj′_* of the actual lattice; zero closed part leaves the open object. | Give E and E′ for all weights with modified coefficients; identify ordinary lattice only in the small range. |
| 5.1 HK adapter | Good-reduction point; rank-two φe1=p e1,Ne1=e0; non-Cartier Kummer log chart | Nφ=pφN and positive change law hold; log smoothness alone does not imply invertible φ. | Require Cartier type and properness for HK Theorem 5.1; use the existing Isocrystal class. |
| 5.2 Semistable total fibre | r=0,1,2; rank-two datum; D=E=0 | Bottom exponent r−1 gives commutativity. At r=0 it is 1−pφ. | Do not use truncated natural-number subtraction or repeat the top Frobenius exponent. Enhanced arithmetic-pair HK is a separate contract. |
| 5.3 Rational h-adapter | Identity presentation; p=2, arbitrary r; r=0 | Base h-realization supplies truncated comparisons, not an untruncated integral statement. | Import uniqueness and period theorem; no second h-descent producer. |
| 6.1 Relative datum | Identity u; U empty; P¹/S | H⁰=O,H¹=0,H²=O(−1) for P¹; unqualified datum need not be admissible. | Construct c before claiming it bijective; no arbitrary-open coherence theorem. |
| 6.2 Promotion | Identity datum; zero degree; c=0 between nonzero rank-one modules; nonfree Hodge grade | Zero comparison fails promotion. Coherence alone does not certify a filtered object. | Explicit relative-hodge contract supplies locally free grades and transversality; only established base-change comparisons yield coefficient isomorphisms. |
| 6.3 Good compactification | Constant G_m over A¹; empty horizontal divisor; colliding horizontal sections | Constant model satisfies all clauses; colliding sections fail relative normal crossings even if total crossing is normal. | Keep log integrality, base Zariski type, total boundary and relative horizontal boundary separately. |
| 6.4 Two sufficient geometric settings | Constant genus 0 and genus g proper curves; constant G_m; p=2 | Ranks and twists agree with the realizations; no good-prime cut is needed. | Respect the AM strong-lift domain; general finiteness inputs stay with their existing owner. |
| 6.5 Affine acyclicity | A¹; G_m; proper elliptic curve | Dagger A¹ has H¹=0, G_m has K dlog t, but proper E has H¹(O)=K. | Correct the exported domain of AM Lemma 2.19 to smooth affine, as required by its affine-embedding proof. |
| 6.6 Open-curve residues and Ext | G_m; nonsplit quadratic étale boundary at p=2; empty boundary on proper curve | Res(dlog t)=(1,−1). Nonsplit trace-zero line has Frobenius −2. The proper empty-boundary ending would be false. | Keep affine U, connected fibres, finite étale D, twist −1 and the trace/Gysin map; Ext maps are coefficient pushouts. |
| 6.7 Geometric projections | Split extension; H¹(G_m)(2); n=0 | H¹(G_m)(2)=O(1); residue after twist lands in H⁰(D)(1). n=0 is allowed. | F^(n+1)H^n=0 makes projections unambiguous; AM §2.7’s extra H^(n+1) vanishing is separately retained. |
| 7.1 Frobenius point lift | a=0,1; Teichmüller point; t=p; σ=t^p+p | t=p is not compatible with σ=t^p; changing σ changes the distinguished lift. | Require compatible lifts at every finite level; no arbitrary-analytic-point claim. |
| 7.2 Detection of sections | Rank 0; x=1 on nonempty special fibre; finite k with t^p−t | Rank 0 works. Finite k has a nonzero section vanishing at all Teichmüller lifts. | Keep algebraically closed residue field and finite locally free completed-generic module. No Frobenius hypothesis is added to detection itself. |
| 7.3 Specialization | Split extension; point identity; incompatible lift t=p | R specializes as an absolute representative only at a Frobenius-compatible point. | Pull back δ through dP_a, which kills base one-forms. Tensor evaluation in the cotangent fibre is not claimed zero. |
| 7.4 Horizontal-log/rigid bridge | Point r=0,1; P¹ with two sections; adding vertical log | Horizontal point at r=1 has H¹=Q_p. Canonical-vertical-log C_st point has H¹=Q_p². | Explicitly distinguish log(D) over trivial-log W from log(D∪Y0) over canonical-log W. Do not use the h-adapter as an equivalence between them. |
| 7.5 Absolute extension value | Curve n=1,r=2; split extension; nonvanishing filtered hypercohomology | Curves have F²Ω•=0 and the connecting map gives the value; absent vanishing, a filtered contribution remains. | Use two filtered-complex hypercohomology vanishings, not an unexplained Hodge-group quotient. No extra (−1)^n is attached to the connecting map. |

The tests cover the required point, smooth proper curve, nonsplit open-curve boundary, ramified semistable chart, p=2, out-of-range weight, change of uniformizer and change of Frobenius. The trivial-group case is irrelevant to these targets; the analogous zero coefficient and point cases are checked. Equal-characteristic bases and zero base rings V fail explicit standing hypotheses rather than generating misleading instances; zero coordinate rings and generic-only components are retained. No statement is quantified over an unrelated arbitrary comparison map, coefficient object or complex while silently assuming its conclusion.

## Notions moved down and proposed Parts II

No prerequisite is taken from a later merge-order entry. No generic notion is moved from a verified later roadmap: the available consumers do not contain such a contract. The relative Fil-F-MIC/extension/residue/specialization producer requested by the filed target is placed here, before regulator and integration consumers. Their symbol and integration theory is not moved here.

Two extensions in existing owners’ directions are proposed, not planned again in this roadmap:

- GrothendieckEulerForms, Part II: essentially small linear exact-category Yoneda Ext, with zigzag representatives, Baer operations, splicing, exact-functor naturality and comparison with Mathlib abelian Ext. Layer 0 of the base supplies only the exact carrier. This is `gap:exact-yoneda`.
- EtaleCohomologyFoundations, Part II: the mixed-characteristic nearby-cycle and syntomic-étale topos/gluing interface beyond its F.1/F.3a. Its exact section and the owner of the required log-local Cartier calculation must be supplied. This is `gap:nearby-cycle-inputs`.

A filtered-relative-realization extension of CohomologyComparisons may also be needed for `relative-hodge`, but the base text is absent, so the report does not assert that it stops before that theorem. The same ownership caution applies to HK, rigid finiteness, period-ring and local comparison inputs. Nothing missing from an existing owner is authorized as a replacement foundation here.

## Gaps and source access

The plan records eleven prerequisite gaps: `base-ownership`, `crystalline-inputs`, `hyodo-kato-inputs`, `period-rings`, `rigid-realizations`, `relative-rigid`, `relative-hodge`, `nearby-cycle-inputs`, `local-period-analysis`, `exact-yoneda` and `rational-descent`. Every occurrence has a matching `neededBy` backlink, a missing-contract sentence, an owner and a section-status field. Known main sections are real imports; missing section contracts use only `gap:` prerequisites. The local comparison gap enumerates intermediate convergence, Koszul, Galois, approximation and étale tools, so the all-weight theorem is not used as its own proof hypothesis. These gaps are material: the design cannot certify complete backward closure to accepted supplier sections without them.

All six required mathematical texts were read at the used locators. CN’s lattice endpoint and enough-roots inequalities were additionally checked on rendered pages of the service-cached PDF. BesserI’s OCR-damaged display formulas were cross-checked with its explicit cone discussion and the legible AM equations (3.11)–(3.12); the ramified two-component map follows from the actual defining comparison diagram. No unread formula was silently assigned journal pagination. AM’s unramified horizontal-log bridge was kept separate from NN’s arithmetic-pair vertical-log producer.

Bühler and the five cited pinned Lean files were fetched through the source service. The raw source headers establish the open licence class. A failed landing-page resolution for the Mathlib isocrystal file was resolved with the licensed raw file at the pin; it is not an outstanding missing text. Source authors, titles, years, locators and citations were filled without altering service hashes or fetch provenance. The original BesserII entry remains `uncertified` as consumer-context provenance only; no target relies on it and no additional text from it was inferred. The missing-reference scratch record has no outstanding indispensable text. No extracted source or source PDF was copied into the package or report.

## Dependency check

The required dependency command was run against `packages/CohomologyComparisonsPartII/design/README.md` with name CohomologyComparisonsPartII and `merge-order/ORDER.txt`. Exact output:

```text
NOT IN ORDER: CohomologyComparisonsPartII (insert it after its last supplier)
depcheck: 3 roadmaps, 13 edges, 1 problem(s)
```

Exit status: 1. There is no UPWARD or CYCLE line. This is not a clean gate: the roadmap name is absent from the supplied order, so placement is unverified. The tool and order file were not edited. The worker must place this Part II after CohomologyComparisons and all actual suppliers and before PadicHodgeRegulators, ColemanIntegrationPartII and EllipticRegulators. Those three consumer names are also absent from the supplied order; no dependency on them was introduced.

An independent data-level check validates target acyclicity and every `target:` edge points backward; every named roadmap supplier is on the supplied main tree or in the permitted earlier list. No prohibited supplier or later-order roadmap is cited as a supplier. The tool’s count is reproduced literally rather than represented as a complete independent enumeration of the plan’s eleven supplier entries and prerequisite gaps.

## Data validation

The final structural check reports:

```text
Targets: 33
Definitions: 9
Named API entries: 120
Checks: 102
Source records: 13
Prerequisite gaps: 11
Target order: all edges backward
Supplier whitelist: main or permitted earlier list
Structural errors: 0
```

This validates schema fields, target and gap references, gap backlinks, source IDs and mandatory manifest metadata, test counts, API-name collisions across targets, target build order, supplier eligibility, README/data Check correspondence, repository-relative paths and formatting constraints. It does not replace mathematical proofs or verification of absent supplier sections. The adversarial table includes the tensor-extension and coefficient-fibre cup APIs through the cochain-sign and unit computations; their representative proof is the tensor bicomplex of 1.3–1.5.

Only the four requested deliverables were edited in the package. The target and merge order are unchanged. No helper agent was used. All mathematical judgments and edits were made directly; no GitHub write, source-code execution, or modification of a pinned library or the content tree was performed.
