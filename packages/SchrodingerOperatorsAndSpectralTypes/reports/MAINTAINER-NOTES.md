# Maintainer notes: SchrodingerOperatorsAndSpectralTypes

These notes come from a comparison of the design with UnboundedOperators (open pull request
#1027), SelfAdjointSpectralTheory (main) and QuantumFoundations (open pull request #1771). They are
claims to check, not findings. Passages are named by section; no line number is given because the
heads move.

## Supplier citations that may not say what the design takes from them

1. The scope says unbounded potentials (L^p, Kato class, Coulomb) belong to UnboundedOperators
   UO-E06. UO-E06 treats V ∈ L² + L^∞ on ℝ³ only and leaves Coulomb to a consumer; L^p and the Kato
   class appear nowhere in that roadmap.
2. Self-adjointness of the restrictions to the pp, ac and sc subspaces is attributed to UO-C03 in
   general. UO-C03 lists it only in the case of a finite control measure; in general it states the
   commuting projections, domain preservation and reconstruction. 1.3 supplies the missing step,
   and the citations should say that.
3. "Weyl's criterion (UO-C02)" is cited in several places. UO-C02 uses a singular Weyl sequence
   inside one proof and has no Weyl criterion among its stated items.
4. 4.4 says that V is relatively compact for H₀ by 4.3. 4.3 proves that M_V (H₀ + 1)⁻¹ is compact.
   The supplier's notion (UO-E04) is compactness of V (A − i)⁻¹ with dom A ⊆ dom V. No text states
   the passage between the two resolvent points.
5. The baseline says the spectral measure of A_P := ∫ λ dP is P, citing SA-E44. SA-E44 needs the
   resolvent formula for A_P, which UO-A02 proves only when P is the spectral measure of a given
   operator. No supplier states it for a bare projection-valued measure.
6. The contract lists SA-E26–SA-E29 and omits SA-C86, while Layer 1 uses SA-E30 and SA-C86.
   `plan.json` lists both.

## What the comparison found in order

For the record, so that it is not reopened without a witness. The pp, ac and sc subspaces are
taken from UO-C03 and not redefined. The free Laplacian in every dimension is taken from
QuantumFoundations §8.2, with UO-E06 as the three-dimensional Check. The design is the more general
text, and so the owner, for: reducing subspaces of any closed subspace whose projection commutes
with the spectral measure (1.3); the named spectra σ_ac, σ_sc, σ_pp; and −Δ + V in every dimension
for bounded real V (4.3–4.4). In dimension three the self-adjointness and core clauses of 4.4 are
special cases of UO-E06: check that 4.4 says so.
