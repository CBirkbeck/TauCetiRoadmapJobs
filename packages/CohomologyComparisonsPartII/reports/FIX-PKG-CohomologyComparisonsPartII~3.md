# CohomologyComparisonsPartII repair report

## F01 (P2) — applied differently

31 registry gaps → 32. Added `local-period-fundamental-sequences` for PadicHodgeTheory with the README’s exact needs and `neededBy: ["4.2", "4.4"]`. Restricted `period-rings` needs and section to the coefficient-ring contract. Added explicit supplier-gap lines and README prerequisite links. JSON target prerequisite arrays remain unchanged because only top-level `gaps` edits are authorized.

Evidence: CN line 973–980 distinguishes the Artin–Schreier, crystalline and annular sequences, including their error powers, domains, lattices and continuous sections. CN line 1234–1239 supplies the filtered Poincaré comparison. EN line 299–308 supplies the ordinary and modified coefficient-period constructions. These are distinct contracts; reassigning the chart theory to PadicPeriodRings merely to preserve the old registry would reverse the README’s ownership division.

The proposed registry repair is now within the permitted files. Its proposed edits to target prerequisite arrays are outside the permitted part of `design/plan.json`; the new gap’s `neededBy` and the README’s §4.2 and §4.4 prerequisite lines record both consumers without changing those arrays.

## F02 (P3) — applied

The three §6.5 Check labels `RelativeCohomology.affineOverconvergentAcyclicity_*` → `RelativeCohomology.continuousDifferentialComparison_*`, retaining suffixes `affineLine`, `gM` and `properCounterexample`. Mathematical content is unchanged.

Evidence: AM line 612–620 proves coefficient acyclicity using an affine embedding and cofinal affinoid neighbourhoods. AM line 639–645 gives the relative continuous-differential comparison under the stated higher-cohomology vanishing, including the coherent case. On the dagger affine line integration preserves overconvergence; on the dagger multiplicative group its missing Laurent primitive leaves `K dlog t`. Proper GAGA gives `H¹(E_K^an,O)=K` for an elliptic curve. Thus these Checks belong to the relative comparison and its affine boundary, while the underlying coefficient-vanishing theorem remains an imported contract.

## F03 (P3) — applied

Five §1.1 labels `FilFMIC_*` → `FilFMIC.ofData_*`. The §1.4 Check `FilFMIC.fiberCoordinatesDifferential_zero` → `FilFMIC.fiberCoordinatesDifferential_zeroInput`; the API theorem keeps its original name. No definition, theorem signature or example changes.

Evidence: AM line 131–154 specifies the coefficient data and compatibility conditions; AM line 173–174 specifies the unit. AM line 255–258 fixes the fibre-coordinate signs. The zero-input Check computes the zero value of the same map already tested by the second proved Layer 1 example. The zero object, unit, nonhorizontal datum, ramified obstruction and generic-only realization remain discriminating tests of `FilFMIC.ofData`.

## Checks and source verification

- **Elaborate `Suggested.lean`: not available**, as specified in the brief. No Lean command was run; no elaboration success or elaborated `#check @name` result is claimed.
- **Dependency direction:** exit status 0, exact output:

```text
depcheck: 4 roadmaps, 30 edges, 0 problem(s)
```

  There is no UPWARD or CYCLE line.
- **Whitespace check:** `git diff --check` exited 0 with no output.
- **Edit boundary:** compared parsed JSON before and after: every top-level value except `gaps` is identical. Only the `period-rings` gap changes and the new chart gap is added. README edits are confined to F01–F03. `Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged.
- **Registry consistency:** all 32 registry `needs` strings occur verbatim in the README. Both repaired contracts have explicit `What <Supplier> must provide (gap:<slug>):` lines. The new gap names PadicHodgeTheory and the exact CN locators and lists both consumers.
- **Name consistency:** all 113 Check labels are unique and namespace-qualified. All nine Lean declaration names occur in the README. The nine obsolete Check labels are absent; the zero API name remains. No renamed Check label is a Lean declaration.
- **Lean shape:** unchanged 169 lines, one `import Mathlib`, five real-bodied definitions, four theorem targets and six proved examples. No `set_option`, sorry-valued data or admitted example. Hypotheses of the four targets are explicitly bound; the geometric statements whose carriers are absent remain in the README.
- **Sources:** all 23 certified manifest entries have their supplied cached extractions. BesserII remains `uncertified`, which the brief treats as settled; it is not needed for these repairs. No new reference is needed and no missing-source request is added. Source text was read from the supplied legal cache and was not copied into the package.
- **Sibling and pin boundaries:** read main-branch ComplexTori, LocalGaloisGroups and PadicMeasuresIwasawaAlgebras for roadmap form; inspected ArithmeticDynamics, ErdosProgressionPowers and QWittVectors’ available roadmap text for overlapping ownership. None supplies these coefficient or CN chart targets. The content manifest pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The matching cached source files confirm the imported cone, scalar, exact-structure and Ext boundaries: MathlibCone line 61–92; MathlibPadicLattice line 580–588; TauCetiExactReview line 245–267; TauCetiExtReview line 54. In particular abelian Ext does not discharge exact-category Yoneda theory. No new library object or duplicate theorem is introduced.

## Adversarial mathematics pass

Rows cover the definitions, stated identities, API claims and conventions of the indicated subsection together. These are mathematical checks, not claims of Lean execution. Existing boundary Checks already record the instances; the repairs require no additional theorem or carrier.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: AM base Frobenius | Unramified V; π²=p at p=2,3 | In the ramified example v(F(π)−π^p)=1<2, contradicting reduction modulo p. Classical layers require no such lift. | None |
| Conventions: fibre, shift and connecting sign | Multiplication 2 on ℚ; zero maps; identity map | Differential has +f and −d_B; multiplication-2 fibre is acyclic; connecting representative is (0,b). | F03 label only |
| Conventions: twists and products | O(1)⊗O(−1); dlog t; odd cohomological degrees | Twist exponents add; φ(dlog t)=p dlog t; product sign is (−1)^(ij), with no division by 2. | None |
| Conventions: fields, empty and generic-only schemes | Zero modules; empty scheme; Spec(K)/V | Field denominators are nonzero; empty realizations vanish; generic-only de Rham data need not vanish. | None |
| 1.1 coefficient category and realization functors | Zero; unit; Φe=te on G_m; B†=0 | Φe=te is not horizontal; de Rham realization is faithful, rigid realization need not be. | F03 labels |
| 1.2 tensor, dual, pullback and lift change | Twist ±1; zero factor; identity base map | Evaluation and twist cancellation agree; pullback through isocrystals needs no equality of chosen lifts. | None |
| 1.3 exactness and Yoneda operations | Split extension; zero coefficient; identity between differently filtered lines | Underlying-module identity can fail strictness; exactness is on every filtration step. | None |
| 1.4 connection fibre and coordinate API | O(0), O(1) at F_p; inputs (1,0),(0,1),(0,0) | Point groups and coordinate images (0,2),(0,−1),(0,0) agree with the chosen fibre. | F03 zero-input label |
| 1.5 extension evaluation | i=0; split class; Φe=e−h | Identity evaluates to 1; split class to zero; nonsplit class to (0,h). | None |
| 1.6 injectivity and projections | F⁰H=0; Φe=e+ah; F⁰H≠0 | Unique lift gives R=−ah; without F⁰H=0 lifts differ by ch. | None |
| 2.1 specialization diagram | Point; empty scheme; Spec(K)/V | Maps are K0→K and id_K at the point; K→0 on the generic-only example is not an equivalence. | None |
| 2.2 rigid syntomic fibre | V=Z_p, r=0 and r>0; empty special fibre | Point groups are (H⁰,H¹)=(Q_p,Q_p) or (0,Q_p); generic-only fibre is filtered de Rham. | None |
| 2.3 exact sequence, products and elimination | Point; G_m; empty product; K=K0 | Eliminating a=sp(b) produces the stated single fibre without assuming sp invertible. | None |
| 3.1 divisible PD coefficients | r=0; p=2,r=1; division modulo p | Small-weight equality includes p−1; multiplication by p modulo p does not specify a divided image. | None |
| 3.2 divided and undivided fibres | Weight zero; zero map A→B; empty log scheme | Fibre retains H¹=B; replacing it by a kernel would fail. | None |
| 3.3 error maps and cups | r=0; multiplication p on Z/p²; odd classes at 2 | Composite p^r identities bound error without yielding an integral inverse or multiplicativity of τ. | None |
| 3.4 presentations and derived completion | r=0; rationalization; tail tower ⊕_(j≥n)F_p; trivial-log point | Quotient at r=0 is zero; inverse is p^(−r)τ; lim¹ is ∏F_p/⊕F_p; point H⁰=H¹=Q_p. | None |
| 4.1 actual Tate lattices | r=0; p=2,r=2; r=p−1 endpoints | EN generator 1/8 and CN generator 1/4 differ by 2; finite-level inclusion can be zero; endpoints differ by p. | None |
| 4.2 periods and sites | Weight zero; trivial-log Spec(Z_p); nonproper X | j starts at U=X_tr∩X[1/p]; no replacement of closed nearby-cycle sections by generic cohomology. | F01 gap linkage |
| 4.3 exact comparison | p=2,3; inverse Cartier on t dlog t; undivided fibre | Exact ranges are r≤0 and r≤1; C⁻¹ gives [t^p dlog t]≠0 although [dt]=0; undivided errors remain. | None |
| 4.4 bounded comparison | xy=π^h, h>1; p=2,r=1; q>r | Ramified charts retained; p=2 dimension dependence retained; no claim above r. | F01 gap linkage |
| 4.5 étale gluing | Empty closed part; j′=id; unit | Open restriction is the actual direct image; identity open period and closed period glue with the stated triangle. | None |
| 5.1 HK adapter | Rank-one point; rank-two monodromy block; non-Cartier chart | Same supplied φ is used; Nφ=pφN; non-Cartier Frobenius can kill a nonzero nilpotent. | None |
| 5.2 semistable fibre and normalization adapter | Zero modules; p=2,r=0,1; e=0,1,2 | D1D0=p^(−r)(pφN−Nφ)=0; scale is −1/e; scalar equations survive e=0 but equivalence does not. | None |
| 5.3 h-realization compatibility | Identity presentation; p=2; r=0 | Uses the canonical supplied pair map; rational periods retain τ≤r. | None |
| 6.1 relative datum | Identity family; empty U; P¹/S | Degrees 0,1,2 give O,0,O(−1) for P¹; datum alone asserts no open-family finiteness. | None |
| 6.2 filtered realization | Zero datum; c=0 in rank one; U=D(pt−1) | Promotion rejects zero comparison and nonfinite algebraic localization despite coherent rigid realization. | None |
| 6.3 good compactification | Constant G_m; no horizontal divisor; sections x=0,x=t | Constant examples satisfy total and relative conditions; colliding sections fail the relative condition. | None |
| 6.4 sufficient geometric settings | Proper curves of genus 0,1; constant G_m; p=2 | Ranks 1,2g,1 and φ(dlog)=p dlog agree; algebraic Hodge hypotheses remain separately supplied. | None |
| 6.5 continuous-differential comparison | A¹; G_m; proper elliptic curve | H¹=0, K dlog t, and coherent H¹(E,O)=K distinguish affine hypotheses and coefficient acyclicity from de Rham cohomology. | F02 labels |
| 6.6 residues and extension pushout | Split G_m boundary; nonsplit quadratic boundary at 2; empty D | Residues (1,−1) sum to zero; nonsplit trace-zero Frobenius is −2; proper empty-boundary curve retains H². | None |
| 6.7 geometric extension projections | Split class; G_m with n=1; n=0 | Twist n+1 gives O(1) and residue twist 1 on G_m; n=0 remains valid. | None |
| 7.1 Frobenius-point lifts | σ(t)=t^p at 0,1; arbitrary lift p; σ(t)=t^p+p | Canonical values are Teichmüller; arbitrary lift p fails compatibility; shifted compatible lift is p modulo p². | None |
| 7.2 point detection | Rank zero; constant 1; k=F_p and t^p−t | Rank zero allowed; finite residue field misses a nonzero section, so algebraic closedness is necessary. | None |
| 7.3 specialization of extensions | Split extension; identity point; evaluation t=p | Compatible points preserve the filtered lift and R; incompatible evaluation need not define absolute Frobenius data. | None |
| 7.4 horizontal-log/rigid comparison | W(k) point; P¹ minus 0,∞; vertical-log point at r=1 | Horizontal point H¹=Q_p; vertical-log C_st point H¹=Q_p²; horizontal log structure is essential. | None |
| 7.5 absolute extension value | Curve r=2; split class; missing filtered vanishing | Connecting value has positive sign; split value vanishes; without both vanishing hypotheses no inverse is exported. | None |
| Supplier contracts: period coefficients and chart sequences | r=0; p=2; endpoint lattice; s=0 | CN domains, error powers and continuous sections remain explicit; Poincaré error p^s becomes exact at s=0. | F01 registry split |
| Supplier contracts: realizations, finiteness and residues | Generic-only component; constant family; nonsplit D; proper U | Algebraic finiteness, horizontal-log comparison, trace and affine boundaries remain independent requirements. | None |
| Supplier contracts: crystalline, h-descent and exact Yoneda | r=0; non-Cartier fibre; nonabelian exact category | Quotient and pair domains retained; abelian Ext and a standard-syntomic morphism predicate do not supply these theories. | None |

## Maintainer consequences

The intake can now announce `gap:local-period-fundamental-sequences` to PadicHodgeTheory. PadicPeriodRings’ announced contract no longer includes CN chart theory. These remain supplier obligations, not assertions that another roadmap already states the extension.

If the design target prerequisite arrays are synchronized in a separately authorized edit, §4.2 and §4.4 should each acquire `gap:local-period-fundamental-sequences`. This package records their incidence through the permitted `gaps` field and README. No merge-order change is required. No mathematical target or Lean declaration cited by another roadmap was renamed; only nine README Check labels changed. No commit, push or GitHub write was made.
